IMPORT $;

// $.CrimesTransformed.File;

Layout_adress_rec := RECORD
    UNSIGNED BCD_ID := $.CrimesTransformed.File.row_id;
    $.CrimesTransformed.File.block;
    $.CrimesTransformed.File.community_area;
    $.CrimesTransformed.File.district;
END;

adress_recs := TABLE($.CrimesTransformed.File, Layout_adress_rec);
// adress_recs;
sorted_recs := SORT(adress_recs, block, community_area, district);

Layout_adress_rec rollcsv(Layout_adress_rec Le, Layout_adress_rec Ri) := TRANSFORM
    SELF.BCD_ID := IF(Le.BCD_ID < Ri.BCD_ID, Le.BCD_ID, Ri.BCD_ID);
    SELF := Le;
END;


Rollup_BCD := ROLLUP(sorted_recs,
										LEFT.block=RIGHT.block AND
										LEFT.community_area=RIGHT.community_area AND
										LEFT.district=RIGHT.district,
										rollcsv(LEFT,RIGHT));

Rollup_BCD2 := SORT (Rollup_BCD,BCD_ID);
			
OUTPUT(Rollup_BCD2,,'~CLASS::DMA::OUT::LookupBCD',OVERWRITE);



