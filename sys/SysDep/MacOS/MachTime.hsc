{-# OPTIONS_HADDOCK hide #-}
module SysDep.MacOS.MachTime
    where

import Basement.Compat.Base
import Basement.Compat.C.Types
import Basement.Types.OffsetSize

#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <mach/mach.h>
#include <mach/mach_time.h>

data TimebaseInfo

size_TimebaseInfo :: CSize
size_TimebaseInfo = #const sizeof(mach_timebase_info_data_t)

ofs_TimebaseInfo_numer :: Offset Word8
ofs_TimebaseInfo_numer = Offset (#offset mach_timebase_info_data_t, numer)

ofs_TimebaseInfo_denom :: Offset Word8
ofs_TimebaseInfo_denom = Offset (#offset mach_timebase_info_data_t, denom)

foreign import ccall unsafe "mach_absolute_time"
    absolute_time :: IO Word64
foreign import ccall unsafe "mach_timebase_info"
    timebase_info :: Ptr TimebaseInfo -> IO ()
