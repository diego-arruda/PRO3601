
EXPORT ChicagoCrimesOptimized := MODULE
	EXPORT Layout := RECORD
	    UNSIGNED8 id;
        STRING8 case_number;
        STRING22 date;
        STRING30 block;
        STRING4 iucr;
        STRING30 primary_type;
        STRING60 description;
        STRING30 location_description;
        BOOLEAN arrest;
        BOOLEAN domestic;
        STRING4 beat;
        STRING3 district;
        UNSIGNED1 ward;
        UNSIGNED1 community_area;
        STRING3 fbi_code;
        UNSIGNED4 x_coordinate;
        UNSIGNED4 y_coordinate;
        UNSIGNED4 year;
        STRING22 updated_on;
        REAL8 latitude;
        REAL8 longitude;
        STRING29 location;
    END;
	EXPORT File := DATASET('~class::intro::dma::crimes_-_2001_to_present.csv',Layout, CSV(HEADING( 1 )));
END;

