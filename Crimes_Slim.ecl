IMPORT $;
EXPORT Crimes_Slim := MODULE
	EXPORT Layout := RECORD
			RECORDOF($.CrimesTransformed.File) AND NOT [block,community_area,district];
			UNSIGNED BCD_ID;
	END;
	EXPORT File := DATASET('~CLASS::dma::OUT::Crimes_Slim',Layout,FLAT);

END;