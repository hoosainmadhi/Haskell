
import Data.Time.Calendar
import Data.Time.Clock

data CustomerInvoice = CustomerInvoice
    {
     invoiceNumber    :: Int
     , amountDue      :: Dollars
     , tax            :: Dollars 
     , billableItems  :: [String]
     , status         :: InvoiceStatus 
     , createdAt      :: UTCTime
     , dueDate        :: Day 
    }

data InvoiceStatus = Issued | Paid | Cancelled

type Dollars =  Int
