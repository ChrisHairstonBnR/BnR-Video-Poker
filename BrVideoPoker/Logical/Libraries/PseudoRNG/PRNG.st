
(* Psuedo Randon Number Generator *)
FUNCTION_BLOCK PRNG
	
	IF NOT Initialized THEN //Checks if prng has been seeded and does so if not
		Result := Seed; //Set initial "result" to the seed for purpose of the forumla
		Initialized := TRUE;
	END_IF	
		
	IF CMD_Generate THEN //When CMD_Generate signal gets set to true generate the number
		Result := ((Result*Multiplier)+Increment) MOD RAND_MAX; //Formula applied to generate the next number
		CMD_Generate := FALSE; //Flips the trigger signal back false
	END_IF
	
END_FUNCTION_BLOCK
