#select count(*) from person

#select person0_.id as id1_0_, person0_.name as name2_0_ from PERSON person0_

#select record0_.id as id1_0_, record0_.name as name2_0_, record0_.rsnum as rsnum_, record0_.link as link_    from RECORD record0_


select record0_.id as id1_1_, record0_.barcodescan as barcodes2_1_, record0_.drivedate as drivedat3_1_, record0_.drivescan as drivesca4_1_, record0_.link as link5_1_, record0_.name as name6_1_, record0_.notes as notes7_1_, record0_.previmage as previmag8_1_, record0_.rsnum as rsnum9_1_, record0_.samplecondi as samplec10_1_, record0_.temp as temp11_1_, record0_.tft as tft12_1_, record0_.volts as volts13_1_, record0_.waveformname as wavefor14_1_ from RECORD record0_ where record0_.name ='Haiyan Gu'