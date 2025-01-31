toFullName person =
	person.firstName ++ " " ++ person.lastName

fullName = 
	toFullName { firstName = "Hermann", lastName = "Hesse" }


-- Type Annotations

half : Float -> Float
half n =
	n / 2

-- half 256 == 128
-- half "3" -- error!

hypotenuse : Float -> Float -> Float
hypotenuse a b =
	sqrt (a^2 + b^2)

-- hypotenuse 3 4 == 5	
-- hypotenuse 5 12 == 13

checkPower : Int -> String
checkPower powerLevel =
	if powerLevel > 9000 then "It's over 9000!!!" else "Meh"

-- checkPower 9001 == "It's over 9000!!!"
-- checkPower True -- error!

	