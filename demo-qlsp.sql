CREATE DATABASE QLSP
USE QLSP

CREATE TABLE nha_cung_cap(
	ma_nha_cung_cap INT,
	ten_nha_cung_cap VARCHAR(100)
);

CREATE TABLE hang_san_pham(
	ma_hang INT,
	ten_hang VARCHAR(100)
);

CREATE TABLE san_pham(
	ma_san_pham INT,
	ten_san_pham VARCHAR(255),
	so_luong INT,
	tinh_trang INT,
	ngay_san_xuat DATE,
	han_su_dung DATE,
	gia FLOAT,
	ma_nha_cung_cap INT,
	ma_hang INT
);

CREATE TABLE khach_hang(
	ma_khach_hang int,
	ten_khach_hang VARCHAR(50),
	ngay_sinh DATE,
	dia_chi VARCHAR(255),
	so_dien_thoai VARCHAR(10),
	gioi_tinh BIT,
	email VARCHAR(255),
);

CREATE TABLE hoa_don(
	ma_hoa_don INT,
	ngay_lap DATE,
	ma_khach_hang INT,
	trang_thai INT
);

CREATE TABLE hoa_don_chi_tiet (
	ma_hoa_don INT,
	ma_san_pham INT,
	so_luong INT,
	gia FLOAT
);
ALTER TABLE hoa_don_chi_tiet ALTER COLUMN gia INT
ALTER TABLE hoa_don_chi_tiet ADD ma_hoa_don_chi_tiet INT
ALTER TABLE hoa_don_chi_tiet DROP COLUMN ma_hoa_don_chi_tiet
DROP TABLE hoa_don_chi_tiet
DROP DATABASE QLSP

INSERT INTO nha_cung_cap VALUES (1,'iphone')
INSERT INTO nha_cung_cap VALUES (2,'samsung')
INSERT INTO nha_cung_cap(ma_nha_cung_cap,ten_nha_cung_cap) VALUES (3,'oppo')
INSERT INTO nha_cung_cap VALUES (4,'vivo')
INSERT INTO nha_cung_cap VALUES (5,'blackberry')

INSERT INTO hang_san_pham VALUES (1,'iphone')
INSERT INTO hang_san_pham VALUES (2,'samsung')
INSERT INTO hang_san_pham(ma_hang,ten_hang) VALUES (3,'oppo')
INSERT INTO hang_san_pham VALUES (4,'vivo')
INSERT INTO hang_san_pham VALUES (5,'blackberry')

INSERT INTO san_pham VALUES (1, 'iphone 13', 20, 0, '2021-10-12', '2026-10-12', 30000000, 1, 1)
INSERT INTO san_pham VALUES (2, 'Z fold 3', 20, 0, '2021-08-15', '2026-8-15', 44000000, 2, 2)
INSERT INTO san_pham VALUES (3, 'Z filp 3', 30, 0, '2021-08-01', '2026-08-01', 25000000, 2, 2)
INSERT INTO san_pham VALUES (4, 'iphone 13 plus', 10, 1, '2021-10-12', '2026-10-12', 35000000, 1, 1)
INSERT INTO san_pham VALUES (5, 'iphone 13 pro max', 50, 0, '2021-10-12', '2026-10-12', 35000000, 1, 1)

SELECT * FROM nha_cung_cap
SELECT * FROM hang_san_pham
SELECT * FROM san_pham
SELECT ten_san_pham,so_luong,gia FROM san_pham

SELECT * FROM san_pham WHERE gia >= 35000000
SELECT * FROM san_pham WHERE gia >= 35000000 AND so_luong >= 20

SELECT ten_san_pham,so_luong,gia FROM san_pham WHERE gia >= 35000000
SELECT * FROM san_pham WHERE gia >= 35000000 OR so_luong > 20

SELECT * FROM san_pham ORDER BY gia DESC
SELECT * FROM san_pham ORDER BY ten_san_pham ASC