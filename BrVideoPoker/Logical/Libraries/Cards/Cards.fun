
{REDUND_ERROR} FUNCTION SwapCard : BOOL (*Swap the place of two cards within deck*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Deck : REFERENCE TO ARRAY[0..51] OF Card_typ;
		CardIndexA : USINT;
		CardIndexB : USINT;
	END_VAR
	VAR
		TempCard : Card_typ;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK CardFB (*Core funciton block of the library*)
	VAR_INPUT
		CMD_Shuffle : BOOL;
		Enable : BOOL;
	END_VAR
	VAR_OUTPUT
		Deck : ARRAY[0..51] OF Card_typ;
	END_VAR
	VAR
		CommandDone : BOOL;
		IndexI : USINT;
		IndexJ : USINT;
		IndexR : USINT;
		ShuffleCount : USINT := 5;
		FaceIndex : USINT;
		SuitIndex : USINT;
		State : DeckState;
		Initialized : BOOL;
		Randy : PRNG;
	END_VAR
	VAR_OUTPUT
		Active : BOOL;
	END_VAR
END_FUNCTION_BLOCK
