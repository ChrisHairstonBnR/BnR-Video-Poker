
PROGRAM _INIT
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	CASE UserState OF
		USERSTATE_WAITINGFORUSER:
			gPlayer.Balance := 0;
			ArUserSetProperty_FB.Execute := FALSE;
			gPlayer.LoggedIn := FALSE;
			
			IF CurrentUser <> '' AND CurrentUser <> 'Anonymous' THEN
				UserState := USERSTATE_GETBALANCE;
			END_IF;
			
		USERSTATE_GETBALANCE:
			ArUserGetProperty_FB.ElementName := CurrentUser;
			ArUserGetProperty_FB.ElementType := arUSER_USER_PROPERTIES;
			ArUserGetProperty_FB.PropertyName := 'Balance';
			ArUserGetProperty_FB.Execute := TRUE;
			
			gPlayer.LoggedIn := TRUE;
				
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
	
	
	CASE CreateUserState OF
		CREATE_USER_WAIT:
			//CMD_UserCreationDone := FALSE;
			IF CMD_CreateUser THEN
				CreateUserState := CREATE_USER_CREATE;
				CMD_UserCreationDone := FALSE;
			END_IF
		CREATE_USER_CREATE:
			ArUserCreate_FB.Execute := TRUE;
			ArUserCreate_FB.UserName := CreateUserNameStr;
			
			IF ArUserCreate_FB.Busy THEN
				//do nothing
			ELSIF ArUserCreate_FB.Done THEN
				//CMD_CreateUser := FALSE;
				ArUserCreate_FB.Execute := FALSE;
				ArUserCreate_FB.UserName := '';
				CreateUserState := CREATE_USER_SET_PASSWORD;
			ELSIF ArUserCreate_FB.Error THEN
				ArUserCreate_FB.Execute := FALSE;
				ArUserCreate_FB.UserName := '';
				ErrorCode := ArUserCreate_FB.ErrorID;
				CreateUserState := CREATE_USER_ERROR;
			END_IF
		CREATE_USER_SET_PASSWORD:
			ArUserSetPassword_FB.Execute := TRUE;
			ArUserSetPassword_FB.UserName := CreateUserNameStr;
			ArUserSetPassword_FB.Password := CreateUserPassStr;
			
			IF ArUserSetPassword_FB.Busy THEN
				//do nothing
			ELSIF ArUserSetPassword_FB.Done THEN
				//CMD_CreateUser := FALSE;
				ArUserSetPassword_FB.Execute := FALSE;
				ArUserSetPassword_FB.UserName := '';
				ArUserSetPassword_FB.Password := '';
				CMD_CreateUser := FALSE;
				ErrorCode := ArUserSetPassword_FB.ErrorID;
				CMD_UserCreationDone := TRUE;
				CreateUserState := CREATE_USER_WAIT;
			ELSIF ArUserSetPassword_FB.Error THEN
				ArUserSetPassword_FB.Execute := FALSE;
				ArUserSetPassword_FB.UserName := '';
				ArUserSetPassword_FB.Password := '';
				CMD_CreateUser := FALSE;
				CreateUserState := CREATE_USER_ERROR;
			END_IF
			
		CREATE_USER_ERROR:
			CASE ErrorCode OF
				arUSER_ERR_PARAMETER:
					ErrorStr := 'The function block was called with an invalid parameter.'; //Should not occur unless programmer has messed up
				arUSER_ERR_ALREADY_EXISTS:
					ErrorStr := 'The user already exists.';
				arUSER_ERR_DOES_NOT_EXIST:
					ErrorStr := 'The user does not exist.';
				arUSER_ERR_INTERNAL:
					ErrorStr :='An unexpected internal error has occurred.';
				ELSE
					ErrorStr := '';
			END_CASE
		
	END_CASE
	
	
		
	ArUserCreate_FB();
	ArUserSetPassword_FB();
	ArUserGetProperty_FB();
	ArUserSetProperty_FB();
	
	//MpUserXManagerUI for monitoring (requres mpuserxlogin)
	MpUserXLogin_FB(MpLink :=  ADR(gUserXLogin), Enable := TRUE);
	MpUserXManagerUI_FB(MpLink := ADR(gUserXLogin), Enable := TRUE, UISetup := MpUserXManagerUI_Setup, UIConnect := ADR(MpUserXManagerUI_Connect));
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

