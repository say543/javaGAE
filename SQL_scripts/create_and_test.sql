#http://www.codedata.com.tw/database/mysql-tutorial-database-abc-mysql-installation
# table creation

# table 1
/*
CREATE TABLE `person` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  #`country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO  person VALUES (1,'Craig');
INSERT INTO  person VALUES (2,'HongMei');
INSERT INTO  person VALUES (3,'YaJuan');
*/
 #DROP TABLE person


# table 2
# unallowed empty inot
/*
CREATE TABLE `record` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `rsnum` varchar(30) NOT NULL DEFAULT '',
  `drivedate` DATE NOT NULL,
  `drivescan` DATE NOT NULL,
  `temp` double(10,2) NOT NULL,
  `volts` double(10,2) NOT NULL,
  `previmage` varchar(30) NOT NULL DEFAULT '',
  `tft` varchar(30) NOT NULL DEFAULT '',
  `waveformname` varchar(30) NOT NULL DEFAULT '',
  `samplecondi` varchar(30) NOT NULL DEFAULT '',
  `barcodescan` BOOLEAN  NOT NULL,
  `notes` varchar(300) NOT NULL DEFAULT '',
  `link` varchar(300) NOT NULL DEFAULT '',
  
  #`country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
*/

#  allow null
/*
CREATE TABLE `record` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '',
  `rsnum` varchar(30) DEFAULT '',
  `drivedate` DATE DEFAULT '1999-1-1',
  `drivescan` DATE DEFAULT '1999-1-1',
  `temp` varchar(30) DEFAULT '',
  `volts` varchar(30) DEFAULT '',
  `previmage` varchar(30) DEFAULT '',
  `tft` varchar(30) DEFAULT '',
  `waveformname` varchar(30) DEFAULT '',
  `samplecondi` varchar(30) DEFAULT '',
  `barcodescan` varchar(5) DEFAULT '',
  `notes` varchar(300) DEFAULT '',
  `link` varchar(300) DEFAULT '',
  
  #`country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
*/


#http://stackoverflow.com/questions/18271951/delete-all-records-in-a-table-of-mysql-in-phpmyadmin
# records/ table delete
#DROP TABLE record

# delete records and reset id to 1 
truncate record


#INSERT INTO  record VALUES (default,'Craig', 'T6k14C1', '2015-2-13', '2015-2-13', 50.3,  4.4, 'solid white', '2\"; 94X30', '5vPDP1_100ms', 'LKO', 1, '2nd round failed', 'link1');
#INSERT INTO  record VALUES (default,'HongMei', 'T6k14C2', '2015-2-14', '2015-2-14', 45.3, 4.2, 'solid blue', '3.5\"; 95X30', '5vPDP1_20ms', 'HKO', 1, '1nd round failed', 'link2');
#INSERT INTO  record VALUES (default,'YaJuan', 'T6k14C3', '2015-2-15', '2015-2-15', 47.8, 4.9, 'solid red', '2.0\"; 94X32', '5vPDP1_15ms', 'MKO', 0, '3nd round failed','link3');



#INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-70ms','LKO humidified',1,'','link unappend');
#INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-80ms','LKO humidified',1,'','link unappend');
#INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-90ms','LKO humidified',1,'','link unappend');

/*
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-70ms','LKO humidified',1,'','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-80ms','LKO humidified',1,'','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-90ms','LKO humidified',1,'','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T4K14C121','2015-2-19','2015-2-19',50.0,5.0,'solid white','2"; 94x230','5v PDP1_100ms_3phase','LKO condition',0,'Extro notes-Imoge 1.2','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','150108-1','2015-2-19','2015-2-19',50.0,5.0,'solid white','2"; 94x230','5v PDP1_100ms_3phase','0min/7days',1,'Extro notes-Imoge 1.2','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','150108-1','2015-2-19','2015-2-19',50.0,5.0,'solid white','2"; 94x230','5v PDP1_100ms_3phase','30min/7days',0,'Extro notes-Imoge 1.2','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',45.0,7.6,'solid white','2": 94x230','WF1, 3 phase PDP1-50ms','LKO humidified',0,'pass 1st and 3rd barcode but fail the 2nd one, with new barcode reader, with RD#2, only 3rd one passed','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',45.0,7.6,'solid white','2": 94x230','WF2, 3 phase PDP1-70ms','LKO humidified',1,'pass all 3 barcodes with both barcode readers','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',45.0,7.6,'solid white','2": 94x230','WF3, 3 phase PDP1-90ms','LKO humidified',1,'pass all 3 barcodes with both barcode readers','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',45.0,7.6,'solid white','2"; 94x230','WF4. 3phase PDP1-70ms-4','LKO humidified',0,'pass all 3 barcodes with both barcode reoder','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',45.0,7.6,'solid white','2"; 94x230','WF5. 3phase PDP1-50ms-4','LKO humidified',0,'pass all 3 barcodes with both barcode reoder','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',45.0,7.6,'solid white','2"; 94x230','WF6. 3phase PDP1-50ms-5','LKO humidified',0,'pass all 3 barcodes with both barcode reoder','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',50.0,7.6,'solid white','2"; 94x230','WF1, 3phase PDP1-50ms','LKO humidified',0,'pass 1st borcode btu fall the 2nd one, pass the 3rd borcode','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',50.0,7.6,'solid white','2"; 94x230','WF2, 3phase PDP1-70ms','LKO humidified',0,'pass all 3 borcodes but has some difficulty on 2nd one','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',50.0,7.6,'solid white','2"; 94x230','WF3, 3phase PDP1-90ms','LKO humidified',0,'pass 1st and 3rd barcode but has some difficulty on 2nd one','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',50.0,7.6,'solid white','2"; 94x230','WF4, 3phase PDP1-70ms-4','LKO humidified',0,'New reader 1st &3rd RD#2     3rd','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',50.0,7.6,'solid white','2"; 94x230','WF5, 3phase PDP1-50ms-4','LKO humidified',0,'New  all 3  RD#2  1st&3rd','link unappend');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-27','2015-2-27',50.0,7.6,'solid white','2"; 94x230','WF6, 3phase PDP1-50ms-5','LKO humidified',0,'pass all 3 barcodes with both barcode reader  New 1,3  RD#2   3(1WD)','link unappend');
*/

#INSERT INTO record VALUES (DEFAULT,'test','         ','        ','        ','  ',' ','           ','          ','                 ','              ','','','link unappend');
#INSERT INTO record VALUES (DEFAULT,'test','         ','1999-1-1','1999-1-1','  ',' ','           ','          ','                 ','              ','','','link unappend');
#INSERT INTO record VALUES (DEFAULT,'','',DEFAULT,DEFAULT,DEFAULT,DEFAULT,'','','','',DEFAULT,'','link unappend');

/*
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-70ms','LKO humidified','1','','file:///\\\\siifs\\sii\\QAQC\\FPL QC items\\Blooming Test Result\\2 inch TFT\\2015\\7.6v WFs 50C-150213-Haiyan.xlsm');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-80ms','LKO humidified','1','','file:///\\\\siifs\\sii\\QAQC\\FPL QC items\\Blooming Test Result\\2 inch TFT\\2015\\7.6v WFs 50C-150213-Haiyan.xlsm');
INSERT INTO record VALUES (DEFAULT,'Haiyan Gu','T6K14C121','2015-2-13','2015-2-13',50.0,7.6,'solid white','2"; 94x230','3 phase PDP1-90ms','LKO humidified','1','','file:///\\\\siifs\\sii\\QAQC\\FPL QC items\\Blooming Test Result\\2 inch TFT\\2015\\7.6v WFs 50C-150213-Haiyan.xlsm');
*/