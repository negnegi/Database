-- ----------------------------------------------------- 
-- Schema mydb 
-- ----------------------------------------------------- 
create database AW; 
use AW ; 
-- ----------------------------------------------------- 
-- Table `Admin` 
-- ----------------------------------------------------- 
CREATE TABLE `Admin` ( 
  `Admin-user` VARCHAR(20) NOT NULL, 
  `Admin-pass` VARCHAR(45) NOT NULL, 
  PRIMARY KEY (`Admin-user`)) 
   
ENGINE = InnoDB; 
create unique index `Admin-user_UNIQUE` on `Admin`(`Admin-user` ASC) visible;  
insert into `Admin` values ('negar', 'bjbforever'); 
 
-- ----------------------------------------------------- 
-- Table `Goods` 
-- ----------------------------------------------------- 
CREATE TABLE `Goods` ( 
  `G-id` varchar(25) not NULL, 
  `Type` VARCHAR(45) NOT NULL, 
  `GName` VARCHAR(45) NOT NULL, 
  `Exist` INT NOT NULL, 
  `price` INT NOT NULL, 
  PRIMARY KEY (`G-id`)) 
ENGINE = InnoDB; 
-- ----------------------------------------------------- 
-- Table `Efficient` 
-- ----------------------------------------------------- 
 
CREATE TABLE `Efficient` ( 
  `EffName` VARCHAR(20) NOT NULL, 
  `EffPass` VARCHAR(25) NOT NULL, 
  `Email` VARCHAR(50) NOT NULL, 
  PRIMARY KEY (`EffName`)) 
ENGINE = InnoDB; 
 
CREATE UNIQUE INDEX `Email_UNIQUE` ON `Efficient` (`Email` ASC) VISIBLE; 
-- ----------------------------------------------------- 
-- Table `Basket` 
-- ----------------------------------------------------- 
 
CREATE TABLE `Basket` ( 
  `G-id` varchar(25) not NULL, 
  `EffName` VARCHAR(20) NOT NULL, 
  `GCount` INT not null, 
  `ISEXIT`BOOLEAN NOT NULL, 
  `exit` INT not null, 
  FOREIGN KEY(`G-id`) references `AW`. `Goods`(`G-id`)on update cascade, 
  FOREIGN KEY(`EffName`) references `AW`.`Efficient`(`EffName`)on update cascade) 
ENGINE = InnoDB; 
-- ----------------------------------------------------- 
-- Table `Buy` 
-- ----------------------------------------------------- 
 
CREATE TABLE `Buy` ( 
 `G-id` varchar(25) not NULL, 
  `EffName` VARCHAR(20) NOT NULL, 
   `ISBUY` boolean not null, 
  `BuyCount` INT NOT NULL, 
 `Gcount` int not null, 
 `Date`date not null, 
  foreign key (`G-id`) references `AW`.`Goods`(`G-id`) on update cascade, 
  foreign key (`EffName`) references `AW`.`Efficient`(`EffName`) on update cascade) 
ENGINE = InnoDB; 
 
-- ----------------------------------------------------- 
-- Table `poll` 
-- ----------------------------------------------------- 
 
CREATE TABLE `poll` ( 
  `EffName` VARCHAR(20) NOT NULL, 
  `G-id` VARCHAR(25) NOT NULL, 
  `ISPOLL` boolean NOT NULL, 
  `POLL` float not null, 
  `E-Pcount` Int not null, 
  foreign key (`G-id`) references `AW`.`Goods`(`G-id`) on update cascade, 
  foreign key (`EffName`) references `AW`.`Efficient`(`EffName`) on update cascade) 
ENGINE = InnoDB; 
-- ----------------------------------------------------- 
-- insert 
-- ----------------------------------------------------- 
insert into `Goods` values ('AW9801', 'voice', 'DR.farnoodi','10','200000'); 
insert into `Goods` values ('AW9802', 'voice', 'DR.babaeezaad','10','200000'); 
insert into `Goods` values ('AW9803', 'voice', 'DR.holakoue','30','200000'); 
insert into `Goods` values ('AW9804', 'voice', 'DR.monajem','15','200000'); 
insert  into `Efficient` values ( 'Ali','ferferi','Ali_agk@yahoo.com'); 
insert  into `Efficient` values ( 'Parisa','206670','Parisa_2066@gmail.com'); 
insert  into `Efficient` values ( 'Parvane','alimmm','Parvane_rz@gmail.com'); 
insert  into `Efficient` values ( 'Saman','taj_rr','samantaj@yahoo.com'); 
insert  into `Efficient` values ( 'javad','khkh','javad_kh@gmail.com'); 
insert into `Basket` values( 'AW9802','Ali',2,false,0); 
insert into `Basket` values( 'AW9803','saman',1,true,1); 
insert into `Basket` values( 'AW9801','javad',1,true,1); 
insert into `Basket` values( 'AW9802','Ali',4,false,0); 
insert into `Basket` values( 'AW9804','parisa',4,false,0); 
insert into `Basket` values( 'AW9803','parvane',4,false,0); 
insert into `Basket` values( 'AW9801','parisa',2,false,0); 
insert into `Buy` values ('AW9801','Parisa',true,1,2,'2019-08-02'); 
insert into `Buy` values ('AW9802','Ali',false,1,4,'2019-06-08'); 
insert into `Buy` values ('AW9802','Ali',true,2,2,'2019-09-01'); 
insert into `Buy` values ('AW9804','Parisa',true,2,4,'2019-06-02'); 
insert into `Buy` values ('AW9803','Parvane',true,1,4,'2019-09-09'); 
insert into `poll` values ('parisa','AW9801',true,4.5,1); 
insert into `poll` values ('parisa','AW9802',true,3,2); 
insert into `poll` values ('ali','AW9803',false,4,1); 
insert into `poll` values ('ali','AW9802',true,4.5,1); 
insert into `poll` values ('ali','AW9804',true,4,2); 
insert into `poll` values ('parvane','AW9801',true,3.5,1); 
insert into `poll` values ('parisa','AW9801',true,4,1); 
 
-- ----------------------------------------------------- 
-- view 
-- ----------------------------------------------------- 
 
create view q (`G-id`,`EffName`,`Date`,`BuyCount`) as select `G-id`,`EffName`,`Date`,`BuyCount`from `Buy`; 
create view q1(`G-id`,EffName,`exit`) as select `G-id`,EffName,`exit` from Basket; 
create view qq2 as select * from Goods natural join basket; 
create view qq1 (`Gcount`,`G-id`) as select `Gcount`,`G-id`from `Buy`; 
create view v4 (`G-id`,`EffName`,`POLL`,`E-Pcount`) as select `G-id`,`EffName`,`POLL`,`E-Pcount` from poll; 
create view v5 as select * from Buy natural join Efficient; 
create view v6 (`G-id`,`EffName`,`Gcount`,`Date`) as select `G-id`,`EffName`,`Gcount`,`Date`from `Buy`; 
create view adminshow (`Admin-user`) as select `Admin-user`from `admin`; 
create view usershow (`EffName`,`Email`) as select `EffName`,`Email` from `Efficient`; 
-- ----------------------------------------------------- 
-- SELECT 
-- ----------------------------------------------------- 
SELECT `q`.`G-id`,`q`.`EffName`,`q`.`Date`,`q`.`BuyCount`FROM `aw`.`q` 
where(DATE(`Date`)between '2019-06-02' and '2019-06-02'and `BuyCount`>=2); 
SELECT `q1`.`G-id`,`q1`.`EffName`,`q1`.`exit`FROM `aw`.`q1`where `exit`=1; 
 
SELECT `qq2`.`G-id`,`qq2`.`GName`,`qq2`.`price`,`qq2`.`EffName`,`qq2`.`GCount`,sum(GCount * price) END_PRICE from aw.qq2 group by qq2.EffName Having (GCount*price)>600000 and GCount<=4; 
 
select `G-id`,`Gcount` 
from `aw`.`qq1` where Gcount>= (select Max(Gcount) from `aw`.`qq1`); 
SELECT `v4`.`G-id`,`v4`.`EffName`,`v4`.`POLL`,`v4`.`E-Pcount`from `aw`.`v4` where `E-Pcount`= (select Max(`E-Pcount`) from `aw`.`v4`); 
SELECT `v4`.`G-id`,`v4`.`EffName`,`v4`.`POLL`,`v4`.`E-Pcount`,avg(`POLL`) 'rate' from aw.v4 group by `v4`.`EffName` ; 
 
-- ----------------------------------------------------- 
-- TRIGGER 
-- ----------------------------------------------------- 
DELIMITER $$ 
CREATE TRIGGER T1 AFTER UPDATE ON `poll` FOR EACH ROW BEGIN  
IF NEW.ISPOLL=TRUE THEN SET 
@`E-Pcount`=@`E-Pcount`+1; 
END IF; 
END$$ 
DELIMITER ; 
 
DELIMITER $$ 
CREATE TRIGGER T2 AFTER UPDATE ON `Basket` FOR EACH ROW BEGIN  
IF NEW.ISEXIT=TRUE THEN SET 
@`exit`=@`exit`+1; 
END IF; 
END$$ 
DELIMITER ; 
 
DELIMITER $$ 
CREATE TRIGGER T3 AFTER UPDATE ON `Buy` FOR EACH ROW BEGIN  
IF NEW.ISBUY=TRUE THEN SET 
@`BuyCount`=@`BuyCount`+1; 
END IF; 
END$$ 
DELIMITER ; 