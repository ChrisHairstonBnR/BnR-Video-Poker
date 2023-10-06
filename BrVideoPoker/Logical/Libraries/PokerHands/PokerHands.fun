
{REDUND_ERROR} FUNCTION HandResult : FiveCardPoker_enum (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Hand : ARRAY[0..4] OF Card_typ;
		GameVariant : GameVariant_enum;
	END_VAR
	VAR
		ResultBools : HandBools_typ;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION CalculateWinnings : REAL (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		PlayerHand : FiveCardPoker_enum;
		Bet : REAL;
	END_VAR
	VAR_IN_OUT
		PayTable : PayTable_typ;
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION
