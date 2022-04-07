EXPORT ChicagoCrimes := MODULE
	EXPORT Layout := RECORD
	  UNSIGNED8 ID;
		STRING8 Case_Number;
		STRING22 Date;
		STRING30 Block;
		STRING4 IUCR;
		STRING30 Primary_Type;
		STRING100 Description;
		STRING30 Location_Description;
		BOOLEAN Arrest;
		BOOLEAN Domestic;
		STRING4 Beat;
		STRING3 District;
		STRING2 Ward;
		STRING2 Community_Area;
		STRING3 FBI_Code;
		STRING7 X_Coordinate;
		STRING7 Y_Coordinate;
		UNSIGNED4 Year;
		STRING22 Updated_On;
		STRING15 Latitude;
		STRING15 Longitude;
		STRING30 Location;
	END;
	EXPORT File := DATASET('~class::intro::dma::crimes_-_2001_to_present.csv',Layout, CSV(HEADING( 1 )));
END;