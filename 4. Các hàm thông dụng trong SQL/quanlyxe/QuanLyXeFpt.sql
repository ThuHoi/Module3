drop database QuanLyXe;
create database QuanLyXe;
use QuanLyXe;

create table NHACUNGCAP (
maNhaCC int primary key,
tenNhaCC varchar(255),
diaChi varchar(255),
soDT varchar(10),
maSoThue varchar(10)
);

create table DANGKYDICHVU (
maDKCC int primary key,
maNhaCC int,
maLoaiDV int,	
dongXe varchar(255),
maMP int,

ngayBatDauCC date,
ngayKetThucCC date,
soLuongXeDangKy int,

foreign key (maMP) references MUCPHI (maMP),
foreign key (maNhaCC) references NHACUNGCAP (maNhaCC),
foreign key (maLoaiDV) references LOAIDICHVU (maLoaiDV),
foreign key (dongXe) references DONGXE (dongXe)
);

create table LOAIDICHVU (
maLoaiDV int primary key,
tenLoaiDV varchar(255)
);

create table MUCPHI (
maMP int primary key,
donGia double,
moTa varchar(255)
);

create table DONGXE (
dongXe varchar(255) primary key,
hangXe varchar(255),
soChoNgoi int
);