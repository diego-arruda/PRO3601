import $, STD;

layout_id := RECORD
    UNSIGNED row_id;
    STRING formatted_date;
    STRING formatted_time;
    $.ChicagoCrimesOptimized.Layout;
END;

time := RECORD
    STRING adjustedTime;
END;

time changeTimeFormat(STRING oldFormat,STRING AMorPM) := TRANSFORM
    splittedTime := STD.Str.SplitWords(oldFormat,':');
    hour := (INTEGER) splittedTime[1];
    adjustedHourInt := IF(hour = 12 and AMorPM = 'AM', hour - 12, IF(AMorPM = 'PM' and hour >= 1 and hour <= 11, hour + 12, hour));
    flagAddZero := IF(adjustedHourInt < 10, TRUE, FALSE);
    adjustedHourStr := IF(flagAddZero, '0' + (STRING) adjustedHourInt , (STRING) adjustedHourInt);
    SELF.adjustedTime := adjustedHourStr + splittedTime[2] + splittedTime[3];
END;

layout_id addColumns($.ChicagoCrimesOptimized.Layout L, INTEGER C) := TRANSFORM
    SELF.row_id := C;
    splitted := STD.Str.SplitWords(L.date, ' ');
    SELF.formatted_date := (STRING) STD.Date.FromStringToDate(splitted[1], '%m/%d/%Y');
    time := PROJECT(L, changeTimeFormat(splitted[2],splitted[3]));
    SELF.formatted_time := time.adjustedTime;
    SELF := L;
END;

EXPORT ChicagoCrimesTransformed := PROJECT($.ChicagoCrimesOptimized.File, addColumns(LEFT,COUNTER))
                                                                :PERSIST('~class::dma::persist::ChicagoCrimesTransformed');