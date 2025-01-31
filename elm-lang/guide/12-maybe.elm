type alias User =
	{ name : String
	, age : Maybe Int
	}

sue : User
sue = 
	{ name = "Sue", age = Nothing }

tom : User
tom = 
	{ name = "Tom", age = Just 24 }


canBuyAlcohol : User -> Bool
canBuyAlcohol user =
	case user.age of
		Nothing ->
			False

		Just age ->
			age >= 21
