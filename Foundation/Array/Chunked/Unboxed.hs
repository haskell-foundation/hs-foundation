-- |
-- Module      : Foundation.Array.Chunked.Unboxed
-- License     : BSD-style
-- Maintainer  : Alfredo Di Napoli <alfredo.dinapoli@gmail.com>
-- Stability   : experimental
-- Portability : portable
--
-- Simple array-of-arrays abstraction
--
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
module Foundation.Array.Chunked.Unboxed
    ( ChunkedUArray
    ) where

import           Data.Typeable
import           Foundation.Array.Boxed (Array)
import qualified Foundation.Array.Boxed as A
import           Foundation.Array.Common
import           Foundation.Array.Unboxed (UArray, PrimType)
import qualified Foundation.Array.Unboxed as U
import qualified Foundation.Collection as C
import           Foundation.Internal.Base
import           Foundation.Internal.Types
import           Foundation.Number
import           Foundation.Primitive.Monad
import           Foundation.Primitive.Types
import           GHC.ST
import qualified Prelude as P


data ChunkedUArray ty = ChunkedUArray (Array (UArray ty))
                      deriving (Show, Ord, Typeable)

instance PrimType ty => Eq (ChunkedUArray ty) where
  (==) = equal

instance Monoid (ChunkedUArray a) where
    mempty  = empty
    mappend = append
    mconcat = concat

type instance C.Element (ChunkedUArray ty) = ty

instance PrimType ty => IsList (ChunkedUArray ty) where
    type Item (ChunkedUArray ty) = ty
    fromList = vFromList
    toList = vToList

instance PrimType ty => C.Collection (ChunkedUArray ty) where
    null = null
    length = length

instance PrimType ty => C.Sequential (ChunkedUArray ty) where
--    take = take
--  drop = drop
--  splitAt = splitAt
--  revTake = revTake
--  revDrop = revDrop
--  revSplitAt = revSplitAt
--  splitOn = splitOn
--  break = break
--  intersperse = intersperse
--  span = span
--  reverse = reverse
--  filter = filter
--  unsnoc = unsnoc
--  uncons = uncons
--  snoc = snoc
--  cons = cons
--  find = find
--  sortBy = sortBy
    singleton = fromList . (:[])

instance PrimType ty => C.IndexedCollection (ChunkedUArray ty) where
    (!) l n
        | n < 0 || n >= length l = Nothing
        | otherwise              = Just $ index l n
    findIndex predicate c = loop 0
      where
        !len = length c
        loop i
            | i == len  = Nothing
            | otherwise =
                if predicate (unsafeIndex c i) then Just i else Nothing

empty :: ChunkedUArray ty
empty = ChunkedUArray (A.empty)

append :: ChunkedUArray ty -> ChunkedUArray ty -> ChunkedUArray ty
append (ChunkedUArray a1) (ChunkedUArray a2) = ChunkedUArray $ runST $ do
  let a1Size@(Size a1len) = Size $ C.length a1
  let a2Size              = Size $ C.length a2
  a <- A.new (a1Size + a2Size)
  A.thaw a1 >>= \a1' -> A.copyAt a (Offset 0) a1' (Offset 0) a1Size
  A.thaw a2 >>= \a2' -> A.copyAt a (Offset a1len) a2' (Offset 0) a2Size
  A.unsafeFreeze a

concat :: [ChunkedUArray ty] -> ChunkedUArray ty
concat x = C.foldl' append mempty x

vFromList :: PrimType ty => [ty] -> ChunkedUArray ty
vFromList l = ChunkedUArray array
  where
    array = runST $ do
      a <- A.new (Size 1)
      A.unsafeWrite a 0 (fromList l)
      A.unsafeFreeze a

vToList :: PrimType ty => ChunkedUArray ty -> [ty]
vToList (ChunkedUArray a) = loop (C.length a) 0 mempty
  where
    -- TODO: Rewrite this to use something like a `DList`
    -- to avoid the expensive `mappend`.
    loop len !acc l = case acc >= len of
      True  -> l
      False -> loop len (acc+1) ((toList (A.unsafeIndex a acc)) <> l)

null :: PrimType ty => ChunkedUArray ty -> Bool
null (ChunkedUArray array) =
  let len = C.length array
  in C.null array || allNulls 0 len
  where
    allNulls !idx len
      | idx == len = True
      | otherwise  = C.null (array `A.unsafeIndex` idx) && allNulls (idx + 1) len

-- | Returns the length of this `ChunkedUArray`, by summing each inner length.
-- Complexity: O(n) where `n` is the number of chunks, as U.length u is O(1).
length :: PrimType ty => ChunkedUArray ty -> Int
length (ChunkedUArray array) = C.foldl' (\acc l -> acc + C.length l) 0 array

-- | Equality between `ChunkedUArray`.
-- This function is fiddly to write as is not enough to compare for
-- equality the inner `UArray`(s), we need an element-by-element
-- comparison.
equal :: PrimType ty => ChunkedUArray ty -> ChunkedUArray ty -> Bool
equal ca1 ca2 = len1 == len2 && deepEqual
  where
    len1 = C.length ca1
    len2 = C.length ca2

    deepEqual :: Bool
    deepEqual = go 0 0

    go !x !y
      | x == len1 && y == len2 = True
      | otherwise =
        (ca1 `unsafeIndex` x == ca2 `unsafeIndex` y) && go (x + 1) (y + 1)

-- | Take the first n elements from this `ChunkedUArray`.
-- TODO: Perform compaction? Compacting the underlying chunks will have
-- the snag of copying data, but the pro of improving cache-friendliness
-- and reduce data scattering.
take :: PrimType ty => Int -> ChunkedUArray ty -> ChunkedUArray ty
take nbElems v@(ChunkedUArray inner)
    | nbElems <= 0 = empty
    | C.null v     = empty
    | nbElems == C.length v = v
    | otherwise =
      let newSize = Size 5 -- TODO: newSize is wrong
      in ChunkedUArray $ runST (A.new newSize >>= iter inner nbElems)
  where
    iter :: (PrimType ty, PrimMonad prim)
         => Array (UArray ty)
         -> Int
         -> A.MArray (UArray ty) (PrimState prim)
         -> prim (Array (UArray ty))
    iter inner0 elems finalVector = loop 0 elems
      where
        loop !currentIndex remainingElems
          | remainingElems <= 0 = A.unsafeFreeze finalVector
          | otherwise =
            let chunk = inner0 `A.unsafeIndex` currentIndex -- TODO: skip empty chunks
                chunkLen = C.length chunk
                slack    = chunkLen P.- remainingElems
            in case chunkLen <= remainingElems of
              True -> do
                A.unsafeWrite finalVector currentIndex chunk
                loop (currentIndex + 1) (remainingElems - chunkLen)
              False -> do
                nc <- do
                  newChunk <- U.new (Size slack)
                  U.unsafeCopyAtRO newChunk (Offset 0) chunk (Offset 0) (Size slack)
                  U.unsafeFreeze newChunk
                A.unsafeWrite finalVector (currentIndex + 1) nc
                A.freeze finalVector

--drop = _
--splitAt = _
--revTake = _
--revDrop = _
--revSplitAt = _
--splitOn = _
--break = _
--intersperse = _
--span = _
--reverse = _
--filter = _
--unsnoc = _
--uncons = _
--snoc = _
--cons = _
--find = _
--sortBy = _

index :: PrimType ty => ChunkedUArray ty -> Int -> ty
index array n
    | n < 0 || n >= len = throw (OutOfBound OOB_Index n len)
    | otherwise         = unsafeIndex array n
  where len = C.length array
{-# INLINE index #-}

unsafeIndex :: PrimType ty => ChunkedUArray ty -> Int -> ty
unsafeIndex (ChunkedUArray array) idx = go (A.unsafeIndex array 0) 0 idx
  where
    go u globalIndex 0 = case C.null u of
      -- Skip empty chunks.
      True  -> go (A.unsafeIndex array (globalIndex + 1)) (globalIndex + 1) 0
      False -> U.unsafeIndex u 0
    go u !globalIndex !i
      -- Skip empty chunks.
      | C.null u  = go (A.unsafeIndex array (globalIndex + 1)) (globalIndex + 1) i
      | otherwise = case i - (C.length u) of
        i' | i' >= 0 -> go (A.unsafeIndex array (globalIndex + 1)) (globalIndex + 1) i'
        _            -> U.unsafeIndex u i
{-# INLINE unsafeIndex #-}