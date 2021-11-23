import Pizza
import System.IO

--
-- ORDER, CUSTOMER
--

-- TODO add breadsticks, soft drinks, etc.
data Order = Order
  { customer :: Customer,
    pizzas :: [Pizza]
  }
  deriving (Show)

-- TODO expand the concept of a customer
data Customer = Customer {name :: String} deriving (Show)

createEmptyOrder :: Order
createEmptyOrder = Order {customer = (Customer "no name"), pizzas = []}

addPizzaToOrder :: Order -> Pizza -> Order
addPizzaToOrder orderIn pizzaIn =
  -- return a new Order that has the new pizza in it
  Order {customer = (customer orderIn), pizzas = newPizzas}
  where
    oldPizzas = pizzas orderIn -- get the pizzas from the incoming order
    newPizzas = pizzaIn : oldPizzas -- add the new pizza to the old pizzas

-- TODO pass in a Customer here, not a String
-- TODO the `where` clause probably isn't needed here
addCustomerToOrder :: Order -> String -> Order
addCustomerToOrder orderIn customerNameIn =
  Order {customer = (Customer customerNameIn), pizzas = oldPizzas}
  where
    oldPizzas = pizzas orderIn

orderToString :: Order -> String
orderToString (Order {customer = c, pizzas = p}) =
  "Customer: " ++ (show c) ++ ", Pizzas: " ++ (show p)

printOrder :: Order -> IO ()
printOrder order = do putStrLn (orderToString order)

----------
-- MAIN --
----------

main = do
  putStrLn "\n--- MAIN ---"
  putStrLn "1 - New Order\nq - Quit"
  line <- getLine
  case line of
    "1" -> do
      let order = createEmptyOrder
      finishedOrder <- buildOrder order
      printOrder finishedOrder
      main
    _ -> exit

----------------
-- buildOrder --
----------------

buildOrder :: Order -> IO Order
buildOrder orderIn = do
  putStrLn "\n--- BUILD ORDER ---"
  putStrLn "1 - New Pizza\n2 - Customer\nr - Return"
  line <- getLine
  case line of
    "1" -> do
      let pizza = newPizza
      let order = addPizzaToOrder orderIn pizza
      putStrLn "(added a pizza to the order)"
      buildOrder order -- recursive
    "2" -> do
      customerName <- newCustomer
      let order = addCustomerToOrder orderIn customerName
      putStrLn "(added a customer to the order)"
      buildOrder order -- recursive
    "r" -> return orderIn
    _ -> return orderIn

-- TODO return a Customer here, not a String
newCustomer :: IO String
newCustomer = do
  putStrLn "Enter Customer Name: "
  line <- getLine
  return line

newPizza :: Pizza
newPizza = Pizza {crustSize = Medium, crustType = Thin, toppings = [Cheese]}

exit :: IO ()
exit = do putStrLn ("exited")

--
