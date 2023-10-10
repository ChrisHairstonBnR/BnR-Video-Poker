
PROGRAM _INIT
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	CASE UserState OF
		USERSTATE_WAITINGFORUSER:
			gPlayer.Balance := 0;
			ArUserSetProperty_FB.Execute := FALSE;
			
			IF CurrentUser <> '' AND CurrentUser <> 'Anonymous' THEN
				UserState := USERSTATE_GETBALANCE;
			END_IF;
			
		USERSTATE_GETBALANCE:
			ArUserGetProperty_FB.ElementName := CurrentUser;
			ArUserGetProperty_FB.ElementType := arUSER_USER_PROPERTIES;
			ArUserGetProperty_FB.PropertyName := 'Balance';
			ArUserGetProperty_FB.Execute := TRUE;
				
			//-1070585892: Specified element does not exist 
			IF ArUserGetProperty_FB.Error AND ArUserGetProperty_FB.ErrorID = arUSER_ERR_DOES_NOT_EXIST THEN //if property doesnt exist we will create it
				UserState := USERSTATE_RUN;
				gPlayer.Balance := 100;
				ArUserGetProperty_FB.Execute := FALSE;
			ELSIF ArUserGetProperty_FB.Done THEN
				UserState := USERSTATE_RUN;
				gPlayer.Balance := STRING_TO_REAL(ArUserGetProperty_FB.PropertyValue);
				ArUserGetProperty_FB.Execute := FALSE;
			ELSIF ArUserGetProperty_FB.Error THEN
				UserState := USERSTATE_ERROR;
				ArUserGetProperty_FB.Execute := FALSE;
			END_IF
				
		USERSTATE_RUN:
			//ArUserSetProperty_0(Execute := , ElementType := , ElementName := , PropertyName := , PropertyValue := );
			ArUserSetProperty_FB.ElementName := CurrentUser;
			ArUserSetProperty_FB.ElementType := arUSER_USER_PROPERTIES;
			ArUserSetProperty_FB.PropertyName := 'Balance';
			ArUserSetProperty_FB.PropertyValue := REAL_TO_STRING(gPlayer.Balance);
			ArUserSetProperty_FB.Execute := TRUE;
			
			IF ArUserSetProperty_FB.Done THEN
				ArUserSetProperty_FB.Execute := FALSE;
			END_IF
			   
			
			
			IF CurrentUser = '' OR CurrentUser = 'Anonymous' THEN
				UserState := USERSTATE_WAITINGFORUSER;
				ArUserSetProperty_FB.Execute := FALSE;
			END_IF;
			
			
					
		USERSTATE_ERROR:
				
			
	END_CASE;
	
	ArUserGetProperty_FB();
	ArUserSetProperty_FB();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

