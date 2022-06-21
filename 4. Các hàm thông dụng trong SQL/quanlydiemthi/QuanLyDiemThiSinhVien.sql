create database QuanLyDiemThiSinhVien;
use QuanLyDiemThiSinhVien;

create table sinhvien(
MaSV int primary key,
TenSV varchar(255),
NgaySinh date,
HocBong bit,
GioTinh varchar(255),
MaLop int,
foreign key (MaLop) references lop(MaLop)
);

create table lop(
MaLop int primary key,
TenLop varchar(255),
MaKhoa int,
foreign key (MaKhoa) references khoa(MaKhoa)
);

create table khoa(
Makhoa int primary key,
TenKhoa varchar(255)
);

create table monhoc(
MaMonHoc int primary key,
TenMonHoc varchar(255),
SoTiet int
);

create table ketqua(
MaSV int,
MaMonHoc int,
Diem float,
foreign key (MaSV) references sinhvien(MaSV),
foreign key (MaMonHoc) references monhoc(MaMonHoc)
);

INSERT INTO sinhvien value (1, 'Han Van Toi', '1993-04-01', 1, 'Nam', 1);
INSERT INTO sinhvien value (2, 'Pham Thi Lan Anh', '1998-10-20', 1, 'Nu', 2);
INSERT INTO sinhvien value (3, 'Tran Hoang Minh', '2000-07-06', 0, 'Nam', 1);
INSERT INTO sinhvien value (4, 'Khong Minh', '2003-10-22', 0, 'Nam', 2);

INSERT INTO ketqua value (1,  1, 9), (1,  2, 8.5), (1,  3, 8) ;
INSERT INTO ketqua value (2,  1, 8), (2,  2, 8), (2,  3, 8);
INSERT INTO ketqua value (3,  1, 7), (3,  2, 10), (3,  3, 7);
INSERT INTO ketqua value (4,  1, 10),(4,  2, 8.5), (4,  3, 9.5);