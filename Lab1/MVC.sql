create database QLBANSACH
GO
use QLBANSACH
GO
CREATE TABLE KHACHHANG
(
MaKH INT IDENTITY(1,1),
HoTen nVarchar(50) NOT NULL,
Taikhoan Varchar(50) UNIQUE,
Matkhau Varchar(50) NOT NULL,
Email Varchar(100) UNIQUE,
DiachiKH nVarchar(200),
DienthoaiKH Varchar(50),
Ngaysinh DATETIME
CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)
GO
Create Table CHUDE
(
MaCD int Identity(1,1),
TenChuDe nvarchar(50) NOT NULL,
CONSTRAINT PK_ChuDe PRIMARY KEY(MaCD)
)
GO
Create Table NHAXUATBAN
(
MaNXB int identity(1,1),
TenNXB nvarchar(50) NOT NULL,
Diachi NVARCHAR(200),
DienThoai VARCHAR(50),
CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB)
)
Go
CREATE TABLE SACH
(
Masach INT IDENTITY(1,1),
Tensach NVARCHAR(100) NOT NULL,
Giaban Decimal(18,0) CHECK (Giaban>=0),
Mota NVarchar(Max),
Anhbia VARCHAR(50),
Ngaycapnhat DATETIME,
Soluongton INT,
MaCD INT,
MaNXB INT,
Constraint PK_Sach Primary Key(Masach),
Constraint FK_Chude Foreign Key(MaCD) References CHUDE(MaCD),
Constraint FK_NhaXB Foreign Key(MaNXB)References NHAXUATBAN(MANXB)
)
GO
CREATE TABLE TACGIA
(
MaTG INT IDENTITY(1,1),
TenTG NVARCHAR(50) NOT NULL,
Diachi NVARCHAR(100),
Tieusu nVarchar(Max),
Dienthoai VARCHAR(50),
CONSTRAINT PK_TacGia PRIMARY KEY(MaTG)
)
GO
CREATE TABLE VIETSACH (
    MaTG INT,
    Masach INT,
    Vaitro NVARCHAR(50),
    Vitri NVARCHAR(50),
    PRIMARY KEY (MaTG, Masach),
    FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG)
);
GO
CREATE TABLE DONDATHANG (
    SoDH INT IDENTITY(1,1) PRIMARY KEY,
    MaKH INT,
    NgayDH DATETIME,
    Ngaygiao DATETIME,
    Dathanhtoan BIT DEFAULT 0,
    Trinhtranggiaohang BIT DEFAULT 0,
    FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
);
Go
CREATE TABLE CTDATHANG (
    SoDH INT,
    Masach INT,
    Soluong INT CHECK (Soluong > 0),
    Dongia DECIMAL(18,0) CHECK (Dongia >= 0),
    PRIMARY KEY (SoDH, Masach),
    FOREIGN KEY (SoDH) REFERENCES DONDATHANG(SoDH),
    FOREIGN KEY (Masach) REFERENCES SACH(Masach)
);

INSERT INTO KHACHHANG (HoTen, Taikhoan, Matkhau, Email, DiachiKH, DienthoaiKH, Ngaysinh)
VALUES ('Nguyen Van A', 'nguyenvana', 'abc123', 'nguyenvana@example.com', '123 Nguyen Trai', '0123456789', '1990-01-01'),
       ('Tran Thi B', 'tranb', 'abc456', 'tranb@example.com', '456 Le Loi', '0987654321', '1991-02-02'),
       ('Le Van C', 'levanc', 'abc789', 'levanc@example.com', '789 Tran Hung Dao', '0123456789', '1992-03-03')

INSERT INTO CHUDE (TenChuDe)
VALUES ('Chu de 1'),
       ('Chu de 2'),
       ('Chu de 3')

INSERT INTO NHAXUATBAN (TenNXB, Diachi, DienThoai)
VALUES ('Ha Noi', 'Hoan Kiem', '0123456789'),
       ('Kim Dong', 'Hai Ba Trung', '0987654321'),
       ('Phu Nu Viet Nam', 'Ha Ba Trung', '0123456987')

INSERT INTO SACH (Tensach, Giaban, Mota, Anhbia, Ngaycapnhat, Soluongton, MaCD, MaNXB)
VALUES ('Ma Vương Tôi Đây Nên Yêu Cô Dâu ELF Của Mình Như Thế Nào? - Tập 1 - Bản Đặc Biệt - Tặng Kèm Card Trong + Bookmark + Postcard', 100000, 'Mo ta sach', 'anh1.jpg', '2023-01-01', 10, 1, 1),
       ('One-Punch Man - Tập 25: Kị Sĩ Cơ Khí - Tặng Kèm Bookmark Ivory', 200000, 'Mo ta sach ', 'anh2.jpg', '2023-02-02', 20, 2, 2),
       ('Tanya Chiến Ký 4: Dabit Deus His Quoque Finem', 300000, 'Mo ta sach ', 'anh3.jpg', '2023-03-03', 30, 3, 3)

INSERT INTO TACGIA (TenTG, Diachi, Tieusu, Dienthoai)
VALUES ('Tac gia A', '123 Nguyen Trai', 'Tieu su tac gia A', '0123456789'),
       ('Tac gia B', '456 Le Loi', 'Tieu su tac gia B', '0987654321'),
       ('Tac gia C', '789 Tran Hung Dao', 'Tieu su tac gia C', '0123456789')