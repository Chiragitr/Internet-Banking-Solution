use new;
/*create table Users(
  `user_id` varchar(10) NOT NULL,
  `user_password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`) 
);*/

/*insert  into `Users`(`user_id`,`user_password`) values ('admin','admin');*/

/*create table Accounts (
aid int NOT NULL AUTO_INCREMENT,
name varchar(20),
ano varchar(20) NOT NULL,
avbal int,
tpassword varchar(10) NOT NULL,
uid varchar(10) NOT NULL,
 PRIMARY KEY (aid),
 FOREIGN KEY (uid) REFERENCES Users (user_id)
 );*/

/*insert into Accounts(name,ano,avbal,tpassword,uid) values ('sahil','S22345',27000,'s','151354');*/
/*create table Checks(

usrid varchar(10) NOT NULL,
status varchar(10) NOT NULL,
count int,
foreign key (usrid) references Users (user_id),
PRIMARY KEY (usrid)
);*/
/*insert into Checks(usrid,status,count) values ('151354','U',0);*/
/*select * from Checks;*/


/*create table trial(
  `user_id` varchar(10) NOT NULL,
  `user_password` varchar(20) DEFAULT NULL,
   taarik date,
  PRIMARY KEY (`user_id`) 
)*/
/*insert into trial (user_id,user_password,taarik) values ('sdfgh','try',curdate());*/
/*select * from trial;*/
/*create table Transactions(
id int NOT NULL AUTO_INCREMENT,
Fromacno varchar(20),
Toacno varchar(20),
Amount int,
Date date,
PRIMARY KEY (id)
);*/
select * from Transactions;


