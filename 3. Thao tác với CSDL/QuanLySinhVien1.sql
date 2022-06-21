drop database test2;
create database Test2;
use Test2;

create table Students (
studentID int not null auto_increment primary key,
studentName varchar(50),
age int,
email varchar(100)
);


create table Subject(
subID int  not null auto_increment primary key,
subName varchar(50)
);

create table Mark(
markID int not null auto_increment primary key,
mark int,
subID int not null,
studentID int not null,
foreign key (subID) references Subject (subID),
foreign key (studentID) references Students (studentID)
);

create table Classes (
classID int not null auto_increment primary key,
className varchar(50)
);

create table ClassStudent (
studentID int not null,
classID int not null,
foreign key (studentID) references Students (studentID),
foreign key (classID) references Classes (classID)
);


