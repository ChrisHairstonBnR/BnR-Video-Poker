Chris Hairston
chris.hairston@br-automation.com
4/1/2022

Overview:
	This library utilizes the linear congruential generator algorithm to generate a random number between 0 and 32797.

Linear Congruential Generation (LCG):
	NewNum = ((PrevNum*a) + c)% m
		where,
	a is the multiplier
	c is the increment
	m is the modulus (and functions as the max number, in this case 32767)
	
	
Usage:
	1. Seed the generator using AsIOTimeStamp
	2. Set CMD_Generate to true to generate number
	3. Call function block
	4. Use modulus function to determine range of prng (otherwise will be 0-32797)

Example: //This code generates a new number every 10 seconds.
	PROGRAM _INIT
		 Randy.Seed := DINT_TO_UDINT(AsIOTimeStamp());
	END_PROGRAM
	
	PROGRAM _CYCLIC
		TON_0(IN := NOT TON_0.Q, PT := T#10s);
		IF  TON_0.Q THEN
			Randy.CMD_Generate := TRUE;
		END_IF
		Randy();
		RandOf100 := Randy.Result MOD 100;
	END_PROGRAM