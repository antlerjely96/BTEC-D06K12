create database QLSV
use QLSV

create table nien_khoa (
	ma_nien_khoa int,
	ten_nien_khoa varchar(100)
);

create table nganh_hoc (
	ma_nganh_hoc int,
	ten_nganh_hoc varchar(150)
);

create table lop (
	ma_lop int,
	ten_lop varchar(100),
	ma_nien_khoa int,
	ma_nganh_hoc int
);

create table sinh_vien(
	ma_sinh_vien int,
	ten_sinh_vien varchar(50),
	ngay_sinh date,
	dia_chi varchar(255),
	so_dien_thoai varchar(10),
	gioi_tinh bit,
	email varchar(255),
	mat_khau varchar(255)
);

CREATE INDEX index_sv ON sinh_vien(ma_sinh_vien)