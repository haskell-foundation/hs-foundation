-----------------------------------------------------------------------------
-- |
-- Module      :  SysDep.Linux.Inotify
-- Copyright   :  (c) Vincent Hanquez 2014-2018
-- License     :  BSD-style
--
-- Linux Inotify bindings
--
-- import qualified
-----------------------------------------------------------------------------
{-# OPTIONS_HADDOCK hide #-}
module SysDep.Linux.Inotify
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

#ifdef IN_NONBLOCK
in_NONBLOCK :: CInotifyFlags
in_NONBLOCK = (#const IN_NONBLOCK)
#endif

#ifdef IN_CLOEXEC
in_CLOEXEC :: CInotifyFlags
in_CLOEXEC  = (#const IN_CLOEXEC)
#endif

in_ACCESS
    , in_ATTRIB
    , in_CLOSE_WRITE
    , in_CLOSE_NOWRITE
    , in_CREATE
    , in_DELETE
    , in_DELETE_SELF
    , in_MODIFY
    , in_MOVE_SELF
    , in_MOVED_FROM
    , in_MOVED_TO :: CInotifyMask
in_ACCESS = (#const IN_ACCESS)
in_ATTRIB = (#const IN_ATTRIB)
in_CLOSE_WRITE = (#const IN_CLOSE_WRITE)
in_CLOSE_NOWRITE = (#const IN_CLOSE_NOWRITE)
in_CREATE = (#const IN_CREATE)
in_DELETE = (#const IN_DELETE)
in_DELETE_SELF = (#const IN_DELETE_SELF)
in_MODIFY = (#const IN_MODIFY)
in_MOVE_SELF = (#const IN_MOVE_SELF)
in_MOVED_FROM = (#const IN_MOVED_FROM)
in_MOVED_TO = (#const IN_MOVED_TO)

-- extra mask at add_watch time
in_OPEN
    , in_DONT_FOLLOW
    , in_MASK_ADD
    , in_ONESHOT
    , in_ONLYDIR :: CInotifyMask
in_OPEN = (#const IN_OPEN)
in_DONT_FOLLOW = (#const IN_DONT_FOLLOW)
in_MASK_ADD = (#const IN_MASK_ADD)
in_ONESHOT = (#const IN_ONESHOT)
in_ONLYDIR = (#const IN_ONLYDIR)

#ifdef IN_EXCL_UNLINK
in_EXCL_UNLINK :: CInotifyMask
in_EXCL_UNLINK = (#const IN_EXCL_UNLINK)
#endif

-- only found in mask
in_IGNORED
    , in_ISDIR
    , in_Q_OVERFLOW
    , in_UNMOUNT :: CInotifyMask
in_IGNORED = (#const IN_IGNORED)
in_ISDIR = (#const IN_ISDIR)
in_Q_OVERFLOW = (#const IN_Q_OVERFLOW)
in_UNMOUNT = (#const IN_UNMOUNT)

cinotifyEventSize :: CSize
cinotifyEventSize = 16

foreign import ccall unsafe "inotify_init1"
    init :: CInotifyFlags -> IO CFd
foreign import ccall unsafe "inotify_add_watch"
    addWatch :: CFd -> Ptr CChar -> CInotifyMask -> IO CWatchDescriptor
foreign import ccall unsafe "inotify_rm_watch"
    rmWatch :: CFd -> CWatchDescriptor -> IO Int
