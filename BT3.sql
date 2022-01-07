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
SELECT san_pham.ma_san_pham, san_pham.ten_san_pham, hang_san_pham.*,hoa_don_chi_tiet.gia_ban FROM hoa_don 
INNER JOIN hoa_don_chi_tiet ON hoa_don.ma_hoa_don = hoa_don_chi_tiet.ma_hoa_don
INNER JOIN san_pham ON hoa_don_chi_tiet.ma_san_pham = san_pham.ma_san_pham
INNER JOIN hang_san_pham ON san_pham.ma_hang_san_pham = hang_san_pham.ma_hang_san_pham