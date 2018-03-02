{-# LANGUAGE CPP #-}
module Foundation.IO.Handle
    ( Handle
    , openFile
    , close
    , hGetBuf
    , hGet
    , hPut
    , hSeek
    , SeekParam(..)
    ) where

import           GHC.MVar
import           Control.Monad (when)
import           Control.Concurrent.MVar (withMVar, modifyMVar, readMVar)
import           Foreign.C.Types
import           System.Posix.Internals hiding (FD)
import           System.Posix.Types (CMode(..))
import           Basement.Imports
import qualified Basement.UArray as UA
import           Basement.Monad
import           Basement.UArray.Mutable
import           Foundation.VFS.FilePath

#if defined(mingw32_HOST_OS)
import           Foundation.IO.Handle.Windows
#else
import           Foundation.IO.Handle.Posix
#endif

type FD = CInt

invalidFD :: FD
invalidFD = -1

newtype Handle = Handle (MVar FD)

data HandleClosed = HandleClosed
    deriving (Show,Eq,Typeable)

instance Exception HandleClosed

data Permission = Read | Write | ReadWrite

openFile :: FilePath
         -> Permission
         -> IO Handle
openFile fp iom = do
    cfd <- withCFilePath fp $ \cfp -> c_open cfp oflag omode
    mvar <- newMVar cfd
    addMVarFinalizer mvar $ do
        x <- readMVar mvar
        _ <- c_close x
        return ()
    pure $ Handle mvar
  where
    omode = CMode 0
    oflag = 0

close :: Handle -> IO ()
close (Handle mv) =
    modifyMVar mv (\cfd -> c_close cfd >> return (invalidFD, ()))

withHandle :: Handle -> (FD -> IO a) -> IO a
withHandle (Handle handle) f = withMVar handle $ \cfd -> do
    when (cfd == invalidFD) $ throwIO HandleClosed
    f cfd

hGetBuf :: Handle -> MUArray Word8 (PrimState IO) -> CountOf Word8 -> IO (CountOf Word8)
hGetBuf handle buf sz =
    -- check out of bounds
    withHandle handle $ \cfd ->
    withMutablePtr buf $ \ptr ->
        ioPtrRetryLoop (ioRead cfd) ptr sz

hGet :: Handle -> CountOf Word8 -> IO (UArray Word8)
hGet handle sz =
    withHandle handle  $ \cfd ->
    UA.createFromIO sz $ \ptr -> do
        ioPtrRetryLoop (ioRead cfd) ptr sz

hPut :: Handle -> UArray Word8 -> IO ()
hPut handle ba =
    withHandle handle $ \cfd ->
    UA.withPtr ba     $ \ptr -> do
        r <- ioPtrRetryLoop (ioWrite cfd) ptr totalSize
        -- TODO check returned sized
        return ()
  where
    totalSize = UA.length ba

data SeekParam = SeekFromBeginning
               | SeekFromEnd
               | SeekFromCurrent

hSeek :: Handle -> SeekParam -> Offset Word8 -> IO ()
hSeek _ _ _ = return ()
