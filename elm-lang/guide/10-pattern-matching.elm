type User
	= Regular String Int
	| Visitor String

toName : User -> String
toName user =
	case user of
		Regular name age ->
			name

		Visitor name ->
			name

-- toName (Regular "Thomas" 44) == "Thomas"
-- toName (Visitor "kate95") == "kate95"

