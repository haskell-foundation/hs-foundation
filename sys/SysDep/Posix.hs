-----------------------------------------------------------------------------
-- |
-- Module      :  SysDep.Posix
-- Copyright   :  (c) Vincent Hanquez 2014-2017
-- License     :  BSD-style
--
-- Maintainer  :  Vincent Hanquez
-- Stability   :  provisional
-- Portability :  non-portable (requires POSIX)
--
-- Functions defined by the POSIX standards
--
-- it's recommended to use this module qualified:
--
-- > import qualified SysDep.Posix as Posix
--
-----------------------------------------------------------------------------
{-# OPTIONS_HADDOCK hide #-}
module SysDep.Posix
    ( module X
    ) where

import           SysDep.Posix.Types as X
import           SysDep.Posix.Constants as X
import           SysDep.Posix.Functions as X
import           SysDep.Posix.File as X
import           SysDep.Posix.Directory as X
import           SysDep.Posix.Terminal as X
import           SysDep.Posix.Memory as X
