use quanlyhocvien;

-- 2.Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó, điểm thi và ngày thi giống như hình
create view DiemThi as
select student.name, test.name testName, studenttest.mark, studenttest.date
from studenttest join test on test.testID = studenttest.testID
                 join student on student.RN = studenttest.RN;
                 
-- 3. Hiển thị danh sách các bạn học viên chưa thi môn nào như hình
create view Hocvienchuathi as
select * 
from student
where not exists (select * from studenttest
where student.RN = studenttest.RN);

-- 4.Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5) 
create view DanhSachThiLai as
select student.name StudentName, test.name TestName, studenttest.mark, studenttest.date
from studenttest join test on test.testID = studenttest.testID
                 join student on student.RN = studenttest.RN
where studenttest.mark < 5;

-- 5. Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi. 
-- Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần.
create view DiemTrungbinh as
select student.name StudentName, avg(mark) as 'AVG_Mark'
from studenttest
join student on student.RN = studenttest.RN
group by name
order by AVG_Mark desc;

-- 6. Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất 
select DiemTrungbinh.StudentName, max(AVG_Mark) as 'Max_AVG'
from DiemTrungbinh;

-- 7. Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học
select diemthi.testName, max(mark)
from diemthi
group by testName
order by testName asc;

-- 8.Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null 
select student.name studentName, test.name Testname
from student
left join studenttest on studenttest.RN = student.RN
left join test on studenttest.testID = test.testID;

-- 9. Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi
update student
set age = age + 1
where RN > 0;

-- 10. Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.
alter table student add status varchar(10);

-- 11. Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, 
-- trường hợp còn lại nhận giá trị ‘Old’ sau đó hiển thị toàn bộ nội dung bảng Student lên
update student set status = 'Young'
where age < 30 and RN > 0;

update student set status = 'Old'
where age > 30 and RN > 0;

-- 12. Tạo view tên là vwStudentTestList hiển thị danh sách học viên và điểm thi, dánh sách phải sắp xếp tăng dần theo ngày thi
create view vwStudentTestList as
select * 
from diemthi
order by date asc;

-- 13. Tạo một trigger tên là tgSetStatus sao cho khi sửa tuổi của học viên thi trigger này sẽ tự động cập nhật status theo quy tắc sau:	[2.5]
-- Nếu tuổi nhỏ hơn 30 thì Status=’Young’
-- Nếu tuổi lớn hơn hoặc bằng 30 thì Status=’Old’


-- 14. Tạo một stored procedure tên là spViewStatus, stored procedure này nhận vào 2 tham số
DELIMITER //
create procedure spView(in studentName varchar(255), testName varchar(255))

begin 
end //

DELIMITER //


 