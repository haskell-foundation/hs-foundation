{-# LANGUAGE CApiFFI #-}
module Foundation.System.Bindings.Windows
     where

import Foundation.Internal.Base
import Foreign.C.Types

#include <errno.h>

type CFd = CInt
type CErrno = CInt

sysPosix_E2BIG
    , sysPosix_EACCES
    , sysPosix_EADDRINUSE
    , sysPosix_EADDRNOTAVAIL
    , sysPosix_EAFNOSUPPORT
    , sysPosix_EAGAIN
    , sysPosix_EALREADY
    , sysPosix_EBADF
    , sysPosix_EBUSY
    , sysPosix_ECANCELED
    , sysPosix_ECHILD
    , sysPosix_ECONNABORTED
    , sysPosix_ECONNREFUSED
    , sysPosix_ECONNRESET
    , sysPosix_EDEADLK
    , sysPosix_EDESTADDRREQ
    , sysPosix_EDOM
    , sysPosix_EEXIST
    , sysPosix_EFAULT
    , sysPosix_EFBIG
    , sysPosix_EHOSTUNREACH
    , sysPosix_EILSEQ
    , sysPosix_EINPROGRESS
    , sysPosix_EINTR
    , sysPosix_EINVAL
    , sysPosix_EIO
    , sysPosix_EISCONN
    , sysPosix_EISDIR
    , sysPosix_ELOOP
    , sysPosix_EMFILE
    , sysPosix_EMLINK
    , sysPosix_EMSGSIZE
    , sysPosix_ENAMETOOLONG
    , sysPosix_ENETDOWN
    , sysPosix_ENETRESET
    , sysPosix_ENETUNREACH
    , sysPosix_ENFILE
    , sysPosix_ENOBUFS
    , sysPosix_ENODEV
    , sysPosix_ENOENT
    , sysPosix_ENOEXEC
    , sysPosix_ENOLCK
    , sysPosix_ENOMEM
    , sysPosix_ENOPROTOOPT
    , sysPosix_ENOSPC
    , sysPosix_ENOSYS
    , sysPosix_ENOTCONN
    , sysPosix_ENOTDIR
    , sysPosix_ENOTEMPTY
    , sysPosix_ENOTSOCK
    , sysPosix_ENOTSUP
    , sysPosix_ENOTTY
    , sysPosix_ENXIO
    , sysPosix_EOPNOTSUPP
    , sysPosix_EOVERFLOW
    , sysPosix_EOWNERDEAD
    , sysPosix_EPERM
    , sysPosix_EPIPE
    , sysPosix_EPROTO
    , sysPosix_EPROTONOSUPPORT
    , sysPosix_EPROTOTYPE
    , sysPosix_ERANGE
    , sysPosix_EROFS
    , sysPosix_ESPIPE
    , sysPosix_ESRCH
    , sysPosix_ETIMEDOUT
    , sysPosix_EWOULDBLOCK
    , sysPosix_EXDEV :: CErrno
sysPosix_E2BIG = (#const E2BIG)
sysPosix_EACCES = (#const EACCES)
sysPosix_EADDRINUSE = (#const EADDRINUSE)
sysPosix_EADDRNOTAVAIL = (#const EADDRNOTAVAIL)
sysPosix_EAFNOSUPPORT = (#const EAFNOSUPPORT)
sysPosix_EAGAIN = (#const EAGAIN)
sysPosix_EALREADY = (#const EALREADY)
sysPosix_EBADF = (#const EBADF)
sysPosix_EBUSY = (#const EBUSY)
sysPosix_ECANCELED = (#const ECANCELED)
sysPosix_ECHILD = (#const ECHILD)
sysPosix_ECONNABORTED = (#const ECONNABORTED)
sysPosix_ECONNREFUSED = (#const ECONNREFUSED)
sysPosix_ECONNRESET = (#const ECONNRESET)
sysPosix_EDEADLK = (#const EDEADLK)
sysPosix_EDESTADDRREQ = (#const EDESTADDRREQ)
sysPosix_EDOM = (#const EDOM)
sysPosix_EEXIST = (#const EEXIST)
sysPosix_EFAULT = (#const EFAULT)
sysPosix_EFBIG = (#const EFBIG)
sysPosix_EHOSTUNREACH = (#const EHOSTUNREACH)
sysPosix_EILSEQ = (#const EILSEQ)
sysPosix_EINPROGRESS = (#const EINPROGRESS)
sysPosix_EINTR = (#const EINTR)
sysPosix_EINVAL = (#const EINVAL)
sysPosix_EIO = (#const EIO)
sysPosix_EISCONN = (#const EISCONN)
sysPosix_EISDIR = (#const EISDIR)
sysPosix_ELOOP = (#const ELOOP)
sysPosix_EMFILE = (#const EMFILE)
sysPosix_EMLINK = (#const EMLINK)
sysPosix_EMSGSIZE = (#const EMSGSIZE)
sysPosix_ENAMETOOLONG = (#const ENAMETOOLONG)
sysPosix_ENETDOWN = (#const ENETDOWN)
sysPosix_ENETRESET = (#const ENETRESET)
sysPosix_ENETUNREACH = (#const ENETUNREACH)
sysPosix_ENFILE = (#const ENFILE)
sysPosix_ENOBUFS = (#const ENOBUFS)
sysPosix_ENODEV = (#const ENODEV)
sysPosix_ENOENT = (#const ENOENT)
sysPosix_ENOEXEC = (#const ENOEXEC)
sysPosix_ENOLCK = (#const ENOLCK)
sysPosix_ENOMEM = (#const ENOMEM)
sysPosix_ENOPROTOOPT = (#const ENOPROTOOPT)
sysPosix_ENOSPC = (#const ENOSPC)
sysPosix_ENOSYS = (#const ENOSYS)
sysPosix_ENOTCONN = (#const ENOTCONN)
sysPosix_ENOTDIR = (#const ENOTDIR)
sysPosix_ENOTEMPTY = (#const ENOTEMPTY)
sysPosix_ENOTSOCK = (#const ENOTSOCK)
sysPosix_ENOTSUP = (#const ENOTSUP)
sysPosix_ENOTTY = (#const ENOTTY)
sysPosix_ENXIO = (#const ENXIO)
sysPosix_EOPNOTSUPP = (#const EOPNOTSUPP)
sysPosix_EOVERFLOW = (#const EOVERFLOW)
sysPosix_EOWNERDEAD = (#const EOWNERDEAD)
sysPosix_EPERM = (#const EPERM)
sysPosix_EPIPE = (#const EPIPE)
sysPosix_EPROTO = (#const EPROTO)
sysPosix_EPROTONOSUPPORT = (#const EPROTONOSUPPORT)
sysPosix_EPROTOTYPE = (#const EPROTOTYPE)
sysPosix_ERANGE = (#const ERANGE)
sysPosix_EROFS = (#const EROFS)
sysPosix_ESPIPE = (#const ESPIPE)
sysPosix_ESRCH = (#const ESRCH)
sysPosix_ETIMEDOUT = (#const ETIMEDOUT)
sysPosix_EWOULDBLOCK = (#const EWOULDBLOCK)
sysPosix_EXDEV = (#const EXDEV)

foreign import ccall unsafe "_wsopen"
    sysWindowsWsopen :: Ptr CWchar -> CInt -> CInt -> CInt -> IO CInt

foreign import capi unsafe "HsBase.h _read"
    sysWindowsRead :: CFd -> Ptr Word8 -> CUInt -> IO CInt
foreign import capi safe "HsBase.h _read"
    sysWindowsSafeRead :: CFd -> Ptr Word8 -> CUInt -> IO CInt

foreign import capi unsafe "HsBase.h _write"
    sysWindowsWrite :: CFd -> Ptr Word8 -> CUInt -> IO CInt
foreign import capi safe "HsBase.h _write"
    sysWindowsSafeWrite :: CFd -> Ptr Word8 -> CUInt -> IO CInt
