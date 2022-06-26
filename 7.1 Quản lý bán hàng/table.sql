drop database `quan-ly-ban-hang`;
create database `quan-ly-ban-hang`;
use `quan-ly-ban-hang`;

create table KhachHang (
maKH char(4) primary key,
hoTen varchar(255),
diaChi varchar(255),
sDT varchar(255),
ngaySinh date,
ngayDK date,
danhSo float
);

create table NhanVien(
maNV char(4) primary key,
hoTen varchar(255),
soDT varchar(255),
ngaVaoLam date
);


create table SanPham(
maSP char(4) primary key,
tenSP varchar(255),
donViTinh varchar(255),
nuocSX varchar(255),
gia float
);

create table HoaDon(
maSoHD int primary key,
ngayMua date,
maKH char(4),
maNV char(4),
triGia float,

foreign key (maKH) references KhachHang (maKH),
foreign key (maNV) references NhanVien (maNV)
);

create table HDCT(
maSoHD int,
maSP char(4),
soLuong int,

foreign key (maSoHD) references HoaDon (maSoHD),
foreign key (maSP) references SanPham (maSP)
);
-- KHACHHANG

insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','1994-06-20','2022-07-22',13060000);
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','1998-03-04','2022-09-07',280000);
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','1994-08-12','2022-09-12',3860000);
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','1998-03-07','2022-12-09',250000);
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','1997-08-09','2022-06-09',21000);
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','1995-09-02','2022-07-09',915000);
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','1998-07-12','2022-08-09',12500);
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','1992-08-03','2022-09-09',365000);
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','1992-11-04','2022-10-09',70000);
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','1992-12-24','2022-12-09',67500);

-- NHANVIEN

insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','2022-01-09');
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','2022-02-09');
insert into nhanvien values('NV03','Nguyen Van B','997047382','2022-03-09');
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','2022-04-09');
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','2022-05-09');

-- SANPHAM

insert into sanpham values('BC01','But chi','cay','Singapore',3000);
insert into sanpham values('BC02','But chi','cay','Singapore',5000);
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500);
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000);
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500);
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500);
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000);
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500);
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000);
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000);
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000);
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000);

-- HOADON

insert into hoadon values(1001,'2022-08-09','KH01','NV01',320000);
insert into hoadon values(1002,'2022-09-09','KH01','NV02',840000);
insert into hoadon values(1003,'2022-10-09','KH02','NV01',100000);
insert into hoadon values(1004,'2022-11-09','KH02','NV01',180000);
insert into hoadon values(1005,'2022-12-09','KH01','NV02',3800000); 
 
 -- HDCT
 
insert into HDCT values(1001,'TV02',10);
insert into HDCT values(1001,'ST01',5);
insert into HDCT values(1001,'BC01',5);
insert into HDCT values(1001,'BC02',10);
insert into HDCT values(1001,'ST05',10);
insert into HDCT values(1002,'BC04',20);
insert into HDCT values(1002,'ST02',20);
insert into HDCT values(1002,'ST01',20);
insert into HDCT values(1003,'ST10',10);
insert into HDCT values(1004,'TV01',20);
insert into HDCT values(1004,'TV02',10);
insert into HDCT values(1004,'TV03',10);
