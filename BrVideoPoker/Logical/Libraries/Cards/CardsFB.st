
(* Deck Funtionality *)
FUNCTION_BLOCK CardsFB
	CASE State OF
		DECKSTATE_INIT:
			IF Enable AND NOT Initialized THEN
				//Initialize unshuffled deck
				FOR SuitIndex := 0 TO 3 DO
					FOR FaceIndex := 0 TO 12 DO
						Deck[SuitIndex*13+FaceIndex].Face := FaceIndex;
						Deck[SuitIndex*13+FaceIndex].Suit := SuitIndex;
					END_FOR;
				END_FOR;
		
				//Initialize RNG
				Randy(Multiplier := 4, Increment := 13, Seed := AsIOTimeStamp());
			
				State := DECKSTATE_IDLE;
				Active := TRUE;
				Initialized := TRUE;
			END_IF
			
			
			
		DECKSTATE_IDLE:
			IF CommandDone AND CMD_Shuffle THEN
				CommandDone := FALSE;
				CMD_Shuffle := FALSE;
			END_IF
			
			IF CMD_Shuffle THEN
				State := DECKSTATE_SHUFFLE;
			END_IF
			
		DECKSTATE_SHUFFLE:
			FOR IndexI := 0 TO ShuffleCount DO
				FOR IndexJ := 0 TO 51 DO
					Randy.CMD_Generate := TRUE;
					Randy();
					
					IndexR := UDINT_TO_USINT(  IndexJ + (Randy.Result MOD (52-IndexJ)));
					SwapCard(ADR(Deck), IndexJ, IndexR);
				END_FOR;
			END_FOR;
			
			CommandDone := TRUE;
			State := DECKSTATE_IDLE;
			
		
		DECKSTATE_ERROR:
		
	END_CASE;
			
		
		
		

	
END_FUNCTION_BLOCK
