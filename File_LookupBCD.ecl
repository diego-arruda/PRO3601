EXPORT File_LookupBCD := MODULE
	EXPORT Layout := RECORD
			UNSIGNED BCD_ID;
			STRING30 block;
			UNSIGNED1 community_area;
			STRING3 district;
	END;
	SHARED Filename := '~~CLASS::DMA::OUT::LookupBCD';
	EXPORT File := DATASET(Filename,Layout,FLAT);
	
END;