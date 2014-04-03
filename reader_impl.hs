newtype Reader r a = Reader { runReader :: r -> a }

instance Monad (Reader r) where
  return a = Reader $ \_ -> a
  m >>= k  = Reader $ \r -> runReader (k (runReader m r)) r

local :: (r -> b) -> Reader b a -> Reader r a
local f m = Reader $ runReader m . f
