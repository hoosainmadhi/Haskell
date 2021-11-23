
data Triple a = Triple a a a deriving (Show)

type FullName = Triple String 

data Patient = Patient
    {
     patientNo        :: Int
     , patientName    :: FullName
    } 

p1 = Patient {
    patientNo = 1
    ,patientName = Triple "Hoosain" "Madhi" "foo"
}
