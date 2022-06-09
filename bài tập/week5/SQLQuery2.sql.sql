-- Lab 8
-- create database DBHousing
use DBHousing


-- create table KhachHang (
-- 	MaKH nvarchar(50) primary key,
-- 	HoTen nvarchar(50),
-- 	Sdt nvarchar(20),
-- 	CoQuan nvarchar(50)
-- );

-- create table NhaChoThue (
-- 	MaN nvarchar(50) primary key,
-- 	DiaChi nvarchar(50),
-- 	GiaThue int,
-- 	TenChuNha nvarchar(50)
-- );

-- create table HopDong (
-- 	MaN nvarchar(50),
-- 	MaKH nvarchar(50),
-- 	foreign key (MaN) references NhaChoThue(MaN) on delete cascade on update cascade,
-- 	foreign key (MaKH) references KhachHang(MaKH) on delete cascade on update cascade
-- );

-- insert into KhachHang values
-- ('KH1', N'Nguyễn Văn A', '012345678', 'Viettel'),
-- ('KH2', N'Nguyễn Văn B', '012345688', 'Viettel'),
-- ('KH3', N'Nguyễn Văn C', '012345698', 'Viettel'),
-- ('KH4', N'Nguyễn Văn D', '012345618', 'Viettel'),
-- ('KH5', N'Nguyễn Văn E', '012345628', 'Viettel'),
-- ('KH6', N'Nguyễn Văn F', '012345668', 'Viettel'),
-- ('KH7', N'Nguyễn Văn G', '012345178', 'Viettel'),
-- ('KH8', N'Nguyễn Văn H', '012345278', 'Viettel'),
-- ('KH9', N'Nguyễn Văn I', '012345378', 'Viettel'),
-- ('KH10', N'Nguyễn Văn K', '012344678', 'Viettel'),
-- ('KH11', N'Nguyễn Văn L', '012345678', 'Viettel'),
-- ('KH12', N'Nguyễn Văn M', '012346678', 'Viettel'),
-- ('KH13', N'Nguyễn Văn N', '012347678', 'Viettel'),
-- ('KH14', N'Nguyễn Văn O', '012348678', 'Viettel'),
-- ('KH15', N'Nguyễn Văn P', '012349678', 'Viettel')

-- insert into NhaChoThue values
-- ('Nha1', N'Bạch Mai, Hà Nội', 2000000, N'Nguyễn Văn A'),
-- ('Nha2', N'Bạch Mai, Hà Nội', 2500000, N'Nguyễn Văn A'),
-- ('Nha3', N'Bạch Mai, Hà Nội', 20000000, N'Nguyễn Văn A'),
-- ('Nha4', N'Bạch Mai, Hà Nội', 10000000, N'Nguyễn Văn A'),
-- ('Nha5', N'Bạch Mai, Hà Nội', 5000000, N'Nguyễn Văn A'),
-- ('Nha6', N'Bạch Mai, Hà Nội', 6500000, N'Nguyễn Văn A'),
-- ('Nha7', N'Bạch Mai, Hà Nội', 7800000, N'Nguyễn Văn A'),
-- ('Nha8', N'Bạch Mai, Hà Nội', 12000000, N'Nguyễn Văn A'),
-- ('Nha9', N'Bạch Mai, Hà Nội', 32000000, N'Nguyễn Văn A'),
-- ('Nha10', N'Bạch Mai, Hà Nội', 2500000, N'Nguyễn Văn A'),
-- ('Nha11', N'Bạch Mai, Hà Nội', 2006000, N'Nguyễn Văn A'),
-- ('Nha12', N'Bạch Mai, Hà Nội', 22000000, N'Nguyễn Văn A'),
-- ('Nha13', N'Bạch Mai, Hà Nội', 62000000, N'Nguyễn Văn A'),
-- ('Nha14', N'Bạch Mai, Hà Nội', 2700000, N'Nguyễn Văn A'),
-- ('Nha15', N'Bạch Mai, Hà Nội', 2900000, N'Nguyễn Văn A')

-- alter table HopDong add NgayBatDau datetime;
-- alter table HopDong add NgayKetThuc datetime;

-- insert into HopDong values
-- ('Nha1', 'KH2', '2019-10-23', '2021-10-20'),
-- ('Nha2', 'KH10', '2017-1-2', '2022-10-20'),
-- ('Nha5', 'KH5', '2018-1-20', '2020-10-20'),
-- ('Nha3', 'KH2', '2019-10-30', '2020-10-20'),
-- ('Nha4', 'KH2', '2019-10-20', '2021-1-20'),
-- ('Nha4', 'KH9', '2019-10-2', '2020-10-20'),
-- ('Nha1', 'KH7', '2016-10-20', '2020-10-20'),
-- ('Nha7', 'KH8', '2017-1-2', '2020-11-22'),
-- ('Nha10', 'KH10', '2022-10-23', '2099-11-1')

-- b
 --select DiaChi, TenChuNha from NhaChoThue where GiaThue < 10000000;
 --go

--update NhaChoThue set TenChuNha = N'Nông Văn Dền' where MaN = 'Nha1';

--select MaKH, HoTen, CoQuan from KhachHang where MaKH in
--(
--	select MaKH from HopDong where MaN in (
--	select MaN from NhaChoThue where TenChuNha = N'Nông Văn Dền'
--	)
--);
--go


-- select * from NhaChoThue where MaN not in (
-- 	select MaN from HopDong
-- )

-- select max(GiaThue) as GiaThueCaoNhat from NhaChoThue where MaN in (
-- 	select MaN from HopDong
-- );

-- c

--create index Idx_KhachHang_CoQuan on KhachHang(CoQuan);
--select * from KhachHang where CoQuan = 'Viettel';
--go


create index Idx_NhaChoThue_MaN on NhaChoThue(MaN);
select a.MaN, a.TenChuNha, b.SoNhaChoThue from NhaChoThue as a inner join (
select MaN, count(MaN) as SoNhaChoThue from HopDong group by MaN ) as b on a.MaN = b.MaN;
go

-- d
-- create procedure HopDongProcedure @Nguong int
-- as
-- select * from HopDong where MaN in (
-- 	select MaN from NhaChoThue where GiaThue > @Nguong
-- )
-- go

