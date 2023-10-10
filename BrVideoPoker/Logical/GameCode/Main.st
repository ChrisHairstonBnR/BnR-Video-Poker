
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
				IF gPlayer.HoldArr[i] THEN
					gPlayer.HoldArr[i] := FALSE;
					gPlayer.Hand[i] := gDeck.Deck[DeckCardCount];
					DeckCardCount := DeckCardCount + 1;
				END_IF
			END_FOR
					
			GameState := GAME_STATE_RESULTS;
			
		GAME_STATE_RESULTS:
			Result := HandResult(gPlayer.Hand, GAME_JACKS_OR_BETTER);
		
		GAME_STATE_ERROR:
		
	END_CASE
	
	//Deck custom FB
	gDeck.Enable := TRUE;
	gDeck();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

