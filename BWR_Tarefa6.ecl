IMPORT $;

layout := RECORD
    $.ChicagoCrimesOptimized.File.year;
    cnt := COUNT(GROUP);
END;


YearCount := TABLE($.ChicagoCrimesOptimized.File,layout,year);
Avg_Crimes := AVE(YearCount, cnt);

OUTPUT(YearCount, NAMED('YearCount'));
OUTPUT(Avg_Crimes, NAMED('Avg_Crimes'));