{-# OPTIONS_HADDOCK hide #-}
module SysDep.Posix.Constants
    where

import           Basement.Compat.Base
import           Basement.Compat.C.Types
import           SysDep.Posix.Types
import           Data.Bits

#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

errno_E2BIG
    , errno_EACCES
    , errno_EADDRINUSE
    , errno_EADDRNOTAVAIL
    , errno_EAFNOSUPPORT
    , errno_EAGAIN
    , errno_EALREADY
    , errno_EBADF
    , errno_EBUSY
    , errno_ECANCELED
    , errno_ECHILD
    , errno_ECONNABORTED
    , errno_ECONNREFUSED
    , errno_ECONNRESET
    , errno_EDEADLK
    , errno_EDESTADDRREQ
    , errno_EDOM
    , errno_EDQUOT
    , errno_EEXIST
    , errno_EFAULT
    , errno_EFBIG
    , errno_EHOSTUNREACH
    , errno_EIDRM
    , errno_EILSEQ
    , errno_EINPROGRESS
    , errno_EINTR
    , errno_EINVAL
    , errno_EIO
    , errno_EISCONN
    , errno_EISDIR
    , errno_ELOOP
    , errno_EMFILE
    , errno_EMLINK
    , errno_EMSGSIZE
    , errno_ENAMETOOLONG
    , errno_ENETDOWN
    , errno_ENETRESET
    , errno_ENETUNREACH
    , errno_ENFILE
    , errno_ENOBUFS
    , errno_ENODEV
    , errno_ENOENT
    , errno_ENOEXEC
    , errno_ENOLCK
    , errno_ENOMEM
    , errno_ENOMSG
    , errno_ENOPROTOOPT
    , errno_ENOSPC
    , errno_ENOSYS
    , errno_ENOTCONN
    , errno_ENOTDIR
    , errno_ENOTEMPTY
    , errno_ENOTSOCK
    , errno_ENOTSUP
    , errno_ENOTTY
    , errno_ENXIO
    , errno_EOPNOTSUPP
    , errno_EOVERFLOW
    , errno_EPERM
    , errno_EPIPE
    , errno_EPROTONOSUPPORT
    , errno_EPROTOTYPE
    , errno_ERANGE
    , errno_EROFS
    , errno_ESPIPE
    , errno_ESRCH
    , errno_ESTALE
    , errno_ETIMEDOUT
    , errno_ETXTBSY
    , errno_EWOULDBLOCK
    , errno_EXDEV :: CErrno
errno_E2BIG = (#const E2BIG)
errno_EACCES = (#const EACCES)
errno_EADDRINUSE = (#const EADDRINUSE)
errno_EADDRNOTAVAIL = (#const EADDRNOTAVAIL)
errno_EAFNOSUPPORT = (#const EAFNOSUPPORT)
errno_EAGAIN = (#const EAGAIN)
errno_EALREADY = (#const EALREADY)
errno_EBADF = (#const EBADF)
errno_EBUSY = (#const EBUSY)
errno_ECANCELED = (#const ECANCELED)
errno_ECHILD = (#const ECHILD)
errno_ECONNABORTED = (#const ECONNABORTED)
errno_ECONNREFUSED = (#const ECONNREFUSED)
errno_ECONNRESET = (#const ECONNRESET)
errno_EDEADLK = (#const EDEADLK)
errno_EDESTADDRREQ = (#const EDESTADDRREQ)
errno_EDOM = (#const EDOM)
errno_EDQUOT = (#const EDQUOT)
errno_EEXIST = (#const EEXIST)
errno_EFAULT = (#const EFAULT)
errno_EFBIG = (#const EFBIG)
errno_EHOSTUNREACH = (#const EHOSTUNREACH)
errno_EIDRM = (#const EIDRM)
errno_EILSEQ = (#const EILSEQ)
errno_EINPROGRESS = (#const EINPROGRESS)
errno_EINTR = (#const EINTR)
errno_EINVAL = (#const EINVAL)
errno_EIO = (#const EIO)
errno_EISCONN = (#const EISCONN)
errno_EISDIR = (#const EISDIR)
errno_ELOOP = (#const ELOOP)
errno_EMFILE = (#const EMFILE)
errno_EMLINK = (#const EMLINK)
errno_EMSGSIZE = (#const EMSGSIZE)
errno_ENAMETOOLONG = (#const ENAMETOOLONG)
errno_ENETDOWN = (#const ENETDOWN)
errno_ENETRESET = (#const ENETRESET)
errno_ENETUNREACH = (#const ENETUNREACH)
errno_ENFILE = (#const ENFILE)
errno_ENOBUFS = (#const ENOBUFS)
errno_ENODEV = (#const ENODEV)
errno_ENOENT = (#const ENOENT)
errno_ENOEXEC = (#const ENOEXEC)
errno_ENOLCK = (#const ENOLCK)
errno_ENOMEM = (#const ENOMEM)
errno_ENOMSG = (#const ENOMSG)
errno_ENOPROTOOPT = (#const ENOPROTOOPT)
errno_ENOSPC = (#const ENOSPC)
errno_ENOSYS = (#const ENOSYS)
errno_ENOTCONN = (#const ENOTCONN)
errno_ENOTDIR = (#const ENOTDIR)
errno_ENOTEMPTY = (#const ENOTEMPTY)
errno_ENOTSOCK = (#const ENOTSOCK)
errno_ENOTSUP = (#const ENOTSUP)
errno_ENOTTY = (#const ENOTTY)
errno_ENXIO = (#const ENXIO)
errno_EOPNOTSUPP = (#const EOPNOTSUPP)
errno_EOVERFLOW = (#const EOVERFLOW)
errno_EPERM = (#const EPERM)
errno_EPIPE = (#const EPIPE)
errno_EPROTONOSUPPORT = (#const EPROTONOSUPPORT)
errno_EPROTOTYPE = (#const EPROTOTYPE)
errno_ERANGE = (#const ERANGE)
errno_EROFS = (#const EROFS)
errno_ESPIPE = (#const ESPIPE)
errno_ESRCH = (#const ESRCH)
errno_ESTALE = (#const ESTALE)
errno_ETIMEDOUT = (#const ETIMEDOUT)
errno_ETXTBSY = (#const ETXTBSY)
errno_EWOULDBLOCK = (#const EWOULDBLOCK)
errno_EXDEV = (#const EXDEV)

#ifdef ENODATA
errno_ENODATA :: CErrno
errno_ENODATA = (#const ENODATA)
#endif

#ifdef ENOSR
errno_ENOSR :: CErrno
errno_ENOSR = (#const ENOSR)
#endif

#ifdef ENOSTR
errno_ENOSTR :: CErrno
errno_ENOSTR = (#const ENOSTR)
#endif

#ifdef ETIME
errno_ETIME :: CErrno
errno_ETIME = (#const ETIME)
#endif

#ifdef EBADMSG
errno_EBADMSG :: CErrno
errno_EBADMSG = (#const EBADMSG)
#endif

#ifdef EMULTIHOP
errno_EMULTIHOP :: CErrno
errno_EMULTIHOP = (#const EMULTIHOP)
#endif

#ifdef ENOLINK
errno_ENOLINK :: CErrno
errno_ENOLINK = (#const ENOLINK)
#endif

#ifdef ENOTRECOVERABLE
errno_ENOTRECOVERABLE :: CErrno
errno_ENOTRECOVERABLE = (#const ENOTRECOVERABLE)
#endif

#ifdef EOWNERDEAD
errno_EOWNERDEAD :: CErrno
errno_EOWNERDEAD = (#const EOWNERDEAD)
#endif

#ifdef EPROTO
errno_EPROTO :: CErrno
errno_EPROTO = (#const EPROTO)
#endif

openflag_RDONLY
    , openflag_WRONLY
    , openflag_RDWR
    , openflag_NONBLOCK
    , openflag_APPEND
    , openflag_CREAT
    , openflag_TRUNC
    , openflag_EXCL :: COpenFlags
openflag_RDONLY   = (#const O_RDONLY)
openflag_WRONLY   = (#const O_WRONLY)
openflag_RDWR     = ((#const O_RDONLY) .|. (#const O_WRONLY))
openflag_NONBLOCK = (#const O_NONBLOCK)
openflag_APPEND   = (#const O_APPEND)
openflag_CREAT    = (#const O_CREAT)
openflag_TRUNC    = (#const O_TRUNC)
openflag_EXCL     = (#const O_EXCL)

#ifdef openflag_NOFOLLOW
openflag_NOFOLLOW :: COpenFlags
openflag_NOFOLLOW = (#const O_NOFOLLOW)
#endif

#ifdef openflag_CLOEXEC
openflag_CLOEXEC :: COpenFlags
openflag_CLOEXEC  = (#const O_CLOEXEC)
#endif

protflag_NONE
    , protflag_READ
    , protflag_WRITE
    , protflag_EXEC :: CMemProtFlags
protflag_NONE  = (#const PROT_NONE)
protflag_READ  = (#const PROT_READ)
protflag_WRITE = (#const PROT_WRITE)
protflag_EXEC  = (#const PROT_EXEC)

mapflag_SHARED
    , mapflag_PRIVATE
    , mapflag_FIXED
    , mapflag_ANONYMOUS :: CMemMappingFlags
mapflag_SHARED    = (#const MAP_SHARED)
mapflag_PRIVATE   = (#const MAP_PRIVATE)
mapflag_FIXED     = (#const MAP_FIXED)
#ifdef __APPLE__
mapflag_ANONYMOUS = (#const MAP_ANON)
#else
mapflag_ANONYMOUS = (#const MAP_ANONYMOUS)
#endif

madvise_NORMAL
    , madvise_RANDOM
    , madvise_SEQUENTIAL
    , madvise_WILLNEED
    , madvise_DONTNEED :: CMemAdvice
#if defined(POSIX_MADV_NORMAL)
madvise_NORMAL     = (#const POSIX_MADV_NORMAL)
madvise_RANDOM     = (#const POSIX_MADV_RANDOM)
madvise_SEQUENTIAL = (#const POSIX_MADV_SEQUENTIAL)
madvise_WILLNEED   = (#const POSIX_MADV_WILLNEED)
madvise_DONTNEED   = (#const POSIX_MADV_DONTNEED)
#else
madvise_NORMAL     = (#const MADV_NORMAL)
madvise_RANDOM     = (#const MADV_RANDOM)
madvise_SEQUENTIAL = (#const MADV_SEQUENTIAL)
madvise_WILLNEED   = (#const MADV_WILLNEED)
madvise_DONTNEED   = (#const MADV_DONTNEED)
#endif

memsync_ASYNC
    , memsync_SYNC
    , memsync_INVALIDATE :: CMemSyncFlags
memsync_ASYNC      = (#const MS_ASYNC)
memsync_SYNC       = (#const MS_SYNC)
memsync_INVALIDATE = (#const MS_INVALIDATE)

sysconf_PAGESIZE :: CSysconfName
sysconf_PAGESIZE = (#const _SC_PAGESIZE)

seek_SET
    , seek_CUR
    , seek_END :: CSeekFlags
seek_SET = (#const SEEK_SET)
seek_CUR = (#const SEEK_CUR)
seek_END = (#const SEEK_END)
