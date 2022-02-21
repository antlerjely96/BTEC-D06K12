CREATE DATABASE BT3
USE BT3

CREATE DATABASE QLSP
USE QLSP

CREATE TABLE nha_cung_cap(
	ma_nha_cung_cap INT PRIMARY KEY IDENTITY,
	ten_nha_cung_cap VARCHAR(100)
);

CREATE TABLE hang_san_pham(
	ma_hang_san_pham INT PRIMARY KEY IDENTITY,
	ten_hang_san_pham VARCHAR(100)
);

CREATE TABLE loai_san_pham(
	ma_loai_san_pham INT PRIMARY KEY IDENTITY,
	ten_loai_san_pham VARCHAR(100)
);

CREATE TABLE san_pham(
	ma_san_pham INT PRIMARY KEY IDENTITY,
	ten_san_pham VARCHAR(255),
	so_luong INT,
	gia FLOAT,
	ma_nha_cung_cap INT FOREIGN KEY REFERENCES nha_cung_cap(ma_nha_cung_cap),
	ma_hang_san_pham INT FOREIGN KEY REFERENCES hang_san_pham(ma_hang_san_pham),
	ma_loai_san_pham INT FOREIGN KEY REFERENCES loai_san_pham(ma_loai_san_pham)
);

CREATE TABLE khach_hang(
	ma_khach_hang INT PRIMARY KEY IDENTITY,
	ten_khach_hang VARCHAR(50),
	so_dien_thoai VARCHAR(10),
	gioi_tinh BIT,
	ngay_sinh DATE,
	dia_chi VARCHAR(255),
	email VARCHAR(255),
);

CREATE TABLE hoa_don(
	ma_hoa_don INT PRIMARY KEY IDENTITY,
	ma_khach_hang INT FOREIGN KEY REFERENCES khach_hang(ma_khach_hang),
	ngay_dat_hang DATE,
	trang_thai INT
);

CREATE TABLE hoa_don_chi_tiet (
	ma_hoa_don INT,
	ma_san_pham INT,
	PRIMARY KEY(ma_hoa_don,ma_san_pham),
	FOREIGN KEY (ma_hoa_don) REFERENCES hoa_don(ma_hoa_don),
	FOREIGN KEY (ma_san_pham) REFERENCES san_pham(ma_san_pham),
	so_luong_mua INT,
	gia_ban FLOAT
);


INSERT INTO nha_cung_cap VALUES ('APPLE')
INSERT INTO nha_cung_cap VALUES ('SAMSUNG')
INSERT INTO nha_cung_cap VALUES ('OPPO')
INSERT INTO nha_cung_cap VALUES ('VIVO')
INSERT INTO nha_cung_cap VALUES ('BLACKBERRY')
INSERT INTO nha_cung_cap VALUES ('LG')

INSERT INTO hang_san_pham VALUES ('APPLE')
INSERT INTO hang_san_pham VALUES ('SAMSUNG')
INSERT INTO hang_san_pham VALUES ('OPPO')
INSERT INTO hang_san_pham VALUES ('VIVO')
INSERT INTO hang_san_pham VALUES ('BLACKBERRY')
INSERT INTO hang_san_pham VALUES ('LG')

INSERT INTO loai_san_pham VALUES ('Dien thoai')
INSERT INTO loai_san_pham VALUES ('May tinh bang')
INSERT INTO loai_san_pham VALUES ('Laptop')
INSERT INTO loai_san_pham VALUES ('May anh')
INSERT INTO loai_san_pham VALUES ('Camera')
INSERT INTO loai_san_pham VALUES ('Phu kien')

INSERT INTO san_pham VALUES ('iphone 13', 20, 30000000, 1, 1, 1)
INSERT INTO san_pham VALUES ('Z fold 3', 20, 44000000, 2, 2, 1)
INSERT INTO san_pham VALUES ('Z filp 3', 30, 25000000, 2, 2, 1)
INSERT INTO san_pham VALUES ('Macbook', 10, 35000000, 1, 1, 2)
INSERT INTO san_pham VALUES ('OPPO A95', 50, 7000000 , 3, 3, 1)
INSERT INTO san_pham VALUES ('VIVO V23e', 40, 8500000, 4, 4, 1)

INSERT INTO khach_hang VALUES ('Nguyen Van A', '0123456789', 1, '1992-02-02', 'hn', 'a@gmail.com')
INSERT INTO khach_hang VALUES ('Tran Van B', '0123456788', 1, '1995-02-07', 'hn', 'b@gmail.com')
INSERT INTO khach_hang VALUES ('Pham Van C', '0123456787', 1, '1994-01-01', 'hp', 'c@gmail.com')
INSERT INTO khach_hang VALUES ('Nguyen Thi D', '0123456786', 0, '1993-03-03', 'hn', 'd@gmail.com')
INSERT INTO khach_hang VALUES ('Pham Thi E', '0123456785', 0, '1995-05-05', 'hp', 'e@gmail.com')
INSERT INTO khach_hang VALUES ('Trinh Thi F', '0123456784', 0, '1991-06-07', 'hn', 'f@gmail.com')

INSERT INTO hoa_don VALUES (1, '2021-05-20', 2)
INSERT INTO hoa_don VALUES (2, '2021-08-20', 2)
INSERT INTO hoa_don VALUES (3, '2021-07-25', 2)
INSERT INTO hoa_don VALUES (1, '2021-12-31', 1)
INSERT INTO hoa_don VALUES (1, '2021-12-20', 1)
INSERT INTO hoa_don VALUES (2, '2022-01-05', 0)

INSERT INTO hoa_don_chi_tiet VALUES (1, 1, 10, 30000000)
INSERT INTO hoa_don_chi_tiet VALUES (1, 2, 5, 43000000)
INSERT INTO hoa_don_chi_tiet VALUES (1, 3, 7, 25000000)
INSERT INTO hoa_don_chi_tiet VALUES (2, 1, 20, 31000000)
INSERT INTO hoa_don_chi_tiet VALUES (3, 4, 8, 35000000)
INSERT INTO hoa_don_chi_tiet VALUES (6, 6, 20, 8000000)

/* b + c*/
SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, san_pham.so_luong, san_pham.gia, nha_cung_cap.*,hang_san_pham.*,loai_san_pham.* FROM san_pham 
INNER JOIN nha_cung_cap ON san_pham.ma_nha_cung_cap = nha_cung_cap.ma_nha_cung_cap
INNER JOIN hang_san_pham ON san_pham.ma_hang_san_pham = hang_san_pham.ma_hang_san_pham
INNER JOIN loai_san_pham ON san_pham.ma_loai_san_pham = loai_san_pham.ma_loai_san_pham
WHERE san_pham.gia >= 10000000

/* d + e*/
SELECT hoa_don.ma_hoa_don, hoa_don.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.so_dien_thoai, khach_hang.email, hoa_don.ngay_dat_hang, SUM(hoa_don_chi_tiet.so_luong_mua * hoa_don_chi_tiet.gia_ban) AS tong_tien
FROM hoa_don INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham
GROUP BY hoa_don.ma_hoa_don, hoa_don.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.so_dien_thoai, khach_hang.email, hoa_don.ngay_dat_hang

/* f */
SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, hang_san_pham.ma_hang_san_pham, hang_san_pham.ten_hang_san_pham, hoa_don_chi_tiet.gia_ban, SUM(hoa_don_chi_tiet.gia_ban * hoa_don_chi_tiet.so_luong_mua) AS tong_tien_da_ban_tung_sp 
FROM hoa_don 
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham
INNER JOIN hang_san_pham ON san_pham.ma_hang_san_pham = hang_san_pham.ma_hang_san_pham
GROUP BY san_pham.ma_san_pham, san_pham.ten_san_pham, hang_san_pham.ma_hang_san_pham, hang_san_pham.ten_hang_san_pham, hoa_don_chi_tiet.gia_ban

INSERT INTO san_pham VALUES ('iphone 13', 20, 30000000, 1, 1, 1)
INSERT INTO view_san_pham VALUES ('Samsung S22', 30000000)
CREATE VIEW view_san_pham AS SELECT ma_san_pham, ten_san_pham, gia FROM san_pham
SELECT * FROM view_san_pham
SELECT * FROM san_pham

UPDATE view_san_pham SET ten_san_pham = 'ip14' WHERE ma_san_pham = 7
UPDATE san_pham SET so_luong = 50 WHERE ma_san_pham = 1

DELETE FROM view_san_pham WHERE ma_san_pham = (SELECT MAX(ma_san_pham) FROM view_san_pham)

/* j + k */
CREATE VIEW view_j_k AS SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, san_pham.so_luong, san_pham.gia, nha_cung_cap.*,hang_san_pham.*,loai_san_pham.* FROM san_pham 
INNER JOIN nha_cung_cap ON san_pham.ma_nha_cung_cap = nha_cung_cap.ma_nha_cung_cap
INNER JOIN hang_san_pham ON san_pham.ma_hang_san_pham = hang_san_pham.ma_hang_san_pham
INNER JOIN loai_san_pham ON san_pham.ma_loai_san_pham = loai_san_pham.ma_loai_san_pham
WHERE san_pham.gia >= 10000000

SELECT * FROM view_j_k

/* l + m */
CREATE VIEW view_l_m AS SELECT hoa_don.ma_hoa_don, hoa_don.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.so_dien_thoai, khach_hang.email, hoa_don.ngay_dat_hang, SUM(hoa_don_chi_tiet.so_luong_mua * hoa_don_chi_tiet.gia_ban) AS tong_tien
FROM hoa_don INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham
GROUP BY hoa_don.ma_hoa_don, hoa_don.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.so_dien_thoai, khach_hang.email, hoa_don.ngay_dat_hang

SELECT * FROM view_l_m
/* n */
CREATE PROCEDURE procedure_ttkh
@tong_tien FLOAT
AS
BEGIN
	SELECT khach_hang.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.dia_chi, khach_hang.email, khach_hang.ngay_sinh, khach_hang.so_dien_thoai, SUM(hoa_don_chi_tiet.gia_ban * hoa_don_chi_tiet.so_luong_mua) 
	AS tong_tien 
	FROM hoa_don_chi_tiet 
	INNER JOIN hoa_don ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
	INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
	GROUP BY khach_hang.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.dia_chi, khach_hang.email, khach_hang.ngay_sinh, khach_hang.so_dien_thoai 
	HAVING SUM(hoa_don_chi_tiet.gia_ban * hoa_don_chi_tiet.so_luong_mua) >= @tong_tien
END

EXEC procedure_ttkh 10000000

/* --------------------------------------------- */
CREATE PROCEDURE procedure_ttsp
AS
BEGIN
	SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, SUM(hoa_don_chi_tiet.so_luong_mua) 
	AS so_luong_da_ban 
	FROM hoa_don 
	INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
	INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham
	GROUP BY san_pham.ma_san_pham, san_pham.ten_san_pham
END

EXEC procedure_ttsp
/* ------------------------------------------- */
CREATE PROCEDURE procedure_ttkh_mua_nhieu_sp_nhat
AS
BEGIN
	SELECT TOP 1 khach_hang.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.dia_chi, khach_hang.email, khach_hang.ngay_sinh, khach_hang.so_dien_thoai,
	SUM(hoa_don_chi_tiet.so_luong_mua) AS so_luong_sp_da_mua
	FROM hoa_don_chi_tiet 
	INNER JOIN hoa_don ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
	INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
	GROUP BY khach_hang.ma_khach_hang, khach_hang.ten_khach_hang, khach_hang.dia_chi, khach_hang.email, khach_hang.ngay_sinh, khach_hang.so_dien_thoai
	ORDER BY so_luong_sp_da_mua DESC
END

EXEC procedure_ttkh_mua_nhieu_sp_nhat

SELECT * FROM san_pham

/* Tạo 1 after trigger */
CREATE TRIGGER trigger_sp ON san_pham AFTER INSERT
AS
BEGIN
	SELECT * FROM san_pham
END

INSERT INTO san_pham VALUES ('Samsung S22', 40, 32000000, 4, 4, 1)

CREATE TRIGGER trigger_delete_sp_2 ON san_pham AFTER DELETE
AS
BEGIN
	SELECT * FROM hoa_don;
END

CREATE TRIGGER trigger_delete_sp ON san_pham AFTER DELETE
AS
BEGIN
	SELECT * FROM san_pham;
END

DELETE FROM san_pham WHERE ma_san_pham = 7

DROP TRIGGER trigger_delete_sp_2

/* Tạo 1 INSTEAD OF TRIGGER */
SELECT * FROM san_pham;
SELECT * FROM hoa_don_chi_tiet;
CREATE TRIGGER instead_of_delete_sp ON san_pham INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM hoa_don_chi_tiet WHERE ma_san_pham = 3
END

DELETE FROM san_pham WHERE ma_san_pham = 3

DROP TRIGGER instead_of_delete_sp

/* n */
CREATE TRIGGER after_trigger_insert_hoa_don ON hoa_don
AFTER INSERT
AS
BEGIN
	SELECT hoa_don.ma_hoa_don, khach_hang.ma_khach_hang, khach_hang.ten_khach_hang, hoa_don.ngay_dat_hang FROM hoa_don INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang
END

/* INSERTED và DELETED */
/* insert -> inserted -> bảng */
/* update -> deleted -> inserted -> bảng */
/* Viết 1 trigger sau khi thêm 1 nhà cung cấp thì sẽ tự động thêm 1 sản phẩm vào bảng sản phẩm với mã nhà cung cấp vừa được thêm vào */
SELECT * FROM nha_cung_cap
SELECT * FROM san_pham
CREATE TRIGGER trigger_inserted ON nha_cung_cap
AFTER INSERT 
AS
BEGIN
	INSERT INTO san_pham VALUES ('Samsung S22', 40, 35000000, (SELECT TOP 1 ma_nha_cung_cap FROM nha_cung_cap ORDER BY ma_nha_cung_cap DESC), 4, 1);
END

INSERT INTO nha_cung_cap VALUES ('SAMSUNG')

SELECT * FROM nha_cung_cap
SELECT * FROM san_pham
SELECT * FROM hoa_don_chi_tiet

CREATE TRIGGER trigger_deleted ON nha_cung_cap
INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM hoa_don_chi_tiet WHERE ma_san_pham IN (SELECT ma_san_pham FROM san_pham WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted)));
	DELETE FROM san_pham WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted));
	DELETE FROM nha_cung_cap WHERE ma_nha_cung_cap IN (SELECT ma_nha_cung_cap FROM deleted);
END

DELETE FROM nha_cung_cap WHERE ma_nha_cung_cap = 1

DROP TRIGGER trigger_deleted
CREATE FUNCTION function_demo (@gia INT)
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN (SELECT TOP 1 ten_san_pham FROM san_pham WHERE gia = @gia ORDER BY ten_san_pham DESC)
END

SELECT dbo.function_demo(7000000)

CREATE FUNCTION function_inline_table (@gia INT)
RETURNS TABLE
AS
	RETURN (SELECT hoa_don.ma_hoa_don, khach_hang.ma_khach_hang, khach_hang.ten_khach_hang, hoa_don.ngay_dat_hang FROM hoa_don INNER JOIN khach_hang ON hoa_don.ma_khach_hang = khach_hang.ma_khach_hang);

SELECT * FROM function_inline_table (7000000)

DECLARE @gia INT;
SET @gia = 7000000;
SELECT * FROM san_pham WHERE gia = @gia