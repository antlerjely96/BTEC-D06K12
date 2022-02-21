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
	so_luong_sv INT,
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
INSERT INTO diem(loai_diem,ma_mon_hoc, diem, lan_thi,ngay_thi) VALUES (0, 1, 7, 1, '2020/02/10')

SELECT * FROM lop
UPDATE lop SET ten_lop = 'Lop 2' WHERE ma_lop = 2

/* b, */
SELECT * FROM lop WHERE ma_nganh_hoc = 1

/* c, */
SELECT * FROM lop WHERE so_luong_sv >= 30

/* d, */
SELECT * FROM lop
SELECT * FROM sinh_vien

SELECT lop.*, sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi, sinh_vien.sdt, sinh_vien.email 
FROM lop INNER JOIN sinh_vien 
ON lop.ma_lop = sinh_vien.ma_lop 
WHERE sinh_vien.ma_lop = 1

/* e */
SELECT lop.*, nganh_hoc.ten_nganh_hoc 
FROM lop INNER JOIN nganh_hoc 
ON lop.ma_nganh_hoc = nganh_hoc.ma_nganh_hoc 
WHERE nganh_hoc.ma_nganh_hoc = 2

/* f */
SELECT sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi,sinh_vien.sdt,sinh_vien.email, sinh_vien.ma_lop, diem.* 
FROM sinh_vien INNER JOIN diem 
ON sinh_vien.ma_sv = diem.ma_sv 
WHERE diem.ma_mon_hoc = 1 AND diem.diem >= 5

/* g */
SELECT lop.*, sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi, sinh_vien.sdt, sinh_vien.email 
FROM lop LEFT JOIN sinh_vien 
ON lop.ma_lop = sinh_vien.ma_lop

SELECT lop.*, sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi, sinh_vien.sdt, sinh_vien.email 
FROM sinh_vien RIGHT JOIN lop 
ON lop.ma_lop = sinh_vien.ma_lop

SELECT lop.*, sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi, sinh_vien.sdt, sinh_vien.email 
FROM sinh_vien FULL JOIN lop 
ON lop.ma_lop = sinh_vien.ma_lop

/* h */
SELECT sinh_vien.ma_sv,sinh_vien.ten_sv,lop.ma_lop,lop.ten_lop,lop.ma_nganh_hoc,nganh_hoc.ten_nganh_hoc,lop.ma_nien_khoa,nien_khoa.ten_nien_khoa 
FROM sinh_vien INNER JOIN lop ON sinh_vien.ma_lop = lop.ma_lop
INNER JOIN nganh_hoc ON nganh_hoc.ma_nganh_hoc = lop.ma_nganh_hoc
INNER JOIN nien_khoa ON nien_khoa.ma_nien_khoa = lop.ma_nien_khoa

/* i */
SELECT sinh_vien.ma_sv,sinh_vien.ten_sv,lop.ma_lop,lop.ten_lop,diem.diem,diem.ma_mon_hoc,mon_hoc.ten_mon_hoc,diem.lan_thi
FROM sinh_vien INNER JOIN lop ON sinh_vien.ma_lop = lop.ma_lop
INNER JOIN diem ON diem.ma_sv = sinh_vien.ma_sv
INNER JOIN mon_hoc ON mon_hoc.ma_mon_hoc = diem.ma_mon_hoc

/* Date function */
/* Lấy thời gian hiện tại*/
SELECT GETDATE() AS ngay_gio_hien_tai
/* Chênh lệch giữa 2 thời gian*/
SELECT DATEDIFF(WEEK,'2020-02-10',GETDATE()) AS so_ngay
/* Cộng thêm 1 số lượng đơn vị thời gian vào thời gian cho trước*/
SELECT DATEADD(MONTH, 1, GETDATE())
/* Lấy năm || tháng || ngày*/
SELECT DATENAME(YEAR, GETDATE()) AS nam_hien_tai
SELECT DATENAME(MONTH, GETDATE()) AS thang_hien_tai
SELECT DATENAME(DAY, GETDATE()) AS thang_hien_tai
SELECT DATENAME(DAYOFYEAR, GETDATE()) AS ngay_hien_tai
/* Lấy ngày */
SELECT DAY(GETDATE()) AS ngay
/* Lấy tháng */
SELECT MONTH(GETDATE()) AS thang
/* Lấy năm */
SELECT YEAR(GETDATE()) AS nam

/* Tính điểm trung bình*/
SELECT ma_sv, AVG(diem) as diem_trung_binh FROM diem GROUP BY ma_sv
/* Đếm số bản ghi*/
SELECT COUNT(*) FROM diem
SELECT COUNT(ma_sv) FROM diem
SELECT * FROM diem
/* Tìm min, max*/
SELECT MIN(diem) FROM diem AS diem_thap_nhat
SELECT MAX(diem) FROM diem AS diem_cao_nhat

/* Tạo 1 stored procedure */
CREATE PROCEDURE procedure_get_thong_tin_sv AS
BEGIN
	SELECT * FROM sinh_vien INNER JOIN lop ON sinh_vien.ma_lop = lop.ma_lop
END
EXEC procedure_get_thong_tin_sv

CREATE PROCEDURE procedure_demo AS
BEGIN
	SELECT * FROM sinh_vien INNER JOIN lop ON sinh_vien.ma_lop = lop.ma_lop;
	SELECT sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi,sinh_vien.sdt,sinh_vien.email, sinh_vien.ma_lop, diem.* 
		FROM sinh_vien INNER JOIN diem 
		ON sinh_vien.ma_sv = diem.ma_sv;
	SELECT sinh_vien.ma_sv,sinh_vien.ten_sv,lop.ma_lop,lop.ten_lop,lop.ma_nganh_hoc,nganh_hoc.ten_nganh_hoc,lop.ma_nien_khoa,nien_khoa.ten_nien_khoa 
		FROM sinh_vien INNER JOIN lop ON sinh_vien.ma_lop = lop.ma_lop
		INNER JOIN nganh_hoc ON nganh_hoc.ma_nganh_hoc = lop.ma_nganh_hoc
		INNER JOIN nien_khoa ON nien_khoa.ma_nien_khoa = lop.ma_nien_khoa;

END
EXEC procedure_demo

CREATE PROCEDURE param_procedure
@ma_sv INT
AS
BEGIN
	SELECT * FROM sinh_vien INNER JOIN lop ON sinh_vien.ma_lop = lop.ma_lop WHERE sinh_vien.ma_sv = @ma_sv
END
EXEC param_procedure 1
EXEC param_procedure 2

CREATE PROCEDURE demo_param_procedure
@ma_mon_hoc INT, @diem FLOAT, @ten_sv VARCHAR(50)
AS
BEGIN
	SELECT sinh_vien.ma_sv, sinh_vien.ten_sv, sinh_vien.tuoi,sinh_vien.sdt,sinh_vien.email, sinh_vien.ma_lop, diem.* 
	FROM sinh_vien INNER JOIN diem 
	ON sinh_vien.ma_sv = diem.ma_sv 
	WHERE diem.ma_mon_hoc = @ma_mon_hoc AND diem.diem >= @diem AND sinh_vien.ten_sv LIKE CONCAT('%',@ten_sv,'%')
END

EXEC demo_param_procedure 1,5,'sv'
EXEC demo_param_procedure 1,2,'Nguyen'

DROP PROCEDURE demo_param_procedure