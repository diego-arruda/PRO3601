IMPORT $,STD;

Crimes := $.ChicagoCrimes.File;

bestrecord := STD.DataPatterns.BestRecordStructure(Crimes);

OUTPUT(bestrecord, ALL, NAMED('BestRecord'));
















// IMPORT DataPatterns;
// profileResults 	:= DataPatterns.Profile(Persons);
// bestrecord := DataPatterns.BestRecordStructure(Persons);
// normResults := DataPatterns.NormalizeProfileResults(profileResults);
// OUTPUT(profileResults, ALL, NAMED('profileResults'));
// OUTPUT(normResults, ALL, NAMED('NormResults'));








// Persons := $.File_Persons.File;
// REcordWrite := OUTPUT(Persons,,'~class::hmw::intro2::persons', overwrite);
// profileResults := STD.DataPatterns.Profile(Persons);
// bestrecord := STD.DataPatterns.BestRecordStructure(Persons);
// Profileout := OUTPUT(profileResults, ALL, NAMED('profileResults'));
// BestOut := OUTPUT(bestrecord, ALL, NAMED('BestRecord'));
// OUTPUT(profileResults, ALL, NAMED('profileResults'));
// OUTPUT(bestrecord, ALL, NAMED('BestRecord'));
// SEQUENTIAL(RecordWrite,PARALLEL(ProfileOut));
// SEQUENTIAL(RecordWrite,PARALLEL(ProfileOut,BestOut));

