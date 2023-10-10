
TYPE
	Player_typ : 	STRUCT 
		Balance : REAL;
		Hand : ARRAY[0..4]OF Card_typ;
		HoldArr : ARRAY[0..4]OF BOOL;
		ChosenBet : REAL;
		Winnings : REAL;
		Result : FiveCardPoker_enum;
	END_STRUCT;
	Command_typ : 	STRUCT 
		CMD_Action : BOOL;
	END_STRUCT;
END_TYPE
