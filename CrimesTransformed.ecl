
EXPORT CrimesTransformed := MODULE
	EXPORT Layout := RECORD
        unsigned8 row_id;
        string formatted_date;
        string formatted_time;
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
	EXPORT File := DATASET('~class::dma::persist::chicagocrimestransformed__p432596496',Layout,FLAT);
END;

