{-# OPTIONS_HADDOCK hide #-}
module SysDep.Posix.Functions
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

foreign import ccall unsafe "sysconf"
    sysconf :: CSysconfName -> CLong
