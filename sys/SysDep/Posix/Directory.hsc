{-# OPTIONS_HADDOCK hide #-}
module SysDep.Posix.Directory
    where

import           Basement.Compat.Base
import           Basement.Compat.C.Types
import           Data.Bits
import           SysDep.Posix.Types

#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

foreign import ccall unsafe "opendir"
    opendir :: Ptr CChar -> IO (Ptr CDir)
foreign import ccall unsafe "fdopendir"
    fdopendir :: CFd -> IO (Ptr CDir)
foreign import ccall unsafe "readdir"
    readdir :: Ptr CDir -> IO (Ptr CDirent)
foreign import ccall unsafe "readdir_r"
    readdirR :: Ptr CDir -> Ptr CDirent -> Ptr (Ptr CDirent) -> IO CInt
foreign import ccall unsafe "telldir"
    telldir :: Ptr CDir -> IO CLong
foreign import ccall unsafe "seekdir"
    seekdir :: Ptr CDir -> CLong -> IO ()
foreign import ccall unsafe "rewinddir"
    rewinddir :: Ptr CDir -> IO ()
foreign import ccall unsafe "closedir"
    closedir :: Ptr CDir -> IO CInt
foreign import ccall unsafe "dirfd"
    dirfd :: Ptr CDir -> IO CFd
