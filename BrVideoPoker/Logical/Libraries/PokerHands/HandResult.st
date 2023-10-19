
(* TODO: Add your comment here *)
FUNCTION HandResult
	//Initialization
	PairCount := 0; 
	ResultBools.Royal := TRUE; //Will get turned false unless all cards "royal"
	//A matrix is used where there are 4 rows and 14 columns (Ace has a column for 1 and 14)
	//Because the card face enum starts with the 2 card at 0, we need to add 2
	FOR i := 0 TO 4 DO
		IF Hand[i].Face = CARD_ACE THEN
			CardMatrix[Hand[i].Suit,Hand[i].Face+2] := TRUE;
			CardMatrix[Hand[i].Suit,1] := TRUE;
		ELSE
			CardMatrix[Hand[i].Suit,Hand[i].Face+2] := TRUE;
		END_IF	
	END_FOR
	
	
	
				
	FOR j := 0 TO 3 DO
		FOR k := 1 TO 14 DO
			IF CardMatrix[j,k] THEN
				
				IF k < 14 THEN //do not double count aces for the row total
					RowTotals[j] := RowTotals[j] + 1;
				END_IF
				
				ColumnTotals[k] := ColumnTotals[k] + 1;
				
			END_IF	
		END_FOR
	END_FOR
	
	
	FOR j := 0 TO 3 DO //inspect the row totals 
		IF RowTotals[j] = 5 THEN
			ResultBools.Flush := TRUE;
		END_IF
	END_FOR
	
	FOR k := 1 TO 14 DO //iterate through column totals
		IF ColumnTotals[k] = 4 THEN
			ResultBools.FourAny := TRUE;
			
			IF k = 8 THEN
				ResultBools.FourEights := TRUE;
			END_IF;
			
			IF k = 7 THEN
				ResultBools.FourSevens := TRUE;
			END_IF;
			
			IF k > 10 AND k < 14 THEN
				ResultBools.FourJQK := TRUE;
			END_IF
			
			IF k = 1 OR k = 14 THEN
				ResultBools.FourAces := TRUE;
			END_IF
			
			IF k >= 2 AND k <= 4 THEN
				ResultBools.Four234 := TRUE;
			END_IF
			
			IF k >=5 AND k <= 13 THEN
				ResultBools.FourFiveThruKing := TRUE;
			END_IF
			
		ELSIF ColumnTotals[k] = 3 THEN
			ResultBools.ThreeOfAKind := TRUE;
			
		ELSIF ColumnTotals[k] = 2 THEN
			IF k <> 1 THEN
				PairCount := PairCount + 1;
			END_IF
			
			ResultBools.AnyPair := TRUE;
			IF k >= 11 AND k <= 14 THEN
				ResultBools.FacePair := TRUE;
			END_IF	
			
			IF k >= 12 AND k <= 14 THEN
				ResultBools.KingsOrBetter := TRUE;
			END_IF
			
		END_IF
		
		IF k >= 2 AND k<=9 AND ColumnTotals[k] > 0 THEN
			ResultBools.Royal := FALSE; //Fail royal check if any cards are not royal
		END_IF
		
		IF ColumnTotals[k] > 0 THEN
			StraightCount := StraightCount + 1;
			IF StraightCount = 5 THEN
				ResultBools.Straight := TRUE;
			END_IF
		ELSE
			StraightCount := 0;
		END_IF
		
	END_FOR
	
	IF PairCount >= 2 THEN
		ResultBools.TwoPair := TRUE;
	END_IF
	
	
	CASE GameVariant OF
		GAME_BONUS_POKER:
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAces THEN
				HandResult := FIVECARDPOKER_FOUR_ACES;
			ELSIF ResultBools.Four234 THEN
				HandResult := FIVECARDPOKER_FOUR_234;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
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
			
		GAME_DOUBLE_BONUS_POKER:
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAces THEN
				HandResult := FIVECARDPOKER_FOUR_ACES;
			ELSIF ResultBools.Four234 THEN
				HandResult := FIVECARDPOKER_FOUR_234;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
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
			
		GAME_TRIPLE_BONUS_POKER:
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAces THEN
				HandResult := FIVECARDPOKER_FOUR_ACES;
			ELSIF ResultBools.Four234 THEN
				HandResult := FIVECARDPOKER_FOUR_234;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
				HandResult := FIVECARDPOKER_FULL_HOUSE;
			ELSIF ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_FLUSH;
			ELSIF ResultBools.Straight THEN
				HandResult := FIVECARDPOKER_STRAIGHT;
			ELSIF ResultBools.ThreeOfAKind THEN
				HandResult := FIVECARDPOKER_THREE_OF_A_KIND;
			ELSIF ResultBools.TwoPair THEN
				HandResult := FIVECARDPOKER_TWO_PAIR;
			ELSIF ResultBools.KingsOrBetter THEN
				HandResult := FIVECARDPOKER_KINGS_OR_BETTER;
			ELSE
				HandResult := FIVECARDPOKER_NOTHING;
			END_IF
		GAME_ULTRA_BONUS_POKER:
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAces THEN
				HandResult := FIVECARDPOKER_FOUR_ACES;
			ELSIF ResultBools.Four234 THEN
				HandResult := FIVECARDPOKER_FOUR_234;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
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
		GAME_ALL_AMERICAN:
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
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
		GAME_JACKS_OR_BETTER:
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
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
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAces THEN
				HandResult := FIVECARDPOKER_FOUR_ACES;
			ELSIF ResultBools.FourEights THEN
				HandResult := FIVECARDPOKER_FOUR_EIGHTS;
			ELSIF ResultBools.FourEights THEN
				HandResult := FIVECARDPOKER_FOUR_SEVENS;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
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
			
		GAME_ACES_AND_FACES:
			//Large if statement based on hand result checks
			IF ResultBools.Royal AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_ROYAL_FLUSH;
			ELSIF ResultBools.Straight AND ResultBools.Flush THEN
				HandResult := FIVECARDPOKER_STRAIGHT_FLUSH;
			ELSIF ResultBools.FourAces THEN
				HandResult := FIVECARDPOKER_FOUR_ACES;
			ELSIF ResultBools.FourJQK THEN
				HandResult := FIVECARDPOKER_FOUR_JQK;
			ELSIF ResultBools.FourAny THEN
				HandResult := FIVECARDPOKER_FOUR_ANY;
			ELSIF ResultBools.ThreeOfAKind AND ResultBools.AnyPair THEN
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
	
	END_CASE
END_FUNCTION
