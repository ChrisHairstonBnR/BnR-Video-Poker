
TYPE
	GameVariant_enum : 
		(
		GAME_NONE,
		GAME_BONUS_POKER,
		GAME_DOUBLE_BONUS_POKER,
		GAME_TRIPLE_BONUS_POKER,
		GAME_ULTRA_BONUS_POKER,
		GAME_ALL_AMERICAN,
		GAME_JACKS_OR_BETTER,
		GAME_ACES_AND_EIGHTS,
		GAME_ACES_AND_FACES
		);
	FiveCardPoker_enum : 
		(
		FIVECARDPOKER_NOTHING,
		FIVECARDPOKER_PAIR_FACE,
		FIVECARDPOKER_TWO_PAIR,
		FIVECARDPOKER_THREE_OF_A_KIND,
		FIVECARDPOKER_STRAIGHT,
		FIVECARDPOKER_FLUSH,
		FIVECARDPOKER_FULL_HOUSE,
		FIVECARDPOKER_FOUR_ANY,
		FIVECARDPOKER_FOUR_EIGHTS,
		FIVECARDPOKER_FOUR_JQK,
		FIVECARDPOKER_FOUR_ACES,
		FIVECARDPOKER_STRAIGHT_FLUSH,
		FIVECARDPOKER_ROYAL_FLUSH
		);
	HandBools_typ : 	STRUCT 
		AnyPair : BOOL;
		FacePair : BOOL;
		TwoPair : BOOL;
		ThreeOfAKind : BOOL;
		Straight : BOOL;
		Flush : BOOL;
		FourAny : BOOL;
		FourEights : BOOL;
		FourJQK : BOOL;
		FourAces : BOOL;
		Royal : BOOL;
	END_STRUCT;
	PayTable_typ : 	STRUCT 
		Hands : ARRAY[0..13]OF FiveCardPoker_enum := [FIVECARDPOKER_NOTHING,13(0)];
		WinningsScalarArr : ARRAY[0..13]OF REAL; (*Amount to multiply bet for winnings if that hand is achieved.*)
		GameVariant : GameVariant_enum;
	END_STRUCT;
	PayTableConst_typ : 	STRUCT 
		Hands : ARRAY[0..13]OF USINT := [14(0)];
		WinningsScalarArr : ARRAY[0..13]OF REAL; (*Amount to multiply bet for winnings if that hand is achieved.*)
		GameVariant : USINT;
	END_STRUCT;
END_TYPE
