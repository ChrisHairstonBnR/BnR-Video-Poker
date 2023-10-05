
TYPE
	Player_typ : 	STRUCT 
		Balance : REAL;
		Hand : ARRAY[0..4]OF Card_typ;
		HoldArr : ARRAY[0..4]OF BOOL;
		ChosenBet : REAL;
	END_STRUCT;
END_TYPE
