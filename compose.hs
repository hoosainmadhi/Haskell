import Data.List
import Data.Semigroup
import Graphics.Rendering.OpenGL.GLU.Tessellation (WeightedProperties)
import System.Directory.Internal.Prelude (Semigroup)

myLast :: [c] -> c
myLast = head . reverse

myMin :: Ord a => [a] -> a
myMin = head . sort

instance Semigroup Integer where
  (<>) x y = x ^ 2 + y
