
PROGRAM _INIT
	(* Insert code here *)
	 gCurrentGame;
END_PROGRAM

PROGRAM _CYCLIC
	 //TestTable := PAY_TABLE_JACKS_OR_BETTER;
	gPlayer.Hand := TestHand;
	Result := HandResult(gPlayer.Hand, GAME_JACKS_OR_BETTER);
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

