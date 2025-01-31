type Result error value
	= Ok value
	| Err error


isReasonableAge : String -> Result String Int
isReasonableAge input =
	case String.toInt input of
		Nothing ->
			Err "That is not a number!"

		Just age ->
			if age < 0 then
				Err "Please try again after you are born."

			else if age > 135 then
				Err "Are you some kind of turtle?"

			else
				Ok age


-- isReasonableAge "abc" == Err ...
-- isReasonableAge "-13" == Err ...	
-- isReasonableAge "24" == Ok 24
