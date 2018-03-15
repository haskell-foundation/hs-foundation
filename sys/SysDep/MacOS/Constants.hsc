{-# OPTIONS_HADDOCK hide #-}
module SysDep.MacOS.Constants
    where

import Basement.Compat.Base
import Basement.Compat.C.Types
import Basement.Types.OffsetSize
import SysDep.Posix.Types

#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

openflag_SHLOCK
    , openflag_EXLOCK
    , openflag_SYMLINK
    , openflag_EVTONLY :: COpenFlags
openflag_SHLOCK   = (#const O_SHLOCK)
openflag_EXLOCK   = (#const O_EXLOCK)
openflag_SYMLINK  = (#const O_SYMLINK)
openflag_EVTONLY  = (#const O_EVTONLY)
