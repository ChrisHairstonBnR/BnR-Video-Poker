
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	gPlayer.ChosenBet := BET_ARRAY[BetIndex];
	
	//Generate card strings for the image bindings
	FOR i :=0 TO 4 DO
		IF NOT gPlayer.ActiveRound THEN
			CardStr[i] := 	'Media/Cards/Minicard_Back.svg';
		ELSE
			CardStr[i] := 'Media/Cards/Minicard_';
			
			//CASE statement for card value/face
			CASE gPlayer.Hand[i].Face OF
				CARD_TWO:
					CardStr[i] := CONCAT(CardStr[i], '2');
				CARD_THREE:
					CardStr[i] := CONCAT(CardStr[i], '3');
				CARD_FOUR:
					CardStr[i] := CONCAT(CardStr[i], '4');
				CARD_FIVE:
					CardStr[i] := CONCAT(CardStr[i], '5');
				CARD_SIX:
					CardStr[i] := CONCAT(CardStr[i], '6');
				CARD_SEVEN:
					CardStr[i] := CONCAT(CardStr[i], '7');
				CARD_EIGHT:
					CardStr[i] := CONCAT(CardStr[i], '8');
				CARD_NINE:
					CardStr[i] := CONCAT(CardStr[i], '9');
				CARD_TEN:
					CardStr[i] := CONCAT(CardStr[i], '10');
				CARD_JACK:
					CardStr[i] := CONCAT(CardStr[i], 'J');
				CARD_QUEEN:
					CardStr[i] := CONCAT(CardStr[i], 'Q');
				CARD_KING:
					CardStr[i] := CONCAT(CardStr[i], 'K');
				CARD_ACE:
					CardStr[i] := CONCAT(CardStr[i], 'A');
			END_CASE
			
			CASE gPlayer.Hand[i].Suit OF
				SUIT_CLUBS:
					CardStr[i] := CONCAT(CardStr[i], 'C');
				SUIT_DIAMONDS:
					CardStr[i] := CONCAT(CardStr[i], 'D');
				SUIT_HEARTS:
					CardStr[i] := CONCAT(CardStr[i], 'H');
				SUIT_SPADES:
					CardStr[i] := CONCAT(CardStr[i], 'S');
			END_CASE
			
			CardStr[i] := CONCAT(CardStr[i], '.svg');
		END_IF	
	END_FOR
	
	CASE gPlayer.Result OF
		FIVECARDPOKER_NOTHING:
			ResultStr := '';
		FIVECARDPOKER_PAIR_FACE:
			ResultStr := 'Pair';
		FIVECARDPOKER_TWO_PAIR:
			ResultStr := 'Two Pair';
		FIVECARDPOKER_THREE_OF_A_KIND:
			ResultStr := 'Three of a Kind';
		FIVECARDPOKER_FULL_HOUSE:
			ResultStr := 'Full House';
		FIVECARDPOKER_STRAIGHT:
			ResultStr := 'Straight';
		FIVECARDPOKER_FLUSH:
			ResultStr := 'Flush';
		FIVECARDPOKER_STRAIGHT_FLUSH:
			ResultStr := 'Straight Flush';
		FIVECARDPOKER_FOUR_ANY:
			ResultStr := 'Four of a Kind';
		FIVECARDPOKER_FOUR_EIGHTS:
			ResultStr := 'Four Eights';
		FIVECARDPOKER_FOUR_JQK:
			ResultStr := 'Four of a Face';
		FIVECARDPOKER_FOUR_ACES:
			ResultStr := 'Four Aces';
		FIVECARDPOKER_ROYAL_FLUSH:
			ResultStr := 'Royal Flush!';
	END_CASE;
	
	EnableBetting := NOT gPlayer.ActiveRound; //Betting should only be enabled when the round is not active
			
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

