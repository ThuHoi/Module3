drop database Test2;
create database Test2;
use Test2;
create table Class (
classID int not null auto_increment primary key,
className varchar(50)
);

create table Students (
studentID int not null auto_increment primary key,
stuedentName varchar(50),
age int,
email varchar(100)
);
drop table Students;

create table Subject(
subID int  not null auto_increment primary key,
subName varchar(50)
);

create table Mark(
mark int,
subID int,
foreign key (subID) references Subject (subID),
studentID int,
foreign key (studentID) references Students (studentID)
);

create table Classes (
classID int not null auto_increment primary key,
className varchar(50)
);

create table ClassStudent (
studentID int,
foreign key (studentID) references Students (studentID),
classID int,
foreign key (classID) references Classes (classID)
);