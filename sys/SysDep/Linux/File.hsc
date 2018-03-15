{-# OPTIONS_HADDOCK hide #-}
module SysDep.Linux.File
   where

import           Basement.Compat.Base
import           Basement.Compat.C.Types
import           SysDep.Posix.Constants
import           SysDep.Linux.Types
import           SysDep.Posix.Types

#define __USE_GNU

#include <sys/types.h>
#include <sys/inotify.h>
#include <fcntl.h>

foreign import ccall unsafe "dup3"
    dup3 :: CFd -> CFd -> COpenFlags -> IO CInt
