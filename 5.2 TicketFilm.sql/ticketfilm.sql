create database TicketFilm;
use TicketFilm;

create table Phim (
phimID int primary key,
ten_phim varchar(255),
loai_phim varchar (255),
thoi_gian int
);

create table Phong (
phongID int primary key,
ten_phong varchar(255),
trang_thai varchar(255)
);

create table Ghe (
gheID int primary key,
phongID int,
so_ghe varchar(255),

foreign key (phongID) references Phong (phongID)
);

create table Ve (
phimID int,
gheID int,
ngay_chieu date,
trang_thai varchar (255),

foreign key (phimID) references Phim (phimID),
foreign key (gheID) references Ghe (gheID)
);

insert into Ve(phimID, gheID, ngay_chieu, trang_thai) value (1,1,10/20/2008, 'Đã bán');
insert into Ve(phimID, gheID, ngay_chieu, trang_thai) value (1,3,11/20/2008, 'Đã bán');
insert into Ve(phimID, gheID, ngay_chieu, trang_thai) value (1,4,12/23/2008, 'Đã bán');
insert into Ve(phimID, gheID, ngay_chieu, trang_thai) value (2,1,02/14/2009, 'Đã bán');
insert into Ve(phimID, gheID, ngay_chieu, trang_thai) value (3,1,02/14/2009, 'Đã bán');
insert into Ve(phimID, gheID, ngay_chieu, trang_thai) value (2,5,03/08/2009, 'Chưa bán');
insert into Ve(phimID, gheID, ngay_chieu, trang_thai) value (2,3,03/08/2009, 'Chưa bán');


-- cau2:
select * 
from Phim
order by  thoi_gian asc;

-- cau3:
select phim.ten_phim, max(thoi_gian) as ThoiLuongPhimMax
from phim;

-- cau4:
select phim.ten_phim, min(thoi_gian) as ThoiLuongPhimMin
from phim;

-- cau5:
select ghe.gheID, ghe.so_ghe
from ghe
where so_ghe like 'A%';

-- cau6:
alter table phong modify trang_thai nvarchar(250);

-- cau7:
update Phong set trang_thai =(
SELECT CASE trang_thai
    WHEN trang_thai = '0' THEN 'Đang sửa'
    WHEN trang_thai = '1' THEN 'medium'
    ELSE 'Unknown'
END )
where PhongID >0;

-- cau8:
select ten_phim
from phim
where length(ten_phim) between 15 and 25;

-- cau9:
select concat(trang_thai, ten_phong) as 'Trạng thái phòng chiếu'
from phong;

-- cau10:
create view as Rank

-- cau11:
-- a:
alter table phim 
add mo_ta nvarchar(250);

-- b:
update phim 
set mo_ta = concat('Đây là bộ phim thể loại' , loai_phim)
where phimID > 0;

-- c:
select * from phim;

-- d:
update phim
set  mo_ta = concat('Đây là film thể loại',  loai_phim)
where phimID > 0;

-- cau12:
ALTER TABLE ghe DROP FOREIGN KEY ghe_ibfk_1;
ALTER TABLE ve DROP FOREIGN KEY ve_ibfk_1;
