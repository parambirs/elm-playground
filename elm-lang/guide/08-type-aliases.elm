type alias User =
	{ name : String
	, age : Int
	}

-- WITH ALIAS

isOldEnoughToVote : User -> Bool
isOldEnoughToVote user =
	user.age >= 18

-- WITHOUT ALIAS

isOldEnoughToVote : { name : String, age : Int } -> Bool
isOldEnoughToVote user =
	user.age >= 18
	