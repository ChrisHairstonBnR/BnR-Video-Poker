
PROGRAM _INIT
	
	 
END_PROGRAM

PROGRAM _CYCLIC
	

	
	//ArUserSetProperty_0(Execute := , ElementType := , ElementName := , PropertyName := , PropertyValue := );
	ArUserSetProperty_FB.ElementName := CurrentUser;
	ArUserSetProperty_FB.ElementType := arUSER_USER_PROPERTIES;
	ArUserSetProperty_FB.PropertyName := 'Balance';
	ArUserSetProperty_FB.PropertyValue := '100.67';
	ArUserSetProperty_FB();
	
	ArUserGetProperty_FB.ElementName := CurrentUser;
	ArUserGetProperty_FB.ElementType := arUSER_USER_PROPERTIES;
	ArUserGetProperty_FB.PropertyName := 'Balance';
	ArUserGetProperty_FB();
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

