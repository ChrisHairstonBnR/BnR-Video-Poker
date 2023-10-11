
{REDUND_ERROR} FUNCTION HandResult : FiveCardPoker_enum (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Hand : ARRAY[0..4] OF Card_typ;
		GameVariant : GameVariant_enum;
	END_VAR
	VAR
		ColumnTotals : ARRAY[1..14] OF USINT;
		RowTotals : ARRAY[0..3] OF USINT;
		i : USINT;
		j : USINT;
		k : USINT;
		CardMatrix : ARRAY[0..3,1..14] OF BOOL;
		tempHand : ARRAY[0..4] OF Card_typ;
		ResultBools : HandBools_typ;
		StraightCount : USINT;
		PairCount : USINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION CalculateWinnings : REAL (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		PlayerHandResult : FiveCardPoker_enum;
		Bet : REAL;
	END_VAR
	VAR_IN_OUT
		PayTable : PayTable_typ;
	END_VAR
	VAR
		i : USINT;
	END_VAR
END_FUNCTION

FUNCTION Result2String : BOOL
	VAR_INPUT
		ResultHand : FiveCardPoker_enum;
	END_VAR
	VAR_IN_OUT
		destString : STRING[80];
	END_VAR
END_FUNCTION
