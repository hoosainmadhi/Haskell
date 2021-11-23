module Pizza where

type Pennies = Int

-- interface for things like Pizza, Topping, Breadsticks, SoftDrink
class Product a where
    cost :: a -> Pennies

-- i think this makes Pizza "an instance of the Product typeclass".
-- base pizza price depends on CrustType and CrustSize.
-- this works, but the prices should really come from a database.
-- TODO: may be a better way to declare each pizza
instance Product BaseProduct where
    cost Pizza {crustSize=Small,  crustType=_, toppings=_} = 800  -- $8
    cost Pizza {crustSize=Medium, crustType=_, toppings=_} = 1000 -- $10
    cost Pizza {crustSize=Large,  crustType=_, toppings=_} = 1200 -- $12

data Topping = Cheese
             | Pepperoni
             | Sausage
             | GreenOlives
             | BlackOlives
             | Onions
             | Mushrooms
             deriving (Show, Eq)

data CrustType = Thin | Thick | Regular deriving (Show)
data CrustSize = Small | Medium | Large deriving (Show)

data BaseProduct = Pizza { crustSize :: CrustSize
                   , crustType :: CrustType
                   , toppings  :: [Topping]
                   }
                 | Breadsticks
                 | SoftDrink
                 deriving (Show)

-- data Item = Food { description :: String, tastiness :: Integer }
--    | Wand { description :: String, magic :: Integer }

-- can now use functions like this:
--     `crustSize aPizza`
--     `crustType aPizza`
--     `toppings aPizza`
-- those functions are automatically generated with the record syntax

-- define a pizza instance:
-- Pizza {crustSize=Medium, crustType=Thin, toppings=[Cheese]}

data Address = Address { street1 :: String
                       , street2 :: String
                       , city    :: String
                       , state   :: String
                       , zipcode :: String
                       }

-- data Customer = Customer { firstName   :: String
--                          , lastName    :: String
--                          , address     :: Address
--                          , phoneNumber :: String
--                          }

-- add a single topping to a pizza, returning the new pizza.
-- note: can use `in` instead of `where`
addTopping :: BaseProduct -> Topping -> BaseProduct
addTopping p t =
    Pizza {crustSize=(crustSize p), crustType=(crustType p), toppings=newToppings}
    where oldToppings = toppings p
          newToppings = t : oldToppings

-- made this a little shorter than `addTopping`
addToppings :: BaseProduct -> [Topping] -> BaseProduct
addToppings p ts =
    Pizza {crustSize=(crustSize p), crustType=(crustType p), toppings=newToppings}
    where newToppings = ts ++ (toppings p)

-- remove the given Topping
removeTopping :: BaseProduct -> Topping -> BaseProduct
removeTopping p t =
    Pizza {crustSize=(crustSize p), crustType=(crustType p), toppings=newToppings}
    where oldToppings = toppings p
          newToppings = filter (\top -> top /= t) oldToppings

tellPizza :: BaseProduct -> String
tellPizza (Pizza {crustSize = cs, crustType = ct, toppings = t}) =
    "Size: " ++ (show cs) ++ ", Type: " ++ (show ct) ++ ", Toppings: " ++ (show t)

-- just an example
getToppings :: BaseProduct -> [Topping]
getToppings p = toppings p