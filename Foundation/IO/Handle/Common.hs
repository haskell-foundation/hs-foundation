module Foundation.IO.Handle.Common
    ( HandleIOError(..)
    ) where

import           Basement.Imports
import           Foreign.C.Types

data HandleIOError = HandleIOError String CInt
    deriving (Show,Eq,Typeable)

instance Exception HandleIOError
