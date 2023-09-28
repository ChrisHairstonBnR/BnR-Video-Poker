
FUNCTION_BLOCK PRNG
	VAR_INPUT
		Multiplier : {REDUND_UNREPLICABLE} UINT := 16; (*Multiplier parameter in formula*)
		Increment : {REDUND_UNREPLICABLE} UINT := 0; (*Increment parameter in formula*)
		CMD_Generate : {REDUND_UNREPLICABLE} BOOL; (*Input used to trigger generation*)
		Seed : UDINT; (*Initial seed used for formula*)
	END_VAR
	VAR_OUTPUT
		Result : {REDUND_UNREPLICABLE} UDINT; (*Output of generation*)
	END_VAR
	VAR
		Initialized : BOOL; (*True after procedure has been seeded*)
	END_VAR
END_FUNCTION_BLOCK
