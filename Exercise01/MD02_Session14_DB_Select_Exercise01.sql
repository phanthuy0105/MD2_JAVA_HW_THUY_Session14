create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
	classId int primary key auto_increment,
    className varchar(100) not null unique,
    startDate datetime,
    classStatus bit
);
create table Student(
	studentId char(5) primary key,
    studentName varchar(100) not null,
    address text,
    phone varchar(25),
    studentStatus bit,
    classId int,
    foreign key(classId) references Class(classId)
);
create table Subjects(
	subId char(5) primary key,
    subName varchar(100) not null,
    credit int,
    subStatus bit
);
create table Mark(
	markId char(5) primary key,
    subId char(5) not null,
    foreign key(subId) references Subjects(subId),
    studentId char(5) not null,
    foreign key(studentId) references Student(studentId),
    mark int,
    examTime datetime
);

insert into Class(className,startDate,classStatus)
values('JV240219','2022-05-05',1),('JV240403','2023-12-10',1),('JV240408','2024-04-08',1),('JS230913','2024-06-09',0);
select * from Class;

insert into Student
values('SV001','Nguyễn Văn A','Hà Nội','0385689522',1,1),
('SV002','Hoàng Văn B','Đà Nẵng','0365486254',1,2),
('SV003','Nguyễn Văn C','Hà Tĩnh','0865242356',1,3),
('SV004','Nguyễn Thị Hường','Hà Nội','0362345688',0,4),
('SV005','Hồ Văn Hòa','HCM','0345542563',1,1),
('SV006','Trần Văn Tình','Hà Nội','0852356655',0,2),
('SV007','Nguyễn Văn Hùng','Hà Tĩnh','0398556254',1,3);
select * from Student;

insert into Subjects(subId,subName,credit,subStatus)
values('SJ01','Java',3,1),('SJ02','Frontent',2,0),('SJ03','Backend',4,1),('SJ04','C++',5,1),('SJ05','NoteJs',1,0);
select * from Subjects;

insert into Mark(markId,subId,studentId,mark,examTime)
values('M1','SJ02','SV001',6,'2024-6-10'),('M2','SJ01','SV002',9,'2024-6-9'),('M3','SJ04','SV003',7,'2024-6-8'),('M4','SJ03','SV004',8,'2024-5-6');
select * from Mark;

-- 1. Lấy thông tin sinh viên có tên bắt đầu là h
select *
from student st
where st.studentName like 'h%';

-- 2. Hiển thị các lớp học có thời gian bắt đầu vào tháng 12
select *
from Class
where Class.startDate like '%-12-%';

-- 3. Hiển thị tất cả các môn học có credit trong khoảng từ 3 đến 5
select *
from Subjects sj
where sj.credit between 3 and 5;

-- 4. Thay đổi mã lớp (classId) của sinh viên có tên là “hung” là 2
update Student
	set classId = 2
    where studentId = 'SV007' and studentName = 'Hùng';
  
/*
-- 4. Hiển thị các thông tin: studentName, SubName, Mark. 
Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
*/
select mark.studentId, mark.subId, Mark.mark
from Mark mark
group by mark.subId
order by Mark.mark DESC, st.student_name;

-- 1. Lấy tất thông tin sinh viên
select * from Subjects;
select sj.subId, sj.subName, sj.credit, max(sj.credit) as 'Max'
from subjects sj;

select mark.subId, max(mark.mark) as 'Max'
from Mark mark
group by mark.subId
having max(mark.mark);

select avg(mark.mark) as 'AVG'
from Mark mark
order by mark.mark DESC