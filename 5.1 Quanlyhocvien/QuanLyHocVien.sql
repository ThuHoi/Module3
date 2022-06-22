create database QuanLyHocVien;
use QuanLyHocVien;
drop database QuanLyHocVien;

create table Test (
testID int primary key,
name varchar(255)
);

create table Student(
RN int primary key,
name varchar(255),
age int
);

create table StudentTest(
RN int,
testID int,
date datetime,
mark float,

foreign key (RN) references Student (RN),
foreign key (testID) references Test (testID)
);

insert into test value(1,'EPC'),(2,'DWMX'),(3,'SQL1'),(4,'SQL2');
insert into student value(1,'Nguyen Hong Ha',20),(2,'Truong Ngoc Anh',30),
(3,'Tuan Minh',25),(4,'Dan Truong',22);
insert into StudentTest value(1,1,'2006-07-17',8),(1,2,'2006-07-18',5),(1,3,'2006-07-19',7),
(2,1,'2006-07-17',7),(2,2,'2006-07-18',4),(2,3,'2006-07-19',2),(3,1,'2006-07-17',10)
,(3,3,'2006-07-19',1);


