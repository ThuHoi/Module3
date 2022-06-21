use quanlyxe;

# 3.Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
select * from dongxe where soChoNgoi >= 5;

# 4. Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
select nhacungcap.maNhaCC, tenNhaCC
from nhacungcap
join dangkydichvu on nhacungcap.maNhaCC = dangkydichvu.maNhaCC
join mucphi on mucphi.maMP = dangkydichvu.maMP
join dongxe on dongXe.dongXe = dangkydichvu.dongXe
where dongxe.hangXe = 'Toyota' and mucphi.donGia = 1000000 or dongxe.hangXe = 'BMW' and mucphi.donGia = 2000000;

# 5. Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế
select * from nhacungcap order by nhacungcap.tenNhaCC asc, nhacungcap.maSoThue desc;

# 6. 
select nhacungcap.maNhaCC, tenNhaCC, count(nhacungcap.maNhaCC) as SoLanCC
from nhacungcap
join dangkydichvu on nhacungcap.maNhaCC = dangkydichvu.maNhaCC
where dangkydichvu.ngayBatDauCC = '2022-06-21'
group by tenNhaCC;

# 7.  Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
select distinct hangXe from dongxe;

# 8.  

select *
from nhacungcap
left join dangkydichvu on nhacungcap.maNhaCC = dangkydichvu.maNhaCC
left join dongxe on dongxe.dongXe = dangkydichvu.dongXe
left join mucphi on mucphi.maMP = dangkydichvu.maMP;

# 9. 
select nhacungcap.*
from nhacungcap
where nhacungcap.maNhaCC in(
select dangkydichvu.maNhaCC
from dangkydichvu
where dangkydichvu.dongXe = 'Inova' or dangkydichvu.dongXe = 'BMW I8'
);

# 10.  Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
-- phương tiện lần nào cả.
select nhacungcap.maNhaCC, tenNhaCC
from nhacungcap
where not exists (
select *
from dangkydichvu
where nhacungcap.maNhaCC = dangkydichvu.maNhaCC);

