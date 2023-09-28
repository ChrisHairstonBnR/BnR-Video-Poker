
{REDUND_ERROR} FUNCTION_BLOCK CardDeck (*Deck Funtionality*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL;
		Shuffle : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		Active : {REDUND_UNREPLICABLE} BOOL;
		Cards : ARRAY[0..51] OF Card_typ;
	END_VAR
	VAR
		Initialized : BOOL;
		Randy : PRNG;
		n : USINT;
		r : USINT;
		i : USINT;
		State : DeckState;
	END_VAR
	VAR_OUTPUT
		CommandDone : BOOL;
	END_VAR
	VAR
		InitSuit : USINT;
		InitFace : USINT;
	END_VAR
END_FUNCTION_BLOCK

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
