
PROGRAM _INIT
	(* Insert code here *)
	 gCurrentGame;
END_PROGRAM

PROGRAM _CYCLIC
	 //TestTable := PAY_TABLE_JACKS_OR_BETTER;
	//gPlayer.Hand := TestHand;
	//Result := HandResult(gPlayer.Hand, GAME_JACKS_OR_BETTER);
	
	
	CASE GameState OF
		GAME_STATE_WAIT:
			gPlayer.ActiveRound := FALSE;
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
			FOR DeckCardCount := 0 TO 4 DO
				gPlayer.Hand[DeckCardCount] := gDeck.Deck[DeckCardCount];
			END_FOR
			
			GameState := GAME_STATE_HOLD;
		
		GAME_STATE_HOLD:
			//Wait for user to select cards to hold
			
			IF gCommand.CMD_Action THEN
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
			gPlayer.Result := HandResult(gPlayer.Hand, GAME_JACKS_OR_BETTER);
			
			IF gCommand.CMD_Action THEN
				gCommand.CMD_Action := FALSE;
				GameState := GAME_STATE_WAIT;
			END_IF	
		GAME_STATE_ERROR:
		
	END_CASE
	
	//Deck custom FB
	gDeck.Enable := TRUE;
	gDeck();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

