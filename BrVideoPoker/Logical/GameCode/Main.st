
PROGRAM _INIT
	(* Insert code here *)
	 gCurrentGame;
END_PROGRAM

PROGRAM _CYCLIC
	 //TestTable := PAY_TABLE_JACKS_OR_BETTER;
	//gPlayer.Hand := TestHand;
	//Result := HandResult(gPlayer.Hand, GAME_JACKS_OR_BETTER);
	
	//Choose pay table based on game
	CASE gCurrentGame OF
		GAME_NONE:
					
		GAME_BONUS_POKER:
			gPayTable := PAY_TABLE_BONUS_POKER;
		GAME_DOUBLE_BONUS_POKER:
			gPayTable := PAY_TABLE_DOUBLE_BONUS_POKER;
		GAME_TRIPLE_BONUS_POKER:
			gPayTable := PAY_TABLE_TRIPLE_BONUS_POKER;
		GAME_ULTRA_BONUS_POKER:
				
		GAME_ALL_AMERICAN:
				
		GAME_JACKS_OR_BETTER:
			gPayTable := PAY_TABLE_JACKS_OR_BETTER;
		GAME_ACES_AND_EIGHTS:
				
		GAME_ACES_AND_FACES:
				
	END_CASE
	
	
	CASE GameState OF
		GAME_STATE_WAIT:
			gPlayer.Result := FIVECARDPOKER_NOTHING;
			gPlayer.Winnings := 0;
			gPlayer.ActiveRound := FALSE;
			
			ActionButtonStr := 'Play';
			
			IF gCommand.CMD_Action THEN
				gCommand.CMD_Action := FALSE;
				GameState := GAME_STATE_SHUFFLE;
			END_IF
			
		GAME_STATE_SHUFFLE:	
			gDeck.CMD_Shuffle := TRUE;
			
			IF gDeck.CommandDone THEN
				GameState := GAME_STATE_DEAL;
			END_IF
		
		GAME_STATE_DEAL:
			gPlayer.ActiveRound := TRUE;
			gPlayer.Balance := gPlayer.Balance - gPlayer.ChosenBet;
			FOR DeckCardCount := 0 TO 4 DO
				gPlayer.Hand[DeckCardCount] := gDeck.Deck[DeckCardCount];
			END_FOR
			
			GameState := GAME_STATE_HOLD;
		
		GAME_STATE_HOLD:
			//Wait for user to select cards to hold
			ActionButtonStr := 'Draw';
			IF NOT gPlayer.LoggedIn THEN
				GameState := GAME_STATE_WAIT;
			ELSIF gCommand.CMD_Action THEN
				gCommand.CMD_Action := FALSE;
				GameState := GAME_STATE_REDEAL;
			END_IF	
			
		GAME_STATE_REDEAL:
			DeckCardCount := 5;
			
			FOR i := 0 TO 4 DO
				IF  NOT gPlayer.HoldArr[i] THEN
					gPlayer.Hand[i] := gDeck.Deck[DeckCardCount];
					DeckCardCount := DeckCardCount + 1;
				ELSE
					gPlayer.HoldArr[i] := FALSE;
				END_IF
			END_FOR
					
			GameState := GAME_STATE_RESULTS;
			
		GAME_STATE_RESULTS:
			gPlayer.Result := HandResult(gPlayer.Hand, gCurrentGame);
			ActionButtonStr := 'Clear';
			
			
			gPlayer.Winnings := CalculateWinnings(gPlayer.Result, gPlayer.ChosenBet, gPayTable);
			
			IF R_TRIG_ResultState.Q THEN
				gPlayer.Balance := gPlayer.Balance + gPlayer.Winnings;
			END_IF
			
			IF NOT gPlayer.LoggedIn THEN
				GameState := GAME_STATE_WAIT;
			ELSIF gCommand.CMD_Confirm OR gCommand.CMD_Action THEN
				gCommand.CMD_Action := FALSE;
				gCommand.CMD_Confirm := FALSE;
				GameState := GAME_STATE_WAIT;
			END_IF	
			
		GAME_STATE_ERROR:
		
	END_CASE
	
	//R Trig to ensure winnings are only given once
	R_TRIG_ResultState(CLK := (GameState = GAME_STATE_RESULTS));
	
	//Deck custom FB
	gDeck.Enable := TRUE;
	gDeck();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

