{-# OPTIONS_HADDOCK hide #-}
module SysDep.Linux.Constants
   where

import Basement.Compat.Base
import Basement.Compat.C.Types
import SysDep.Posix.Types
import SysDep.Posix.Constants

#define __USE_GNU

#include <sys/types.h>
#include <sys/inotify.h>
#include <fcntl.h>

openflag_TMPFILE :: COpenFlags
#ifdef __O_TMPFILE
openflag_TMPFILE   = (#const __O_TMPFILE)
#else
openflag_TMPFILE   = 0
#endif

seek_DATA :: CSeekFlags
#ifdef SEEK_DATA
seek_DATA = (#const SEEK_DATA)
#else
seek_DATA = 0
#endif

seek_HOLE :: CSeekFlags
#ifdef SEEK_HOLE
seek_HOLE = (#const SEEK_HOLE)
#else
seek_HOLE = 0
#endif
