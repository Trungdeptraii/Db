CREATE TABLE "dat_phong" (
  "ma_dat_phong" varchar(50) PRIMARY KEY NOT NULL,
  "ma_phong" varchar(50) NOT NULL,
  "ma_kh" varchar(50) NOT NULL,
  "ngay_dat" date NOT NULL,
  "gio_bat_dau" timetz NOT NULL,
  "gio_ket_thuc" timetz NOT NULL,
  "tien_dat_coc" integer NOT NULL,
  "ghi_chu" varchar(200),
  "trang_thai_dat" varchar(50) NOT NULL,
  "created_at" timestamptz,
  "updated_at" timestamptz
);

CREATE TABLE "phong" (
  "ma_phong" varchar(50) PRIMARY KEY NOT NULL,
  "loai_phong" varchar(50) NOT NULL,
  "so_khach_toi_da" integer NOT NULL,
  "gia_phong_mot_gio" integer NOT NULL,
  "mo_ta" varchar(200),
  "created_at" timestamptz,
  "updated_at" timestamptz
);

CREATE TABLE "khach_hang" (
  "ma_kh" varchar(50) PRIMARY KEY NOT NULL,
  "ten_kh" varchar(50) NOT NULL,
  "dia_chi" varchar(100),
  "so_dien_thoai" integer NOT NULL,
  "created_at" timestamptz,
  "updated_at" timestamptz
);

CREATE TABLE "chi_tiet_su_dung_dich_vu" (
  "ma_dat_phong" varchar(50),
  "ma_dich_vu" varchar(50),
  "so_luong" integer,
  "created_at" timestamptz,
  "updated_at" timestamptz,
  PRIMARY KEY ("ma_dat_phong", "ma_dich_vu")
);

CREATE TABLE "dich_vu_di_kem" (
  "ma_dich_vu" varchar(50) PRIMARY KEY NOT NULL,
  "ten_dich_vu" varchar(50) NOT NULL,
  "don_vi_tinh" varchar(50) NOT NULL,
  "don_gia" integer NOT NULL,
  "created_at" timestamptz,
  "updated_at" timestamptz
);

ALTER TABLE "dat_phong" ADD FOREIGN KEY ("ma_phong") REFERENCES "phong" ("ma_phong");

ALTER TABLE "dat_phong" ADD FOREIGN KEY ("ma_kh") REFERENCES "khach_hang" ("ma_kh");

ALTER TABLE "chi_tiet_su_dung_dich_vu" ADD FOREIGN KEY ("ma_dat_phong")  REFERENCES "dat_phong" ("ma_dat_phong");

ALTER TABLE"chi_tiet_su_dung_dich_vu" ADD FOREIGN KEY ("ma_dich_vu") REFERENCES "dich_vu_di_kem" ("ma_dich_vu");

--Thêm dữ liệu bảng phòng
insert into phong(ma_phong, loai_phong, so_khach_toi_da, gia_phong_mot_gio) values ('P0001', 'Loai 1', 20, 60000);
insert into phong(ma_phong, loai_phong, so_khach_toi_da, gia_phong_mot_gio) values ('P0002', 'Loai 2', 25, 80000);
insert into phong(ma_phong, loai_phong, so_khach_toi_da, gia_phong_mot_gio) values ('P0003', 'Loai 3', 15, 50000);
insert into phong(ma_phong, loai_phong, so_khach_toi_da, gia_phong_mot_gio) values ('P0004', 'Loai 4', 20, 50000);

--Thêm dữ liệu bảng khách hàng
insert into khach_hang(ma_kh, ten_kh, dia_chi, so_dien_thoai) values ('KH0001', 'Nguyen Van A', 'Hoa xuan', 1111111111);
insert into khach_hang(ma_kh, ten_kh, dia_chi, so_dien_thoai) values ('KH0002', 'Nguyen Van B', 'Hoa hai', 1111111112);
insert into khach_hang(ma_kh, ten_kh, dia_chi, so_dien_thoai) values ('KH0003', 'Phan Van A', 'Cam le', 1111111113);
insert into khach_hang(ma_kh, ten_kh, dia_chi, so_dien_thoai) values ('KH0004', 'Phan Van B', 'Hoa xuan', 1111111114);

--Thêm dữ liệu bảng đặt phòng
insert into dat_phong (ma_dat_phong, ma_phong, ma_kh, ngay_dat, gio_bat_dau, gio_ket_thuc, tien_dat_coc, trang_thai_dat)
values ('DP0001', 'P0001', 'KH0002', to_date('26 03 2018', 'DD/MM/YYYY'), TO_TIMESTAMP('11:00', 'HH24:MI')::TIME, TO_TIMESTAMP('13:30', 'HH24:MI')::TIME, 100000, 'Da dat');
insert into dat_phong (ma_dat_phong, ma_phong, ma_kh, ngay_dat, gio_bat_dau, gio_ket_thuc, tien_dat_coc, trang_thai_dat)
values ('DP0002', 'P0001', 'KH0003', to_date('27 03 2018', 'DD/MM/YYYY'), to_timestamp( '17:15', 'HH24:MI')::TIME, to_timestamp( '19:15', 'HH24:MI')::TIME, 50000, 'Da huy');
insert into dat_phong (ma_dat_phong, ma_phong, ma_kh, ngay_dat, gio_bat_dau, gio_ket_thuc, tien_dat_coc, trang_thai_dat)
values ('DP0003', 'P0002', 'KH0002', to_date('26 03 2018', 'DD/MM/YYYY'), to_timestamp( '20:30', 'HH24:MI')::TIME, to_timestamp( '22:15', 'HH24:MI')::TIME, 100000, 'Da dat');
insert into dat_phong (ma_dat_phong, ma_phong, ma_kh, ngay_dat, gio_bat_dau, gio_ket_thuc, tien_dat_coc, trang_thai_dat)
values ('DP0004', 'P0003', 'KH0001', to_date('01 04 2018', 'DD/MM/YYYY'), to_timestamp( '19:30', 'HH24:MI')::TIME, to_timestamp( '21:15', 'HH24:MI')::TIME, 200000, 'Da dat');

-- Thêm dữ liệu bảng dịch vụ đi kèm
insert into dich_vu_di_kem (ma_dich_vu, ten_dich_vu, don_vi_tinh, don_gia)
values ('DV0001', 'Beer', 'lon', 10000);
insert into dich_vu_di_kem (ma_dich_vu, ten_dich_vu, don_vi_tinh, don_gia)
values ('DV0002', 'Nuoc ngot', 'lon', 8000);
insert into dich_vu_di_kem (ma_dich_vu, ten_dich_vu, don_vi_tinh, don_gia)
values ('DV0003', 'Trai cay', 'dia', 35000);
insert into dich_vu_di_kem (ma_dich_vu, ten_dich_vu, don_vi_tinh, don_gia)
values ('DV0004', 'Khan uot', 'cai', 2000);

--Thêm dữ liệu bảng chi tiết sử dụng dịch vụ
insert into chi_tiet_su_dung_dich_vu (ma_dat_phong, ma_dich_vu, so_luong)
values ('DP0001', 'DV0001', 20);
insert into chi_tiet_su_dung_dich_vu (ma_dat_phong, ma_dich_vu, so_luong)
values ('DP0001', 'DV0003', 3);
insert into chi_tiet_su_dung_dich_vu (ma_dat_phong, ma_dich_vu, so_luong)
values ('DP0001', 'DV0002', 10);
insert into chi_tiet_su_dung_dich_vu (ma_dat_phong, ma_dich_vu, so_luong)
values ('DP0002', 'DV0002', 10);
insert into chi_tiet_su_dung_dich_vu (ma_dat_phong, ma_dich_vu, so_luong)
values ('DP0002', 'DV0003', 1);
insert into chi_tiet_su_dung_dich_vu (ma_dat_phong, ma_dich_vu, so_luong)
values ('DP0003', 'DV0003', 2);
insert into chi_tiet_su_dung_dich_vu (ma_dat_phong, ma_dich_vu, so_luong)
values ('DP0003', 'DV0004', 10);

-- Câu 1: Hiển thị MaDatPhong, MaPhong, LoaiPhong, GiaPhong, TenKH, NgayDat, TongTienHat, TongTienSuDungDichVu, TongTienThanhToan 
-- tương ứng với từng mã đặt phòng có trong bảng DAT_PHONG. Những đơn đặt phòng nào 
-- không sử dụng dịch vụ đi kèm thì cũng liệt kê thông tin của đơn đặt phòng đó ra
-- TongTienHat = GiaPhong * (GioKetThuc – GioBatDau) 
-- TongTienSuDungDichVu = SoLuong * DonGia TongTienThanhToan = TongTienHat + sum (TongTienSuDungDichVu)
select dat_phong.ma_dat_phong as MaDatPhong, phong.ma_phong as MaPhong, phong.loai_phong as LoaiPhong, phong.gia_phong_mot_gio as GiaPhong,
khach_hang.ten_kh as TenKH, dat_phong.ngay_dat as NgayDat,
from dat_phong
inner join phong
on dat_phong.ma_phong = phong.ma_phong and dat_phong.trang_thai_dat = 'Da dat'
inner join khach_hang
on dat_phong.ma_kh = khach_hang.ma_kh
--Chưa xong...


-- Câu 2: Hiển thị MaKH, TenKH, DiaChi, SoDT 
-- của những khách hàng đã từng đặt phòng karaoke có địa chỉ ở “Hoa xuan”
select khach_hang.ma_kh as MaKH, khach_hang.ten_kh as TenKH, khach_hang.dia_chi as DiaChi, khach_hang.so_dien_thoai as SoDT 
from khach_hang
inner join dat_phong
on dat_phong.ma_kh = khach_hang.ma_kh
where khach_hang.dia_chi like '%Hoa xuan%'

-- Câu 3: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat 
-- của những phòng được khách hàng đặt có số lần đặt lớn hơn 2 lần và trạng thái đặt là “Da dat”
-- phong.ma_phong as MaPhong, phong.loai_phong as LoaiPhong, phong.so_khach_toi_da as SoKhachToiDa,
select phong.ma_phong as MaPhong, phong.loai_phong as LoaiPhong, phong.so_khach_toi_da as SokhachToiDa, phong.gia_phong_mot_gio as GiaPhong, count(dat_phong.ma_phong)
from dat_phong
inner join phong
on phong.ma_phong = dat_phong.ma_phong  and dat_phong.trang_thai_dat = 'Da dat'
group by dat_phong.ma_phong, phong.ma_phong
having count(dat_phong.trang_thai_dat = 'Da dat') > 2
																			


