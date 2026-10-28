
PROGRAM _INIT
	(* Insert code here *)
	 
END_PROGRAM

PROGRAM _CYCLIC
	(* Insert code here *)
	//ensure password input meets requirements and if so enable the confirm button for user creation
	
	//transfer the string to an ascii array
	brsmemcpy(ADR(pwAsciiArray), ADR(gPasswordInput), brsstrlen(ADR(gPasswordInput)));
	
	
	//Reset values before restarting loop
	pwReqCheck := pwReqCheck_NULL;
	
	//Ensure password is at least 8 characters long
	pwReqCheck.isMinLength := brsstrlen(ADR(gPasswordInput)) >= 8;
	
	FOR pwReqCheckIndex := 0 TO brsstrlen(ADR(gPasswordInput)) DO //loop through full pw string
		//check for upper and lower case
		IF pwAsciiArray[pwReqCheckIndex] >= 65 AND pwAsciiArray[pwReqCheckIndex] <= 90 THEN
			pwReqCheck.hasUpperCase := TRUE;
		ELSIF pwAsciiArray[pwReqCheckIndex] >= 97 AND pwAsciiArray[pwReqCheckIndex] <= 122 THEN
			pwReqCheck.hasLowerCase := TRUE;
		END_IF
		
		//check for alphanumeric characters
		IF (pwAsciiArray[pwReqCheckIndex] >= 48 AND pwAsciiArray[pwReqCheckIndex] <= 57) OR (pwAsciiArray[pwReqCheckIndex] >= 65 AND pwAsciiArray[pwReqCheckIndex] <= 90) OR (pwAsciiArray[pwReqCheckIndex] >= 97 AND pwAsciiArray[pwReqCheckIndex] <= 122) THEN
			pwReqCheck.hasAlphaNumericChars := TRUE;
		END_IF
		
		//check for special characters
		IF (pwAsciiArray[pwReqCheckIndex] >= 33 AND pwAsciiArray[pwReqCheckIndex] <= 47) OR (pwAsciiArray[pwReqCheckIndex] >= 58 AND pwAsciiArray[pwReqCheckIndex] <= 64) OR (pwAsciiArray[pwReqCheckIndex] >= 123 AND pwAsciiArray[pwReqCheckIndex] <= 126) THEN
			pwReqCheck.hasSpecialChars := TRUE;
		END_IF
	END_FOR;
	
	//if lower and upper case letters are found during the loop then the pw is mixed case
	pwReqCheck.isMixedCase := pwReqCheck.hasLowerCase AND pwReqCheck.hasUpperCase;
	
	//if all requirements are met, the confirmation button is enabled
	enableCreateUser := pwReqCheck.isMinLength AND pwReqCheck.isMixedCase AND pwReqCheck.hasAlphaNumericChars AND pwReqCheck.hasSpecialChars;
	
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

	
	Result2String(gPlayer.Result, ResultStr);
	
	
	CASE gCurrentGame OF
		GAME_NONE:
			GameStr := '';
		GAME_BONUS_POKER:
			GameStr := 'Bonus Poker';
		GAME_DOUBLE_BONUS_POKER:
			GameStr := 'Double Bonus Poker';
		GAME_TRIPLE_BONUS_POKER:
			GameStr := 'Triple Bonus Poker';
		GAME_ULTRA_BONUS_POKER:
			GameStr := 'Ultra Bonus Poker';
		GAME_ALL_AMERICAN:
			GameStr := 'All American';
		GAME_JACKS_OR_BETTER:
			GameStr := 'Jacks or Better';
		GAME_ACES_AND_EIGHTS:
			GameStr := 'Aces & Eights';
		GAME_ACES_AND_FACES:
			GameStr := 'Aces & Faces';
	END_CASE
	
	EnableBetting := NOT gPlayer.ActiveRound; //Betting should only be enabled when the round is not active
	NotLoggedIn := NOT gPlayer.LoggedIn;
	
	FOR i := 0 TO 13 DO
		Result2String(gPayTable.Hands[i], PayTableStr[i]);
		PayTableScaledWinnings[i] := gPayTable.WinningsScalarArr[i] * gPlayer.ChosenBet;
		PayTableVisible[i] := gPayTable.WinningsScalarArr[i] <> 0;
	END_FOR
	
			
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

