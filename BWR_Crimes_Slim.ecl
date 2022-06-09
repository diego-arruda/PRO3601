IMPORT $;

$.Crimes_Slim.Layout Slimdown($.CrimesTransformed.Layout L,
							    $.File_LookupBCD.Layout R) := TRANSFORM
		SELF.BCD_ID := R.BCD_ID;
		SELF := L;
END;

SlimRecs := JOIN($.CrimesTransformed.File,$.File_LookupBCD.File,
									LEFT.block=RIGHT.block AND
									LEFT.community_area=RIGHT.community_area AND
									LEFT.district=RIGHT.district,
									Slimdown(LEFT,RIGHT),LEFT OUTER, LOOKUP);

OUTPUT(SlimRecs,,'~CLASS::dma::OUT::Crimes_Slim',overwrite);

