
FUNCTION Result2String
	CASE ResultHand OF
		FIVECARDPOKER_NOTHING:
			destString := '';
		FIVECARDPOKER_PAIR_FACE:
			destString := 'Jacks or Better';
		FIVECARDPOKER_TWO_PAIR:
			destString := 'Two Pair';
		FIVECARDPOKER_THREE_OF_A_KIND:
			destString := 'Three of a Kind';
		FIVECARDPOKER_FULL_HOUSE:
			destString := 'Full House';
		FIVECARDPOKER_STRAIGHT:
			destString := 'Straight';
		FIVECARDPOKER_FLUSH:
			destString := 'Flush';
		FIVECARDPOKER_STRAIGHT_FLUSH:
			destString := 'Straight Flush';
		FIVECARDPOKER_FOUR_ANY:
			destString := 'Four of a Kind';
		FIVECARDPOKER_FOUR_234:
			destString := 'Four 2s, 3s, 4s';
		FIVECARDPOKER_FOUR_FIVE_THRU_K:
			destString := 'Four 5s Thru Ks';
		FIVECARDPOKER_FOUR_EIGHTS:
			destString := 'Four Eights';
		FIVECARDPOKER_FOUR_JQK:
			destString := 'Four of a Face';
		FIVECARDPOKER_FOUR_ACES:
			destString := 'Four Aces';
		FIVECARDPOKER_ROYAL_FLUSH:
			destString := 'Royal Flush!';
	END_CASE;
	
	Result2String := TRUE; //Successful function call
END_FUNCTION
