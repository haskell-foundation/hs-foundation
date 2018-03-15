{-# OPTIONS_HADDOCK hide #-}
module SysDep.Posix.File
    where

import           Basement.Compat.Base
import           Basement.Compat.C.Types
import           Data.Bits
import           SysDep.Posix.Types
import           Foreign.C.String

#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>


--------------------------------------------------------------------------------
-- files
--------------------------------------------------------------------------------
foreign import ccall unsafe "open"
    open :: Ptr CChar -> COpenFlags -> CMode -> IO CFd
foreign import ccall unsafe "openat"
    openAt :: CFd -> Ptr CChar -> COpenFlags -> CMode -> IO CFd
foreign import ccall unsafe "close"
    close :: CFd -> IO CInt

foreign import ccall "fcntl"
    fnctlNoArg :: CFd -> CInt -> IO CInt
foreign import ccall "fcntl"
    fnctlPtr :: CFd -> CInt -> Ptr a -> IO CInt

foreign import ccall unsafe "fstat"
    fstat :: CFd -> Ptr CStat -> IO CInt

foreign import ccall unsafe "ftruncate"
    ftruncate :: CFd -> COff -> IO CInt

foreign import ccall unsafe "lseek"
    lseek :: CFd -> COff -> CInt -> IO COff

foreign import ccall unsafe "dup"
    dup :: CFd -> IO CFd
foreign import ccall unsafe "dup2"
    dup2 :: CFd -> CFd -> IO CFd
