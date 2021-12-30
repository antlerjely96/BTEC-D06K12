CREATE DATABASE BT2
USE BT2
/* PRIMARY KEY: Khóa chính
	IDENTITY: tự tăng
	FOREIGN KEY: Khóa ngoại
	UNIQUE: duy nhất
*/
CREATE TABLE nien_khoa(
	ma_nien_khoa INT PRIMARY KEY IDENTITY,
	ten_nien_khoa VARCHAR(100) UNIQUE
)
CREATE TABLE nganh_hoc(
	ma_nganh_hoc INT PRIMARY KEY IDENTITY,
	ten_nganh_hoc VARCHAR(100) UNIQUE
)
CREATE TABLE lop(
	ma_lop INT PRIMARY KEY IDENTITY,
	ten_lop VARCHAR(100),
	ma_nganh_hoc INT,
	ma_nien_khoa INT,
	so_luong_sv int,
	FOREIGN KEY (ma_nien_khoa) REFERENCES nien_khoa(ma_nien_khoa),
	FOREIGN KEY (ma_nganh_hoc) REFERENCES nganh_hoc(ma_nganh_hoc)
)

CREATE TABLE sinh_vien(
	ma_sv INT PRIMARY KEY IDENTITY,
	ten_sv VARCHAR(100),
	tuoi INT,
	sdt VARCHAR(10),
	email VARCHAR(100),
	ma_lop INT FOREIGN KEY REFERENCES lop(ma_lop)
)

CREATE TABLE mon_hoc(
	ma_mon_hoc INT PRIMARY KEY IDENTITY,
	ten_mon_hoc VARCHAR(100),
	thoi_luong INT,
	ma_nganh_hoc INT FOREIGN KEY REFERENCES nganh_hoc(ma_nganh_hoc)
)


CREATE TABLE diem(
	ma_diem INT PRIMARY KEY IDENTITY,
	loai_diem INT,
	ma_sv INT FOREIGN KEY REFERENCES sinh_vien(ma_sv),
	ma_mon_hoc INT FOREIGN KEY REFERENCES mon_hoc(ma_mon_hoc),
	diem FLOAT,
	lan_thi INT,
	ngay_thi DATE
)

INSERT INTO nien_khoa VALUES ('Khoa 1')
INSERT INTO nien_khoa VALUES ('Khoa 2')
INSERT INTO nien_khoa VALUES ('Khoa 3')
INSERT INTO nien_khoa VALUES ('Khoa 4')
INSERT INTO nien_khoa VALUES ('Khoa 5')
SELECT * FROM nien_khoa
UPDATE nien_khoa SET ten_nien_khoa = 'Khoa 2' WHERE ma_nien_khoa = 2
DELETE FROM nien_khoa WHERE ma_nien_khoa = 5

INSERT INTO nganh_hoc VALUES ('CNTT')
INSERT INTO nganh_hoc VALUES ('KT')
INSERT INTO nganh_hoc VALUES ('Y')
INSERT INTO nganh_hoc VALUES ('NN')
INSERT INTO nganh_hoc VALUES ('HH')
SELECT * FROM nganh_hoc

INSERT INTO lop VALUES ('Lop 1', 1, 1, 20)
INSERT INTO lop VALUES ('Lop 2', 1, 1, 25)
INSERT INTO lop VALUES ('Lop 3', 1, 2, 35)
INSERT INTO lop VALUES ('Lop 4', 4, 4, 30)
INSERT INTO lop VALUES ('Lop 5', 2, 1, 40)
INSERT INTO lop(ten_lop,ma_nganh_hoc,so_luong_sv) VALUES ('Lop 6', 2, 40)

INSERT INTO sinh_vien VALUES ('Nguyen Van A', 21, 0123456789, 'a@gmail.com', 1)
INSERT INTO sinh_vien VALUES ('Nguyen Van B', 22, 0123456788, 'b@gmail.com', 1)
INSERT INTO sinh_vien VALUES ('Bui Thi c', 21, 0123456787, 'c@gmail.com', 3)
INSERT INTO sinh_vien VALUES ('Pham Van D', 20, 0123456786, 'd@gmail.com', 2)
INSERT INTO sinh_vien VALUES ('Trinh Van E', 21, 0123456785, 'e@gmail.com', 4)

INSERT INTO mon_hoc VALUES ('Lap trinh can ban', 60, 1)
INSERT INTO mon_hoc VALUES ('Co so du lieu', 90, 1)
INSERT INTO mon_hoc VALUES ('Tieng Anh 1', 45, 4)
INSERT INTO mon_hoc VALUES ('Kinh te vi mo', 60, 2)
INSERT INTO mon_hoc VALUES ('Thiet ke va phat trien phan mem', 60, 1)

INSERT INTO diem VALUES (0, 1, 1, 5.5, 1, '2020/02/02')
INSERT INTO diem VALUES (1, 1, 1, 6, 1, '2020/02/02')
INSERT INTO diem VALUES (0, 2, 2, 5, 1, '2020/05/02')
INSERT INTO diem VALUES (1, 2, 2, 8, 1, '2020/05/02')
INSERT INTO diem VALUES (0, 4, 1, 7, 1, '2020/02/10')

SELECT * FROM lop
UPDATE lop SET ten_lop = 'Lop 2' WHERE ma_lop = 2

/* b, */
SELECT * FROM lop WHERE ma_nganh_hoc = 1

/* c, */
SELECT * FROM lop WHERE so_luong_sv >= 30

/* d, */
SELECT * FROM lop
SELECT * FROM sinh_vien

SELECT lop.*, sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi, sinh_vien.sdt, sinh_vien.email FROM lop INNER JOIN sinh_vien ON lop.ma_lop = sinh_vien.ma_lop