-- create database qlkh;
-- go

-- use qlkh;
-- go

-- create table giangvien (
--     GV# varchar(10) primary key,
--     HoTen varchar(50),
--     DiaChi varchar(50),
--     NgaySinh date
-- )

-- create table detai (
--     DT# varchar(10) primary key,
--     TenDT varchar(250), 
--     Cap varchar(20),
--     KinhPhi int
-- )

-- go

-- create table thamgia (
--     GV# varchar(10),
--     DT# varchar(10),
--     SoGio int,
--     foreign key (GV#) references giangvien(GV#) on delete cascade on update cascade,
--     foreign key (DT#) references detai(DT#) on delete cascade on update cascade
-- )

-- go

-- go

-- alter table giangvien alter column HoTen nvarchar(50);
-- alter table giangvien alter column DiaChi nvarchar(50);
-- go

-- alter table detai alter column TenDT nvarchar(250);
-- alter table detai alter column Cap nvarchar(20);
-- go

-- insert into giangvien values
--     ('GV01', 'Vu Tuyet Trinh', 'Hoang Mai', '10/10/1975'),
--     ('GV02', 'Nguyen Nhat Quang', 'Hai Ba Trung, Ha Noi', '03/11/1976'),
--     ('GV03', 'Tran Duc Khanh', 'Dong Da, Ha Noi', '04/06/1977'),
--     ('GV04', 'Nguyen Hong Phuong', 'Tay Ho, Ha Noi', '10/12/1983'),
--     ('GV05', 'Le Thanh Huong', 'Hai Ba Trung, Ha Noi', '10/10/1976')
-- go

-- insert into detai values
--         ('DT01', 'Tinh toan luoi', 'Nha nuoc', 700),
--         ('DT02', 'Phat hien tri thuc', 'Bo', 300),
--         ('DT03', 'Phan loai van ban', 'Bo', 270),
--         ('DT04', 'Dich tu dong Anh Viet', 'Truong', 30)
-- go

-- insert into thamgia values
--             ('GV01', 'DT01', 100),
--             ('GV01', 'DT02', 80),
--             ('GV01', 'DT03', 80),
--             ('GV02', 'DT01', 120),
--             ('GV02', 'DT03', 140),
--             ('GV03', 'DT03', 150),
--             ('GV04', 'DT04', 180)
-- go

-- alter table detai alter column Cap nvarchar(20) collate Latin1_General_100_CI_AI_SC_UTF8;
-- go


-- # B

-- #1
-- select * from giangvien where DiaChi = 'Hai Ba Trung, Ha Noi' order by HoTen desc
-- go

-- #2
--select d.* from giangvien as d inner join (select a.GV# as GV_ID from thamgia as a inner join (select DT# from detai where TenDT = 'Tinh toan luoi') as b on a.DT# = b.DT#) as c on d.GV# = c.GV_ID
--go

-- #3
-- select d.* from giangvien as d inner join (select a.GV# as GV_ID from thamgia as a inner join (select DT# from detai where TenDT = 'Phan loai van ban' or TenDT = 'Dich tu dong Anh Viet') as b on a.DT# = b.DT#) as c on d.GV# = c.GV_ID
-- go

-- #4
--select a.* from giangvien as a inner join (select GV# from thamgia group by GV# having count(DT#) >= 2) as b on a.GV# = b.GV#
--go

-- #5
--select a.* from giangvien as a inner join (select top 1 count(DT#) as DT_quantity, GV# from thamgia group by GV# order by DT_quantity desc) as b on a.GV# = b.GV#
--go

-- #6
--select a.* from detai as a inner join (select top 1 DT# from detai order by KinhPhi asc) as b on a.DT# = b.DT#
--go

-- #7
--select d.GV_HoTen, d.GV_NgaySinh, c.TenDT from detai as c inner join (select a.DT# as DT_ID, b.HoTen as GV_HoTen, b.NgaySinh as GV_NgaySinh from thamgia as a inner join 
--(select * from giangvien where DiaChi = 'Tay Ho, Ha Noi') as b on b.GV# = a.GV#) as d 
--on c.DT# = d.DT_ID
--go

-- #8
--select c.* from (select * from giangvien where NgaySinh < '01/01/1980') as c inner join
--(select a.GV# as GV_ID from thamgia as a inner join (select * from detai where TenDT = 'Phan loai van ban') as b on b.DT# = a.DT#) as d on c.GV# = d.GV_ID
--go

-- #9
--select a.GV#, a.HoTen, b.TongSoGio from giangvien as a inner join (select sum(SoGio) as TongSoGio, GV# from thamgia group by GV#) as b on b.GV# = a.GV#
--go

-- #10
--insert into giangvien values ('GV06', 'Ngo Tuan Phong', 'Dong Da, Ha Noi', '08/09/1986');
--go

-- #11
--update giangvien set DiaChi = 'Tay Ho, Ha Noi' where HoTen = 'Vu Tuyet Trinh';
--go

-- #12
--delete from giangvien where GV# = 'GV02';
--go




-- #C

-- USE [master];
-- GO
-- BACKUP DATABASE [qlkh]
-- TO DISK = N'C:\AnhNguyen\CSDL_LAB\Backup\qlkh.bak' 
-- WITH NOFORMAT, NOINIT,
-- NAME = N'QLKH database backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10;
-- GO

-- USE [master];
-- GO
-- RESTORE DATABASE [qlkh] 
-- FROM DISK = N'C:\AnhNguyen\CSDL_LAB\Backup\qlkh.bak' WITH  FILE = 1, NOUNLOAD, STATS = 5;
-- GO


-- #D