
TYPE
	Player_typ : 	STRUCT 
		Balance : REAL;
		Hand : ARRAY[0..4]OF Card_typ;
		HoldArr : ARRAY[0..4]OF BOOL;
		ChosenBet : REAL;
		Winnings : REAL;
		ActiveRound : BOOL;
		Result : FiveCardPoker_enum;
		LoggedIn : BOOL;
	END_STRUCT;
	Command_typ : 	STRUCT 
		CMD_Confirm : BOOL;
		CMD_Action : BOOL;
	END_STRUCT;
END_TYPE
