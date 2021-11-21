import Data.Time.Calendar (Day, fromGregorian)
import Data.Time.Clock ()

data CustomerInvoice = CustomerInvoice
  { invoiceNumber :: Int,
    amountDue :: ZAR,
    tax :: ZAR,
    billableItems :: [String],
    status :: InvoiceStatus,
    --  , createdAt      :: UTCTime
    dueDate :: Day
  }

data InvoiceStatus = Issued | Paid | Cancelled

type ZAR = Int

invoice :: CustomerInvoice
invoice =
  CustomerInvoice
    { invoiceNumber = 1,
      amountDue = 200,
      tax = 10,
      billableItems = ["design", "programming"],
      status = Cancelled,
      -- ,createdAt=currentTime
      dueDate = fromGregorian 2022 2 15
    }

createCustomerNotification :: CustomerInvoice -> String
createCustomerNotification invoice =
  case status invoice of
    Issued ->
      "Invoice #" ++ show (invoiceNumber invoice) ++ " due on " ++ show (dueDate invoice)
    Paid ->
      "Successfully paid invoice #" ++ show (invoiceNumber invoice)
    Cancelled ->
      "Invoice #" ++ show (invoiceNumber invoice) ++ " has been canceled"