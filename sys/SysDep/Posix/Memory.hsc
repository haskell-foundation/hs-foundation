{-# OPTIONS_HADDOCK hide #-}
module SysDep.Posix.Memory
    ( mmap
    , munmap
    , madvise
    , msync
    , mlock
    , munlock
    ) where

import           Basement.Compat.Base
import           Basement.Compat.C.Types
import           Data.Bits
import           SysDep.Posix.Types

#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

foreign import ccall unsafe "mmap"
    mmap :: Ptr a -> CSize -> CMemProtFlags -> CMemMappingFlags -> CFd -> COff -> IO (Ptr a)

foreign import ccall unsafe "munmap"
    munmap :: Ptr a -> CSize -> IO CInt

#if defined(POSIX_MADV_NORMAL)
foreign import ccall unsafe "posix_madvise"
    madvise :: Ptr a -> CSize -> CMemAdvice -> IO CInt
#else
foreign import ccall unsafe "madvise"
    madvise :: Ptr a -> CSize -> CMemAdvice -> IO CInt
#endif

foreign import ccall unsafe "msync"
    msync :: Ptr a -> CSize -> CMemSyncFlags -> IO CInt

foreign import ccall unsafe "mprotect"
    mprotect :: Ptr a -> CSize -> CMemProtFlags -> IO CInt

#ifndef __HAIKU__
foreign import ccall unsafe "mlock"
    mlock :: Ptr a -> CSize -> IO CInt
#else
mlock :: Ptr a -> CSize -> IO CInt
mlock _ _ = return (-1)
#endif

#ifndef __HAIKU__
foreign import ccall unsafe "munlock"
    munlock :: Ptr a -> CSize -> IO CInt
#else
munlock :: Ptr a -> CSize -> IO CInt
munlock _ _ = return (-1)
#endif
