CREATE DATABASE QLTT
USE QLTT

CREATE TABLE khoa(
	makhoa VARCHAR(10),
	tenkhoa VARCHAR(30),
	dienthoai VARCHAR(10)
)

CREATE TABLE giangvien(
	magv INT,
	hotengv VARCHAR(30),
	luong FLOAT,
	makhoa VARCHAR(10)
)

CREATE TABLE sinhvien(
	masv INT,
	hotensv VARCHAR(30),
	makhoa VARCHAR(10),
	namsinh INT,
	quequan VARCHAR(30)
)

CREATE TABLE DeTai(
	madt VARCHAR(10),
	tendt VARCHAR(30),
	kinhphi INT,
	noithuctap VARCHAR(30)
)

CREATE TABLE HuongDan(
	masv INT,
	madt VARCHAR(10),
	magv INT,
	diem FLOAT,
	ketqua varchar(20)
)

/* a, insert moi bang 10 ban ghi */
INSERT INTO khoa VALUES ('1', 'CNTT', '0123456789')
INSERT INTO khoa VALUES ('2', 'VLKT', '0123456788')
INSERT INTO khoa VALUES ('3', 'CNTP', '0123456787')
INSERT INTO khoa VALUES ('4', 'TT', '0123456786')
INSERT INTO khoa VALUES ('5', 'KT', '0123456785')
INSERT INTO khoa VALUES ('6', 'NN', '0123456784')
INSERT INTO khoa VALUES ('7', 'HH', '0123456789')
INSERT INTO khoa VALUES ('8', 'GDTC', '0123456789')
INSERT INTO khoa VALUES ('9', 'GDQP', '0123456789')
INSERT INTO khoa VALUES ('10', 'CNDM', '0123456789')

INSERT INTO giangvien VALUES (1, 'gva', 500, 1)
INSERT INTO giangvien VALUES (2, 'gvb', 501, 1)
INSERT INTO giangvien VALUES (3, 'gvc', 300, 6)
INSERT INTO giangvien VALUES (4, 'gvd', 400, 3)
INSERT INTO giangvien VALUES (5, 'gve', 230, 9)
INSERT INTO giangvien VALUES (6, 'gvf', 500, 10)
INSERT INTO giangvien VALUES (7, 'gvg', 510, 2)
INSERT INTO giangvien VALUES (8, 'gvh', 400, 5)
INSERT INTO giangvien VALUES (9, 'gvi', 700, 4)
INSERT INTO giangvien VALUES (10, 'gva', 530, 7)

INSERT INTO sinhvien VALUES (1, 'sva', 1, 1999, 'hn')
INSERT INTO sinhvien VALUES (2, 'svb', 1, 2000, 'hp')
INSERT INTO sinhvien VALUES (3, 'svc', 6, 2000, 'hn')
INSERT INTO sinhvien VALUES (4, 'svd', 3, 2002, 'hn')
INSERT INTO sinhvien VALUES (5, 'sve', 9, 2003, 'hp')
INSERT INTO sinhvien VALUES (6, 'svf', 10, 2001, 'hp')
INSERT INTO sinhvien VALUES (7, 'svg', 2, 2000, 'hp')
INSERT INTO sinhvien VALUES (8, 'svh', 5, 2003, 'hn')
INSERT INTO sinhvien VALUES (9, 'svi', 4, 2002, 'hp')
INSERT INTO sinhvien VALUES (10, 'sva', 7, 2003, 'hn')

INSERT INTO DeTai VALUES (1, 'de tai 1', 100, 'cty a')
INSERT INTO DeTai VALUES (2, 'de tai 2', 150, 'cty a')
INSERT INTO DeTai VALUES (3, 'de tai 3', 130, 'cty b')
INSERT INTO DeTai VALUES (4, 'de tai 4', 200, 'cty c')
INSERT INTO DeTai VALUES (5, 'de tai 5', 100, 'cty d')
INSERT INTO DeTai VALUES (6, 'de tai 6', 120, 'cty e')
INSERT INTO DeTai VALUES (7, 'de tai 7', 210, 'cty f')
INSERT INTO DeTai VALUES (8, 'de tai 8', 200, 'cty c')
INSERT INTO DeTai VALUES (9, 'de tai 9', 100, 'cty h')
INSERT INTO DeTai VALUES (10, 'de tai 10', 300, 'cty b')

INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (1,1,1,5.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (2,1,1,6.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (3,3,10,7.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (4,4,6,5.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (5,5,5,4.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (6,6,8,5.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (7,7,4,6.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (8,8,3,2.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (9,9,4,8.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (10,10,2,1.5)
INSERT INTO HuongDan(masv,madt,magv,diem) VALUES (11,10,2,5.5)
INSERT INTO HuongDan(masv,madt,magv) VALUES (12,1,2)

/* b, Đưa ra thông tin gồm mã số, họ tên và mã khoa của tất cả các giảng viên */
SELECT magv,hotengv,makhoa FROM giangvien

/* c, Đưa ra thông tin gồm mã số, họ tên và mã khoa của các giảng viên của khoa 1 va 5 */
SELECT magv,hotengv,makhoa FROM giangvien WHERE makhoa = 1 OR makhoa = 5

/* d, Đưa ra thông tin của sinh viên có điểm từ 5 đến 8 */
SELECT * FROM HuongDan WHERE diem >= 5 AND diem <= 8

SELECT * FROM HuongDan

/* e, */
UPDATE HuongDan SET ketqua = 'Chua biet'
UPDATE HuongDan SET ketqua = 'truot' WHERE diem < 5
UPDATE HuongDan SET ketqua = 'dat', diem = 7 WHERE diem >= 5

/* f, Xóa bản ghi*/
DELETE FROM HuongDan
DELETE FROM HuongDan WHERE masv = 11

/* g, */
SELECT TOP 3 * FROM HuongDan ORDER BY diem DESC

/* h, */
SELECT * FROM sinhvien WHERE hotensv = 'sva'

/* i, */
/* Hiển thị thông tin sv có tên kết thúc bằng chữ a*/
SELECT * FROM sinhvien WHERE hotensv LIKE '%a'
/* Hiển thị thông tin sv có tên bắt đầu bằng chữ s*/
SELECT * FROM sinhvien WHERE hotensv LIKE 's%'
/* Hiển thị thông tin sv có tên có chữ v trong tên*/
SELECT * FROM sinhvien WHERE hotensv LIKE '%v%'

 /* j */
SELECT * FROM HuongDan WHERE diem IN (5.5,6,7,8)
SELECT * FROM HuongDan WHERE diem NOT IN (5.5,6,7,8)
/* tương tự câu d*/
SELECT * FROM HuongDan WHERE diem BETWEEN 5 AND 8
/* as: dat ten cho cot, bang */
SELECT masv,diem AS diem_tb FROM HuongDan

/* k, */
SELECT masv,diem FROM HuongDan WHERE diem IS NOT NULL
SELECT masv,diem FROM HuongDan WHERE diem IS NULL