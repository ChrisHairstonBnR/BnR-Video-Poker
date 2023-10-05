
TYPE
	Player_typ : 	STRUCT 
		Balance : REAL;
		Hand : ARRAY[0..4]OF Card_typ;
		HoldArr : ARRAY[0..4]OF BOOL;
	END_STRUCT;
END_TYPE
