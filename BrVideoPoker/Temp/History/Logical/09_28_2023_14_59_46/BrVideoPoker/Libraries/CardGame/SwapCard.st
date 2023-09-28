
(* Swap the place of two cards within deck *)
FUNCTION SwapCard
	TempCard := Deck[CardIndexA];
	Deck[CardIndexA] := Deck[CardIndexB];
	Deck[CardIndexB] := TempCard;
END_FUNCTION
