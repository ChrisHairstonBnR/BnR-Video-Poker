
(* TODO: Add your comment here *)
FUNCTION HandResult
	//Large IF/ELSIF statement
	
	
	
	
	
	CASE GameVariant OF
		GAME_BONUS_POKER:
			
		GAME_DOUBLE_BONUS_POKER:
			
		GAME_TRIPLE_BONUS_POKER:
			
		GAME_ULTRA_BONUS_POKER:
			
		GAME_ALL_AMERICAN:
			
		GAME_JACKS_OR_BETTER:
			//Large if statement based on hand result checks
			IF ResultBools.RoyalFlush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.FullHouse THEN
				HandResult := FIVECARDPOKER_FULL_HOUSE;
			ELSIF ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_FLUSH;
			ELSIF ResultBools.Straight THEN
				HandResult := FIVECARDPOKER_STRAIGHT;
			ELSIF ResultBools.ThreeOfAKind THEN
				HandResult := FIVECARDPOKER_THREE_OF_A_KIND;
			ELSIF ResultBools.TwoPair THEN
				HandResult := FIVECARDPOKER_TWO_PAIR;
			ELSIF ResultBools.FacePair THEN
				HandResult := FIVECARDPOKER_PAIR_FACE;
			ELSE
				HandResult := FIVECARDPOKER_NOTHING;
			END_IF
			
			
			
			
			
		GAME_ACES_AND_EIGHTS:
			
		GAME_ACES_AND_FACES:
	
	
	END_CASE
END_FUNCTION
