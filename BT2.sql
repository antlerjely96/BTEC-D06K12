CREATE DATABASE BT2
USE BT2

CREATE TABLE nien_khoa(
	ma_nien_khoa INT PRIMARY KEY,
	ten_nien_khoa VARCHAR(100)
)

CREATE TABLE nganh_hoc(
	ma_nganh_hoc INT PRIMARY KEY,
	ten_nganh_hoc VARCHAR(100)
)

CREATE TABLE lop(
	ma_lop INT,
	ten_lop VARCHAR(100),
	ma_nganh_hoc INT,
	ma_nien_khoa INT,
	PRIMARY KEY(ma_lop,ma_nganh_hoc,ma_nien_khoa)
)

INSERT INTO nien_khoa VALUES (1,'Khoa 1')
INSERT INTO nien_khoa VALUES (2,'Khoa 1')
INSERT INTO nien_khoa VALUES (3,'Khoa 3')
INSERT INTO nien_khoa VALUES (4,'Khoa 4')
INSERT INTO nien_khoa VALUES (5,'Khoa 5')
SELECT * FROM nien_khoa
UPDATE nien_khoa SET ten_nien_khoa = 'Khoa 2' WHERE ma_nien_khoa = 2

INSERT INTO nganh_hoc VALUES (1,'CNTT')
INSERT INTO nganh_hoc VALUES (2,'KT')
INSERT INTO nganh_hoc VALUES (3,'Y')
INSERT INTO nganh_hoc VALUES (4,'NN')
INSERT INTO nganh_hoc VALUES (5,'HH')
SELECT * FROM nganh_hoc

INSERT INTO lop VALUES (1, 'Lop 1', 1, 1)
INSERT INTO lop VALUES (2, 'Lop 2', 1, 1)
INSERT INTO lop VALUES (3, 'Lop 3', 1, 2)
INSERT INTO lop VALUES (4, 'Lop 4', 4, 4)
INSERT INTO lop VALUES (5, 'Lop 5', 2, 1)
SELECT * FROM lop