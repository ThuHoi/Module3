use QuanLyDiemThiSinhVien;

# 1. Lập danh sách sinh viên có họ ‘Trần’
select * from sinhvien where TenSV like 'Tran%';

# 2.  Lập danh sách sinh viên nữ có học bổng
select * from sinhvien where HocBong = 1 and GioTinh = 'Nu';

# 3. Lập danh sách sinh viên nữ hoặc danh sách sinh viên có học bổng
select * from sinhvien where HocBong = 1 or GioTinh = 'Nu';

# 4.  Lập danh sách sinh viên có năm sinh từ 1978 đến 1985. Danh sách cần các thuộc tính của quan hệ SinhVien
select sinhvien. * , lop.TenLop, khoa.TenKhoa
from sinhvien 
join lop on sinhvien.MaLop = lop.MaLop join khoa on lop.Makhoa = khoa.Makhoa 
 where year(NgaySinh) between 1995 and 2000 ;
 
 # 5.  Liệt kê danh sách sinh viên được sắp xếp tăng dần theo MaSV
 select * from sinhvien order by MaSV ASC;
 
# 6. Liệt kê danh sách sinh viên được sắp xếp giảm dần theo HocBong
select * from sinhvien order by HocBong desc;

# 7.Lập danh sách sinh viên có học bổng của khoa CNTT.
select MaSV, TenSV, HocBong, TenLop from sinhvien 
join lop on sinhvien.MaLop = lop.MaLop join khoa on lop.Makhoa = khoa.Makhoa 
where HocBong > 0 and TenKhoa = 'CNTT';

# 8. Cho biết số sinh viên của mỗi lớp
select lop.MaLop, TenLop, count(MaSV) as SoLuongSinhVien
from lop inner join sinhvien on lop.MaLop = sinhvien.MaLop
group by TenLop;

# 9. Cho biết số lượng sinh viên của mỗi khoa.
select khoa.Makhoa, TenKhoa, count(MaSV) as SoLuongSinhVienCuaKhoa
from sinhvien
join lop on sinhvien.MaLop = lop.MaLop join khoa on lop.Makhoa = khoa.Makhoa
group by TenKhoa;

# 10. Cho biết số lượng sinh viên nữ của mỗi khoa.
select khoa.Makhoa, TenKhoa, count(MaSV) as SoLuongSinhVienNuCuaKhoa
from sinhvien
join lop on sinhvien.MaLop = lop.MaLop join khoa on lop.Makhoa = khoa.Makhoa
where GioTinh = 'Nu'
group by TenKhoa;

# 11. Cho biết tổng tiền học bổng của mỗi lớp
select lop.MaLop, TenLop, sum(HocBong) as TongHocBong
from lop 
join sinhvien on lop.MaLop = sinhvien.MaLop
group by TenLop;

# 12.  Cho biết tổng số tiền học bổng của mỗi khoa
select khoa.Makhoa, TenKhoa, sum(HocBong) as TongHocBongCuaKhoa
from sinhvien
join lop on sinhvien.MaLop = lop.MaLop join khoa on lop.MaKhoa = khoa.Makhoa
group by TenKhoa;

# 13.Lập danh sánh những khoa có nhiều hơn 100 sinh viên. Danh sách cần: MaKhoa, TenKhoa, Soluong
select khoa.Makhoa, TenKhoa, count(MaSV) as SoLuongSinhVien
from sinhvien
join lop on sinhvien.MaLop = lop.MaLop join khoa on lop.Makhoa = khoa.Makhoa
group by TenKhoa
having sum(MaSV) > 1;

# 14. Lập danh sánh những khoa có nhiều hơn 50 sinh viên nữ. Danh sách cần: MaKhoa, TenKhoa, Soluong
select khoa.Makhoa, TenKhoa, count(MaSV) as SoLuongSinhVien
from sinhvien
join lop on sinhvien.MaLop = lop.MaLop join khoa on lop.Makhoa = khoa.Makhoa
where GioTinh = 'Nu'
group by TenKhoa
having sum(MaSV) > 1;

# 15. Lập danh sách sinh viên có học bổng cao nhất
select sinhvien. *
from sinhvien
where HocBong >= all(select HocBong from sinhvien);

# 16.  Lập danh sách sinh viên có điểm thi môn toán cao nhất
select sinhvien.MaSV, TenSV, Diem
from sinhvien 
join ketqua on sinhvien.MaSV = ketqua.MaSV
where ketqua.MaMonHoc = 'Toan' and diem >= all(select diem from ketqua where MaMonHoc = 'Toan');

