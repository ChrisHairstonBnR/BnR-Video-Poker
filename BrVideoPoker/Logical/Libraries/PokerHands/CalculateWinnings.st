
(* TODO: Add your comment here *)
FUNCTION CalculateWinnings
	FOR i := 0 TO 13 DO
		IF PayTable.Hands[i] = PlayerHand THEN
			CalculateWinnings := Bet * PayTable.WinningsScalarArr[i];
			EXIT;
		END_IF
	END_FOR
END_FUNCTION
