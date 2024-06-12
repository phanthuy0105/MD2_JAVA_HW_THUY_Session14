use QuanLySinhVien;
-- 1. Hiển thị các thông tin của môn học có credit lớn nhất
-- 1.1. Lấy ra môn học có tín chỉ cao nhất
-- 1.2. Lấy thông tin các môn học có tín chỉ bằng với tín chỉ cao nhất
select *
from subjects sb
where sb.credit in (select max(s.credit) as 'MaxCredit'
from subjects s);

-- 2. Lấy thông tin các môn có điểm thi lớn nhất
-- 2.1. Lấy điểm thi lớn nhất
-- 2.2. Lấy thông tin môn học có điểm thi là lớn nhất
select * 
from subjects s join mark mk on s.subid = mk.subid
where mk.mark in (select max(m.mark) as 'MaxMark'
from mark m);
-- 3. Hiển thị thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo điểm trung bình giảm dần
select s.*, avg(m.mark) as 'avgMark'
from student s join mark m on s.studentId = m.studentId
group by m.studentid
order by avgMark DESC;