use `quan-ly-ban-hang`;

-- 1.Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2022.
select count(distinct hdct.maSP)
from hdct
join hoadon on hdct.maSoHD = hoadon.maSoHD
where year(hoadon.ngaymua) = 2022;

-- 2.Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select min(trigia), max(trigia)
from hoadon;

-- 3.Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2022 là bao nhiêu?
select avg(trigia)
from hoadon hd
where year(ngaymua) = 2022;

-- 4.Tính doanh thu bán hàng trong năm 2022.
select sum(trigia)
from hoadon
where year(ngaymua) = 2022;

-- 5. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select max(trigia)
from hoadon hd
where year(ngaymua) = 2022;

-- 6.Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2022.
select hoTen
from khachhang kh
join hoadon on hoadon.maKH = kh.maKH
where triGia in (
select max(trigia)
from hoadon
where year(ngaymua) = 2022
);

-- 7. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
select maKH, hoTen, danhSo
from khachhang
order by danhSo desc
limit 3;
;

-- 8.In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select maSP, tenSP, gia
from sanpham
where gia = (select distinct gia
from sanpham
order by gia desc
limit 2,1);

-- 9. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
select maSP, tenSP, gia
from sanpham sp
where nuocSX = 'Thai Lan' and gia = (select distinct gia
from sanpham
order by gia desc
limit 2,1);

-- 10.In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select maSP, tenSP
from sanpham
where nuocSX = 'Trung Quoc' and gia = (
select max(gia)
from sanpham
where nuocSX = 'Trung Quoc'
);

-- 11.In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
select maKH, hoTen,rank() over (order by danhso desc) as thuhang
from khachhang
order by danhso desc
limit 3;

-- 12.Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select count(maSP) as tongsosanpham
from sanpham
where nuocSX = 'Trung Quoc';

-- 13.Tính tổng số sản phẩm của từng nước sản xuất.
select nuocSX, count(maSP)
from sanpham
group by nuocSX;

-- 14. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select nuocSX, min(gia) thapnhat, max(gia) caonhat,avg(gia) trungbinh
from sanpham
group by nuocSX;

-- 15.Tính doanh thu bán hàng mỗi ngày.
select ngayMua, sum(trigia) as DTtheoNgay
from hoadon
group by ngayMua;

-- 16.Tính tổng số lượng của từng sản phẩm bán ra trong tháng 2022/09.
select maSP, sum(soluong)
from hdct
join hoadon on hoadon.maSoHD = hdct.maSoHD
where year(ngayMua) = 2022 and month(ngayMua)
group by maSP;

-- 17.Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(ngayMua) thang, sum(trigia)  Doanhthu
from hoadon
where year(ngayMua) = 2022
group by month(ngayMua)
order by month(ngayMua);

-- 18.Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select hoadon.maSoHD, count(maSP)
from hoadon
join hdct on hdct.maSoHD = hoadon.maSoHD
group by maSoHD
having count(maSP) >=4;

-- 19.Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select hoadon.maSoHD, count(hdct.maSP)
from hoadon
join hdct on hdct.maSoHD = hoadon.maSoHD
join sanpham on sanpham.maSP = hdct.maSP
where nuocSX = 'Viet Nam'
group by maSoHD
having count(hdct.maSP) = 3;

-- 20.Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select khachhang.maKH, khachhang.hoTen, count(hoadon.maKH) as solan
from khachhang
join hoadon on hoadon.maKH = khachhang.maKH
group by hoadon.maKH
order by count(hoadon.maKH) desc
limit 1;

-- 21.Tháng mấy trong năm 2022, doanh số bán hàng cao nhất ?
select month(ngayMua), sum(trigia) doanhthu
from hoadon
where year(ngayMua) = 2022
group by month(ngayMua)
having sum(trigia) >= 
(
select sum(trigia)
from hoadon
where year(ngayMua) = 2022
group by month(ngayMua)
order by month(ngayMua) desc
limit 1
);

-- 22.Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select sanpham.maSP,sanpham.tenSP, sum(hdct.soLuong) as soluong
from sanpham
join hdct on hdct.maSP = sanpham.maSP
join hoadon on hoadon.maSoHD = hdct.maSoHD
where  year(ngayMua) = 2022
group by hdct.maSP
having sum(hdct.soLuong) <=
(
select sum(hdct.soLuong)
from hdct
join hoadon on hoadon.maSoHD = hdct.maSoHD
where year(ngayMua) = 2022
group by maSP
order by maSP desc
limit 1
);

-- 23. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
select nuocSX, maSP, tenSP, gia
from sanpham sp
where gia in 
(
select max(gia)
from sanpham sp1
where sp.nuocSX = sp1.nuocSX 
group by nuocSX
);

-- 24.Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select sanpham.nuocSX, count(distinct gia)
from sanpham
group by nuocSX
having count(distinct gia) >= 3;

-- 25.Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
select hoTen, sum(trigia) tonggia, count(hd.maKH) solan
from khachhang kh
join hoadon hd on hd.maKH = kh.maKH
group by hoTen
having count(hd.maKH)=(select count(maKH) from hoadon group by maKH order by count(maKH) desc limit 1);