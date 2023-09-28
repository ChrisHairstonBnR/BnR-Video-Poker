
(* Deck Funtionality *)
FUNCTION_BLOCK CardDeck
	CASE State OF
		DECKSTATE_INIT:
			IF Enable AND NOT Initialized THEN
				//Initialize unshuffled deck
				FOR InitSuit := 0 TO 3 DO
					FOR InitFace := 0 TO 12 DO
						Cards[InitSuit*13+InitFace].Face := InitFace;
						Cards[InitSuit*13+InitFace].Suit := InitSuit;
					END_FOR;
				END_FOR;
		
				//Initialize RNG
				Randy(Multiplier := 4, Increment := 13, Seed := AsIOTimeStamp());
			
				State := DECKSTATE_IDLE;
			END_IF
			
			
			
		DECKSTATE_IDLE:
			CommandDone := FALSE;;
			Initialized := TRUE;
			Active := TRUE;
			
			IF Shuffle THEN
				State := DECKSTATE_SHUFFLE;
			END_IF
		DECKSTATE_SHUFFLE:
			FOR n := 0 TO 5 DO
				FOR i := 0 TO 51 DO
					Randy.CMD_Generate := TRUE;
					Randy();
					
					r := UDINT_TO_USINT(  i + (Randy.Result MOD (52-i)));
					SwapCard(ADR(Cards), i, r);
				END_FOR;
			END_FOR;
			
			CommandDone := TRUE;
			State := DECKSTATE_IDLE;
			
		
		
		DECKSTATE_ERROR:
		
	END_CASE;
			
		
		
		

	
END_FUNCTION_BLOCK
