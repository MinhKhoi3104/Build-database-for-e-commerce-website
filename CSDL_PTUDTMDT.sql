CREATE DATABASE ptudtmdt;
USE ptudtmdt;
-- Tạo bảng Tài khoản (check)
CREATE TABLE TaiKhoan (
    MaTaiKhoan VARCHAR(50) PRIMARY KEY,
    TenTaiKhoan NVARCHAR(50),
    MatKhau VARCHAR(50),
    SoDienThoai VARCHAR(20),
    Email VARCHAR(50),
    VaiTro VARCHAR(50),
    NgayTaoTK DATETIME,
    LanCuoiTruyCap DATETIME,
    TinhTrangTK BIT,
    MaKhachHang VARCHAR(50)
); 
-- Tạo bảng địa chỉ (check)
CREATE TABLE DiaChi (
    MaDiaChi VARCHAR(50) PRIMARY KEY,
    TenDiaChi NVARCHAR(100),
    ViTriNha NVARCHAR(100),
    ChuanHoaURL VARCHAR(255),
    TheLoai NVARCHAR(50)
); 
-- Tạo bảng Giao Hàng (check)
CREATE TABLE GiaoHang (
    MaGiaoHang VARCHAR(50) PRIMARY KEY,
    TenShipper NVARCHAR(100),
    CongTyGiaoHang NVARCHAR(100),
    SDT VARCHAR(20)
); 
-- Tạo bảng Đơn Hàng(check)
CREATE TABLE DonHang ( 
	MaDonHang VARCHAR(50) PRIMARY KEY,
	MaGiamGia VARCHAR(50),
	MaTaiKhoan VARCHAR(50),
    MaGiaoHang VARCHAR(50),
    NgayLenDon DATETIME,
    NgayGiaoHang DATETIME,
    TrangThai NVARCHAR(50),
    TTThanhToan BIT,
    TongTien FLOAT,
    MaPTTT VARCHAR(50),
    NgayThanhToan DATETIME,
    DiaChi NVARCHAR(100),
    GhiChu TEXT
);

-- Tạo bảng khách hàng (check)
CREATE TABLE KhachHang (
    MaKhachHang VARCHAR(50) PRIMARY KEY,
    HoTen NVARCHAR(100),
    GioiTinh BIT,
    Email VARCHAR(50),
    SoDienThoai VARCHAR(20),
    MaDiaChi VARCHAR(50),
    NgaySinh DATE,
    Hinh VARCHAR(50),
    HieuLuc BIT,
    QuanHuyen NVARCHAR(50),
    PhuongXa NVARCHAR(50)
); 
-- Tạo bảng Phương thức thanh toán (check)
CREATE TABLE PhuongThucThanhToan (
    MaPTTT VARCHAR(50) PRIMARY KEY,
    TenPTTT NVARCHAR(100),
    NoiDung NVARCHAR(100)
); 
-- Tạo bảng Chi tiết đơn hàng (check)
CREATE TABLE ChiTietDonHang (
    MaCTDH VARCHAR(50) PRIMARY KEY,
    MaDonHang VARCHAR(50),
    MaSanPham VARCHAR(50),
    SoLuong INT,
    GiaSanPham FLOAT,
    TongTienSP FLOAT,
    NgayTaoDon DATETIME
); 
-- Tạo bảng Đánh giá sản phẩm (check)
CREATE TABLE DanhGiaSanPham (
    MaDanhGia VARCHAR(50) PRIMARY KEY,
    MaTaiKhoan VARCHAR(50),
    MaSanPham VARCHAR(50),
    SaoDanhGia INT,
    LoiDanhGia NVARCHAR(255)
); 
-- Tạo bảng Giảm giá (check)
CREATE TABLE GiamGia (
    MaGiamGia VARCHAR(50) PRIMARY KEY,
    TenMa NVARCHAR(100),
    GiaTri FLOAT,
    NgayBatDau DATETIME,
    NgayKetThuc DATETIME,
    SoLuong INT,
    TrangThai BIT
); 
-- Tạo bảng Sản phẩm (check)
CREATE TABLE SanPham (
    MaSanPham VARCHAR(50) PRIMARY KEY,
    TenSanPham NVARCHAR(100),
    MaLoai VARCHAR(50),
    GiaSanPham FLOAT,
    GiamGia FLOAT,
    GiaSauGiam FLOAT,
    ShortDesc NVARCHAR(max),
    BestSellers BIT,
    TinhTrang BIT,
    SLTonKho INT,
    HomeFlag BIT,
    MoTa NVARCHAR(max),
    Hinh1 VARCHAR(50),
    Hinh2 VARCHAR(50),
    NgaySanXuat DATETIME,
    HanSuDung DATETIME,
    Alias VARCHAR(100)
); 
-- Tạo bảng Loại sản phẩm (check)
CREATE TABLE LoaiSanPham (
    MaLoai VARCHAR(50) PRIMARY KEY,
    TenLoai NVARCHAR(100),
    MoTa NVARCHAR(100),
    Hinh VARCHAR(50),
    Alias VARCHAR(100)
); 
-- Tạo bảng Từ khóa (check)
CREATE TABLE TuKhoa (
    MaTuKhoa VARCHAR(50) PRIMARY KEY,
    TenTuKhoa NVARCHAR(100)
); 
-- Tạo bảng Chi tiết từ khóa (check)
CREATE TABLE ChiTietTuKhoa (
    MaTuKhoa VARCHAR(50),
    MaSanPham VARCHAR(50),
    PRIMARY KEY (MaTuKhoa, MaSanPham) -- Khóa chính ghép
); 
-- Tạo bảng Trang viết
CREATE TABLE TrangViet (
    MaTrangViet VARCHAR(50) PRIMARY KEY,
    TenTrangViet NVARCHAR(100),
    NoiDung NVARCHAR(MAX),
    Thumb VARCHAR(255),
    ThoiGianDang DATETIME,
    TieuDe NVARCHAR(255),
    TuKhoa VARCHAR(255),
    Alias VARCHAR(255),
    URL VARCHAR(255)
);
-- Tạo bảng Trang web
CREATE TABLE TrangWeb (
    MaTrangWeb VARCHAR(50) PRIMARY KEY,
    TenTrangWeb NVARCHAR(255),
    URL VARCHAR(255)
);

-- Thêm dữ liệu vào
INSERT INTO chitietdonhang (MaCTDH,MaDonHang,MaSanPham,SoLuong,GiaSanPham,TongTienSP,NgayTaoDon) VALUES
	 ('CTDH001','DH001','NUT001',2,135000.0,270000.0,'2024-11-20 00:00:00'),
	 ('CTDH002','DH001','JUICE002',1,40500.0,40500.0,'2024-11-20 00:00:00'),
	 ('CTDH003','DH002','GRAIN004',1,76500.0,76500.0,'2024-11-21 00:00:00'),
	 ('CTDH004','DH002','NUT003',3,114000.0,342000.0,'2024-11-21 00:00:00'),
	 ('CTDH005','DH003','FRUIT005',1,55000.0,55000.0,'2024-11-20 00:00:00'),
	 ('CTDH006','DH003','JUICE003',2,40000.0,80000.0,'2024-11-20 00:00:00'),
	 ('CTDH007','DH004','FRUIT010',5,114000.0,570000.0,'2024-11-22 00:00:00'),
	 ('CTDH008','DH005','NUT002',3,170000.0,510000.0,'2024-11-23 00:00:00'),
	 ('CTDH009','DH005','JUICE007',1,63000.0,63000.0,'2024-11-23 00:00:00'),
	 ('CTDH010','DH006','JUICE008',4,47500.0,190000.0,'2024-11-21 00:00:00'),
	 ('CTDH011','DH006','FRUIT008',2,60000.0,120000.0,'2024-11-21 00:00:00'),
	 ('CTDH012','DH007','GRAIN008',2,102000.0,204000.0,'2024-11-22 00:00:00'),
	 ('CTDH013','DH007','JUICE005',3,51000.0,153000.0,'2024-11-22 00:00:00'),
	 ('CTDH014','DH008','FRUIT004',10,36000.0,360000.0,'2024-11-23 00:00:00'),
	 ('CTDH015','DH008','FRUIT006',2,76500.0,153000.0,'2024-11-23 00:00:00'),
	 ('CTDH016','DH009','JUICE002',3,54000.0,162000.0,'2024-11-24 00:00:00'),
	 ('CTDH017','DH009','FRUIT002',2,42750.0,85500.0,'2024-11-24 00:00:00'),
	 ('CTDH018','DH010','GRAIN006',2,70000.0,140000.0,'2024-11-22 00:00:00'),
	 ('CTDH019','DH010','SAUCE004',1,40000.0,40000.0,'2024-11-22 00:00:00'),
	 ('CTDH020','DH011','FRUIT003',4,30000.0,120000.0,'2024-11-24 00:00:00'),
	 ('CTDH021','DH011','FRUIT009',2,66500.0,133000.0,'2024-11-24 00:00:00'),
	 ('CTDH022','DH012','JUICE007',3,63000.0,189000.0,'2024-11-23 00:00:00'),
	 ('CTDH023','DH012','GRAIN010',3,99000.0,297000.0,'2024-11-23 00:00:00'),
	 ('CTDH024','DH013','GRAIN010',6,99000.0,594000.0,'2024-11-24 00:00:00'),
	 ('CTDH025','DH013','SAUCE001',2,54000.0,108000.0,'2024-11-24 00:00:00'),
	 ('CTDH026','DH014','FRUIT008',3,60000.0,180000.0,'2024-11-20 00:00:00'),
	 ('CTDH027','DH014','JUICE010',3,65000.0,195000.0,'2024-11-20 00:00:00'),
	 ('CTDH028','DH015','NUT004',2,81000.0,162000.0,'2024-11-21 00:00:00'),
	 ('CTDH029','DH015','JUICE006',1,45000.0,45000.0,'2024-11-21 00:00:00'),
	 ('CTDH030','DH015','FRUIT007',1,95000.0,95000.0,'2024-11-21 00:00:00'),
	 ('CTDH031','DH016','NUT005',2,200000.0,400000.0,'2024-11-25 00:00:00'),
	 ('CTDH032','DH016','JUICE006',1,45000.0,45000.0,'2024-11-25 00:00:00'),
	 ('CTDH033','DH017','GRAIN002',3,85500.0,256500.0,'2024-11-26 00:00:00'),
	 ('CTDH034','DH017','NUT009',4,99000.0,396000.0,'2024-11-26 00:00:00'),
	 ('CTDH035','DH018','FRUIT007',5,95000.0,475000.0,'2024-11-27 00:00:00'),
	 ('CTDH036','DH018','JUICE004',2,30000.0,60000.0,'2024-11-27 00:00:00'),
	 ('CTDH037','DH019','NUT006',3,255000.0,765000.0,'2024-11-28 00:00:00'),
	 ('CTDH038','DH019','GRAIN009',1,76000.0,76000.0,'2024-11-28 00:00:00'),
	 ('CTDH039','DH020','FRUIT010',4,114000.0,456000.0,'2024-11-29 00:00:00'),
	 ('CTDH040','DH020','SAUCE005',1,58500.0,58500.0,'2024-11-29 00:00:00');
	
INSERT INTO chitiettukhoa (MaTuKhoa,MaSanPham) VALUES
	 ('TK0001','NUT001'),
	 ('TK0001','NUT002'),
	 ('TK0001','NUT003'),
	 ('TK0001','NUT004'),
	 ('TK0001','NUT005'),
	 ('TK0001','NUT006'),
	 ('TK0001','NUT007'),
	 ('TK0001','NUT008'),
	 ('TK0001','NUT009'),
	 ('TK0001','NUT010'),
	 ('TK0002','NUT001'),
	 ('TK0003','NUT002'),
	 ('TK0004','NUT003'),
	 ('TK0005','NUT004'),
	 ('TK0006','NUT005'),
	 ('TK0007','NUT006'),
	 ('TK0008','NUT007'),
	 ('TK0009','NUT008'),
	 ('TK0010','NUT009'),
	 ('TK0011','NUT010'),
	 ('TK0012','JUICE002'),
	 ('TK0012','JUICE003'),
	 ('TK0012','JUICE004'),
	 ('TK0012','JUICE005'),
	 ('TK0012','JUICE006'),
	 ('TK0012','JUICE007'),
	 ('TK0012','JUICE008'),
	 ('TK0012','JUICE009'),
	 ('TK0012','JUICE010'),
	 ('TK0013','JUICE001'),
	 ('TK0014','JUICE002'),
	 ('TK0015','JUICE003'),
	 ('TK0016','JUICE004'),
	 ('TK0017','JUICE005'),
	 ('TK0018','JUICE006'),
	 ('TK0019','JUICE007'),
	 ('TK0020','JUICE008'),
	 ('TK0021','JUICE009'),
	 ('TK0022','JUICE010'),
	 ('TK0023','GRAIN001'),
	 ('TK0023','GRAIN002'),
	 ('TK0023','GRAIN003'),
	 ('TK0023','GRAIN004'),
	 ('TK0023','GRAIN005'),
	 ('TK0023','GRAIN006'),
	 ('TK0023','GRAIN007'),
	 ('TK0023','GRAIN008'),
	 ('TK0023','GRAIN009'),
	 ('TK0023','GRAIN010'),
	 ('TK0024','GRAIN001'),
	 ('TK0025','GRAIN002'),
	 ('TK0026','GRAIN003'),
	 ('TK0027','GRAIN004'),
	 ('TK0028','GRAIN008'),
	 ('TK0029','GRAIN009'),
	 ('TK0030','GRAIN010'),
	 ('TK0031','SAUCE001'),
	 ('TK0031','SAUCE002'),
	 ('TK0031','SAUCE003'),
	 ('TK0031','SAUCE004'),
	 ('TK0031','SAUCE005'),
	 ('TK0031','SAUCE006'),
	 ('TK0031','SAUCE007'),
	 ('TK0031','SAUCE008'),
	 ('TK0031','SAUCE009'),
	 ('TK0031','SAUCE010'),
	 ('TK0032','SAUCE001'),
	 ('TK0033','SAUCE002'),
	 ('TK0034','SAUCE003'),
	 ('TK0035','SAUCE004'),
	 ('TK0036','SAUCE005'),
	 ('TK0037','SAUCE006'),
	 ('TK0038','SAUCE007'),
	 ('TK0039','SAUCE008'),
	 ('TK0040','SAUCE009'),
	 ('TK0041','SAUCE010'),
	 ('TK0042','FRUIT001'),
	 ('TK0042','FRUIT002'),
	 ('TK0042','FRUIT003'),
	 ('TK0042','FRUIT004'),
	 ('TK0042','FRUIT005'),
	 ('TK0042','FRUIT006'),
	 ('TK0042','FRUIT007'),
	 ('TK0042','FRUIT008'),
	 ('TK0042','FRUIT009'),
	 ('TK0042','FRUIT010'),
	 ('TK0043','FRUIT003'),
	 ('TK0044','FRUIT007'),
	 ('TK0045','FRUIT008'),
	 ('TK0046','FRUIT010');
	 
INSERT INTO danhgiasanpham (MaDanhGia,MaTaiKhoan,MaSanPham,SaoDanhGia,LoiDanhGia) VALUES
	 ('RE0001','1','NUT001',5,N'Hạt giòn, béo, và thơm, ăn rất cuốn. Loại này mình hay dùng để ăn vặt hoặc thêm vào sữa chua, ngon và bổ dưỡng.'),
	 ('RE0002','1','JUICE002',5,N'hương vị đậm đà và thơm tự nhiên. Đặc biệt là không quá chua hay ngọt gắt, rất cân bằng'),
	 ('RE0003','1','GRAIN004',5,N'Lúa mạch nguyên cám nấu lên mềm, thơm và giữ được độ nguyên bản. Chất lượng tốt, xứng đáng với giá tiền'),
	 ('RE0004','1','NUT003',5,N'Hạt điều thơm béo, vị mặn vừa phải, shop đóng bọc zip rất tiện lợi, bạn nào kỹ có thể bỏ vào hộp kín để được lâu hơn, giao hàng nhanh'),
	 ('RE0005','2','FRUIT005',5,N'Xoài cát Hòa Lộc thơm ngọt, thịt dày và không bị xơ. Rất đáng tiền!"'),
	 ('RE0006','2','JUICE003',5,N'Nước ép cà rốt ngọt nhẹ tự nhiên, không bị gắt cổ'),
	 ('RE0007','3','FRUIT010',5,N'Đặt mua lần nào cũng nhận được nho tươi, đóng gói cẩn thận. Giao hàng đúng thời gian đã hẹn. Sẽ mua nhiều lần nữa ở shop'),
	 ('RE0008','4','NUT002',5,N'Hạt béo bùi, ngon nha mn. Mãi mới kiếm được 1 shop bán hạt mới và béo chuẩn như vậy 😂'),
	 ('RE0009','4','JUICE007',5,N'Vị rất dễ chịu, không bị quá ngọt hay chua. Rất tốt cho sức khỏe'),
	 ('RE0010','4','JUICE008',5,N'Hương vị dâu tây tự nhiên, chua nhẹ và ngọt vừa phải. Uống vào cực kỳ kích thích vị giác'),
	 ('RE0011','4','FRUIT008',5,N'Bơ sáp dẻo, béo và thơm đặc trưng. Rất phù hợp để làm sinh tố hay ăn trực tiếp. Giao đúng loại bơ như đã đặt, quả đều và chín tự nhiên'),
	 ('RE0012','5','GRAIN008',5,N'Hạt chia sạch, không bị dính tạp chất. Uống cùng nước hoặc pha sinh tố đều rất ngon'),
	 ('RE0013','5','JUICE005',5,N'Nước ép cần tây rất tươi, vị hơi nhẫn nhẹ nhưng dễ uống. Đóng gói sạch sẽ, giao hàng nhanh'),
	 ('RE0014','5','FRUIT004',5,N'Dưa hấu tươi, ngọt mát và không hạt, ăn rất tiện lợi. Gia đình mình ai cũng thích'),
	 ('RE0015','5','FRUIT006',5,N'Dâu được đóng trong hộp đẹp mắt, không bị dập, giao hàng nhanh. Mua tặng người thân ai cũng khen ngon'),
	 ('RE0016','6','JUICE002',5,N'Sản phẩm đóng gói đẹp người giao hàng nhiệt tình, hạt trông to, không bị hôi dầu ,shop làm ăn uy tín. khi nào ăn hết sẽ ủng hộ tiếp'),
	 ('RE0017','6','FRUIT002',5,N'Rất hài lòng với chất lượng cam hữu cơ, vừa tốt cho sức khỏe lại an toàn'),
	 ('RE0018','7','GRAIN006',5,N'Hạt kê vàng đẹp, không lẫn tạp chất. Nấu cháo rất ngon và thơm, cả nhà mình ai cũng thích'),
	 ('RE0019','7','SAUCE004',5,N'Gia vị rắc cơm cực tiện lợi, hương vị thơm ngon và hấp dẫn, nhất là với trẻ con'),
	 ('RE0020','7','FRUIT003',5,N'Chuối ngọt dịu, vỏ mỏng và không bị chín ép. Chất lượng rất tốt'),
	 ('RE0021','7','FRUIT009',5,N'Lựu đỏ hạt mẩy, vị ngọt dịu và thơm ngon. Dùng ép nước hay ăn trực tiếp đều rất đã'),
	 ('RE0022','8','JUICE007',5,N'Vị rất dễ chịu, không bị quá ngọt hay chua. Rất tốt cho sức khỏe'),
	 ('RE0023','8','GRAIN010',5,N'Hỗn hợp ngũ cốc rất đa dạng, trái cây khô không bị cứng quá. Rất tiện lợi cho bữa sáng hoặc ăn nhẹ'),
	 ('RE0024','8','GRAIN010',5,N'Đóng gói đẹp mắt, giao hàng cực nhanh. Nhân viên còn nhắn tin hỏi thăm chất lượng sản phẩm, rất chu đáo'),
	 ('RE0025','8','SAUCE001',5,N'Vị sốt mè rang rất thơm, béo nhẹ nhưng không ngấy. Dùng trộn salad hay chấm rau củ đều tuyệt vời'),
	 ('RE0026','9','FRUIT008',5,N'Quả bơ được chọn đều, chín tự nhiên, không hề bị hư. Giao hàng nhanh và đóng gói cẩn thận, rất hài lòng'),
	 ('RE0027','9','JUICE010',5,N'Mùi thơm của bưởi hồng rất dễ chịu, vị không quá chua nên rất dễ uống'),
	 ('RE0028','9','NUT004',5,N'Hạt bí xanh giòn, bùi và thơm, không bị ỉu hay có vị lạ. Rất thích hợp để ăn vặt hoặc thêm vào salad. Gói hàng cẩn thận, nhân viên nhiệt tình'),
	 ('RE0029','9','JUICE006',5,N'Hương vị dứa rất thật, ngọt nhưng không gắt. Sau khi uống cảm thấy cực kỳ sảng khoái và đầy năng lượng'),
	 ('RE0030','9','FRUIT007',5,N'Vị tươi mát, chất lượng, shop giao hàng nhanh'),
	 ('RE0031','10','NUT005',5,N'Giao hàng nhanh đóng gói cẩn thận và chất lượng thật sự bất ngờ luôn quá nhiều hạt luôn mà còn giá rẻ nữa ăn ngon nhất định mình sẽ quay lại mua nhiều lần'),
	 ('RE0032','10','JUICE006',5,N'Vị ngọt tự nhiên, thơm mùi dứa tươi, không bị chua gắt. Uống lạnh vào ngày nóng thì tuyệt vời'),
	 ('RE0033','10','GRAIN002',5,N'Đóng gói đẹp, túi zip dễ bảo quản. Chăm sóc khách hàng rất chu đáo, luôn hỏi ý kiến sau khi mua hàng'),
	 ('RE0034','10','NUT009',5,N'Hạt kê vàng rất sạch, đều hạt và thơm tự nhiên. Nấu cháo cho bé ăn rất mềm mịn, bé nhà mình rất thích'),
	 ('RE0035','11','FRUIT007',5,N'Kiwi ngọt thanh, mọng nước và không bị chua. Chất lượng chuẩn hàng nhập khẩu'),
	 ('RE0036','11','JUICE004',5,N'rất thích vì không bị quá ngọt, uống vào là cảm giác được sự thanh mát của dưa hấu tự nhiên'),
	 ('RE0037','11','NUT006',5,N'Sản phẩm đóng gói cẩn thận , giao hàng nhanh mình mới đặt hôm qua mà hôm nay đã giao đến chất lượng rất ok mình đã mua sản phẩm của shop rất nhiều lần mà lần nào cũng hài lòng'),
	 ('RE0038','11','GRAIN009',5,N'Hạt lanh thơm, khi xay ra rất mịn và dễ sử dụng. Chất lượng vượt ngoài mong đợi'),
	 ('RE0039','12','FRUIT010',5,N'Đặt mua lần nào cũng nhận được nho tươi, đóng gói cẩn thận. Giao hàng đúng thời gian đã hẹn. Sẽ mua nhiều lần nữa ở shop'),
	 ('RE0040','12','SAUCE005',5,N'Vị cay vừa phải, thơm đặc trưng kiểu Hàn Quốc. Dùng làm tokbokki hay chấm thịt nướng đều ngon');
	 
INSERT INTO diachi (MaDiaChi,TenDiaChi,ViTriNha,ChuanHoaURL,TheLoai) VALUES
	 ('1',N'28 Mạc Dĩnh Chi',N'Số 28, Mạc Đĩnh Chi, Q.1','https://maps.app.goo.gl/MnQKq9WyY8Wta5mT8',N'Nhà ở'),
	 ('2',N'45 Lê Thị Hồng',N'Số 45, Lê Thị Hồng, Q.3','https://maps.app.goo.gl/vUFWtH9FnCQywUwMA',N'Văn phòng'),
	 ('3',N'76 Trần Quang Khải',N'Số 76, Trần Quang Khải, Q.5','https://maps.app.goo.gl/1YxTgT93biLmwcNR7',N'Cửa hàng'),
	 ('4',N'89 Võ Thị Sáu',N'Số 89, Võ Thị Sáu, Q.3','https://maps.app.goo.gl/NKLq8XrtowHMFuP18',N'Nhà ở'),
	 ('5',N'150 Hoàng Hoa Thám',N'Số 150, Hoàng Hoa Thám, Q. Tân Bình','https://maps.app.goo.gl/LqWHLfurfi2rBTYv6',N'Văn phòng'),
	 ('6',N'32 Đinh Tiên Hoàng',N'Số 32, Đinh Tiên Hoàng, Q.1','https://maps.app.goo.gl/YNdsAkkgRHbvt6US9',N'Cửa hàng'),
	 ('7',N'10 Lý Thường Kiệt',N'Số 10, Lý Thường Kiệt, Q.11','https://maps.app.goo.gl/cbZZHwK9GnmcY8ED8',N'Nhà ở'),
	 ('8',N'55 Đoàn Văn Bơ',N'Số 55, Đoàn Văn Bơ, Q.4','https://maps.app.goo.gl/aWe4H6iQc5XFB7Ku9',N'Văn phòng'),
	 ('9',N'200 Nguyễn Chí Thanh',N'Số 200, Nguyễn Chí Thanh, Q.5','https://maps.app.goo.gl/oj2Feag2CT3YK9GV9',N'Nhà ở'),
	 ('10',N'120 Phan Đăng Lưu',N'Số 120, Phan Đăng Lưu, Q. Phú Nhuận','https://maps.app.goo.gl/wRzZnJ721YveDcxE9',N'Cửa hàng'),
	 ('11',N'250 Lê Đức Thọ',N'Số 250, Lê Đức Thọ, Q.Gò Vấp','https://maps.app.goo.gl/6q64Af49HCb27mJ27',N'Văn phòng'),
	 ('12',N'300 Nguyễn Thị Minh Khai',N'Số 300, Nguyễn Thị Minh Khai, Q.3','https://maps.app.goo.gl/zhzaxQHiLxnpdod76',N'Nhà ở'),
	 ('13',N'14 Nguyễn Trãi',N'Số 14, Nguyễn Trãi, Q.10','https://maps.app.goo.gl/LZ3RQD491FqcDSGZ9',N'Văn phòng'),
	 ('14',N'77 Cộng Hòa',N'Số 77, Cộng Hòa, Q.Tân Bình','https://maps.app.goo.gl/zDGbEoTJ2jNSe7dZA',N'Cửa hàng'),
	 ('15',N'36 Hoàng Văn Thụ',N'Số 36, Hoàng Văn Thụ, Q. Phú Nhuận','https://maps.app.goo.gl/j9s4yzR4N8oPLRjJA',N'Nhà ở'),
	 ('16',N'150 Nguyễn Ái Quốc',N'Số 150, Nguyễn Tri Phương, Q. 10','https://maps.app.goo.gl/ahAKLFCijPYba8p89',N'Văn phòng'),
	 ('17',N'80 Lê Lợi',N'Số 80, Lê Lợi, Q.Gò Vấp','https://maps.app.goo.gl/RhCU7Txzyi2sR5V79',N'Nhà ở'),
	 ('18',N'180 Trường Chinh',N'Số 180, Trường Chinh, Q.12','https://maps.app.goo.gl/kxx7yULzRL1D7GLLA',N'Cửa hàng'),
	 ('19',N'44 Bùi Thị Xuân',N'Số 44, Bùi Thị Xuân, Q.1','https://maps.app.goo.gl/fdEU33Bx6qdGjz8LA',N'Văn phòng'),
	 ('20',N'99 Nguyễn Văn Tại',N'Số 135, Trần Hưng Đạo, Q. 1','https://maps.app.goo.gl/jyru7fHWm3LhcFDg7',N'Nhà ở');
	 
INSERT INTO donhang (MaDonHang,MaGiamGia,MaTaiKhoan,MaGiaoHang,NgayLenDon,NgayGiaoHang,TrangThai,TTThanhToan,TongTien,MaPTTT,NgayThanhToan,DiaChi,GhiChu) VALUES
	 ('DH001','NEWUSER50','1','1','2024-11-20 00:00:00','2024-11-25 00:00:00',N'Đã xử lý',0,142500.0,'1','2024-11-20 00:00:00',N'Số 28, Mạc Đĩnh Chi, Q.1','-'),
	 ('DH002','BLACKFRIDAY','1','2','2024-11-21 00:00:00','2024-11-26 00:00:00',N'Đã xử lý',0,294000.0,'2','2024-11-21 00:00:00',N'Số 28, Mạc Đĩnh Chi, Q.1','-'),
	 ('DH003','NEWUSER50','2','3','2024-11-20 00:00:00','2024-11-25 00:00:00',N'Đã xử lý',0,97500.0,'3','2024-11-20 00:00:00',N'Số 45, Lê Thị Hồng, Q.3','-'),
	 ('DH004','NEWUSER50','3','4','2024-11-22 00:00:00','2024-11-27 00:00:00',N'Đang xử lý',1,240000.0,'4','2024-11-22 00:00:00',N'Số 76, Trần Quang Khải, Q.5','-'),
	 ('DH005','NEWUSER50','4','5','2024-11-23 00:00:00','2024-11-28 00:00:00',N'Đang xử lý',1,270000.0,'5','2024-11-23 00:00:00',N'Số 89, Võ Thị Sáu, Q.3','-'),
	 ('DH006','BLACKFRIDAY','4','6','2024-11-24 00:00:00','2024-11-29 00:00:00',N'Đang xử lý',1,166600.0,'1','2024-11-24 00:00:00',N'Số 89, Võ Thị Sáu, Q.3','-'),
	 ('DH007','NEWUSER50','5','7','2024-11-22 00:00:00','2024-11-27 00:00:00',N'Đã xử lý',0,178500.0,'2','2024-11-22 00:00:00',N'Số 150, Hoàng Hoa Thám, Q. Tân Bình','-'),
	 ('DH008','BLACKFRIDAY','5','8','2024-11-23 00:00:00','2024-11-28 00:00:00',N'Đang xử lý',1,295000.0,'3','2024-11-23 00:00:00',N'Số 150, Hoàng Hoa Thám, Q. Tân Bình','-'),
	 ('DH009','NEWUSER50','6','9','2024-11-24 00:00:00','2024-11-29 00:00:00',N'Đang xử lý',1,140000.0,'4','2024-11-24 00:00:00',N'Số 32, Đinh Tiên Hoàng, Q.1','-'),
	 ('DH010','BLACKFRIDAY','7','10','2024-11-22 00:00:00','2024-11-27 00:00:00',N'Đang xử lý',1,147000.0,'5','2024-11-22 00:00:00',N'Số 10, Lý Thường Kiệt, Q.11','-'),
	 ('DH011','NEWUSER50','7','11','2024-11-24 00:00:00','2024-11-29 00:00:00',N'Đã xử lý',0,193000.0,'1','2024-11-24 00:00:00',N'Số 10, Lý Thường Kiệt, Q.11','-'),
	 ('DH012','NEWUSER50','8','12','2024-11-25 00:00:00','2024-11-30 00:00:00',N'Đang xử lý',1,174500.0,'2','2024-11-25 00:00:00',N'Số 55, Cách Mạng Tháng 8, Q.10','-'),
	 ('DH013','BLACKFRIDAY','8','13','2024-11-26 00:00:00','2024-12-01 00:00:00',N'Đang xử lý',1,288400.0,'3','2024-11-26 00:00:00',N'Số 55, Cách Mạng Tháng 8, Q.10','-'),
	 ('DH014','NEWUSER50','9','14','2024-11-27 00:00:00','2024-12-02 00:00:00',N'Đang xử lý',1,250000.0,'4','2024-11-27 00:00:00',N'Số 99, Nguyễn Thái Học, Q. Bình Thạnh','-'),
	 ('DH015','BLACKFRIDAY','9','15','2024-11-28 00:00:00','2024-12-03 00:00:00',N'Đang xử lý',1,210000.0,'5','2024-11-28 00:00:00',N'Số 99, Nguyễn Thái Học, Q. Bình Thạnh','-'),
	 ('DH016','NEWUSER50','10','16','2024-11-29 00:00:00','2024-12-04 00:00:00',N'Đang xử lý',0,144500.0,'1','2024-11-29 00:00:00',N'Số 200, Hoàng Sa, Q.1','-'),
	 ('DH017','BLACKFRIDAY','10','17','2024-11-30 00:00:00','2024-12-05 00:00:00',N'Đang xử lý',1,245000.0,'2','2024-11-30 00:00:00',N'Số 200, Hoàng Sa, Q.1','-'),
	 ('DH018','NEWUSER50','11','18','2024-12-01 00:00:00','2024-12-06 00:00:00',N'Đang xử lý',1,157000.0,'3','2024-12-01 00:00:00',N'Số 12, Nguyễn Thị Minh Khai, Q.3','-'),
	 ('DH019','BLACKFRIDAY','11','19','2024-12-02 00:00:00','2024-12-07 00:00:00',N'Đang xử lý',1,182000.0,'4','2024-12-02 00:00:00',N'Số 12, Nguyễn Thị Minh Khai, Q.3','-'),
	 ('DH020','NEWUSER50','12','20','2024-12-03 00:00:00','2024-12-08 00:00:00',N'Đang xử lý',0,145000.0,'5','2024-12-03 00:00:00',N'Số 56, Trần Hưng Đạo, Q.5','-');
	 
INSERT INTO giamgia (MaGiamGia,TenMa,GiaTri,NgayBatDau,NgayKetThuc,SoLuong,TrangThai) VALUES
	 ('TET2025',N'Giảm giá Tết 2025',0.2,'2025-01-15 00:00:00','2025-01-25 00:00:00',100,0),
	 ('BLACKFRIDAY',N'Ưu đãi Black Friday',0.3,'2024-11-25 00:00:00','2024-11-30 00:00:00',200,1),
	 ('SUMMER10',N'Giảm giá mùa hè',0.1,'2024-06-01 00:00:00','2024-08-31 00:00:00',50,0),
	 ('NEWUSER50',N'Ưu đãi khách hàng mới',0.5,'2024-11-23 00:00:00','2024-12-31 00:00:00',500,1);
	 
INSERT INTO giaohang (MaGiaoHang,TenShipper,CongTyGiaoHang,SDT) VALUES
	 ('1',N'Nguyễn Mai Hoàng',N'Giao Hàng Nhanh','876812721'),
	 ('2',N'Trần Thị Bích Duyên',N'beDelivery','876812722'),
	 ('3',N'Lê Minh Tuấn',N'Viettel Post','876812723'),
	 ('4',N'Phạm Hồng Vân',N'Giao Hàng Tiết Kiệm','876812724'),
	 ('5',N'Hoàng Thị Lan',N'Giao Hàng Nhanh','876812725'),
	 ('6',N'Vũ Quốc Duy',N'beDelivery','876812726'),
	 ('7',N'Đỗ Mai Linh',N'Viettel Post','876812727'),
	 ('8',N'Nguyễn Thanh Hương',N'Giao Hàng Tiết Kiệm','876812728'),
	 ('9',N'Trương Anh Kiệt',N'Giao Hàng Nhanh','876812729'),
	 ('10',N'Phan Thảo My',N'Grab','876812730'),
	 ('11',N'Lê Kiên Cường',N'Viettel Post','876812731'),
	 ('12',N'Hồ Minh Tuấn',N'beDelivery','876812732'),
	 ('13',N'Bùi Thị Quỳnh',N'beDelivery','876812733'),
	 ('14',N'Đặng Văn Hòa',N'Grab','876812734'),
	 ('15',N'Trần Lý Thanh',N'Viettel Post','876812735'),
	 ('16',N'Phạm Thu Trang',N'beDelivery','876812736'),
	 ('17',N'Lê Duy Quang',N'Giao Hàng Nhanh','876812737'),
	 ('18',N'Nguyễn Lan Anh',N'Grab','876812738'),
	 ('19',N'Tạ Quang Huy',N'Viettel Post','876812739'),
	 ('20',N'Hoàng Lan Phương',N'beDelivery','876812740');
	 
INSERT INTO khachhang (MaKhachHang,HoTen,GioiTinh,Email,SoDienThoai,MaDiaChi,NgaySinh,Hinh,HieuLuc,QuanHuyen,PhuongXa) VALUES
	 ('1',N'Nguyễn Văn Anh',0,'nguyenvana@gmail.com','0981234567','1','1990-01-01','Vananh.jpg',0,N'Quận 2',N'Phường Thạnh Mỹ Lợi'),
	 ('2',N'Trần Thị Bé',1,'tranthib@gmail.com','0981234568','2','1985-03-15','ThiBe.jpg',1,N'Quận 1',N'Phường Đa Kao'),
	 ('3',N'Phạm Minh Cao',0,'phamminhc@gmail.com','0981234569','3','1980-07-22','Minhcao.jpg',0,N'Quận 3',N'Phường 9'),
	 ('4',N'Lê Hoàng Diệp',0,'lehoangd@gmail.com','0981234570','4','1995-05-12','HongKien.jpg',0,N'Quận 4',N'Phường 16'),
	 ('5',N'Nguyễn Thị Em',1,'nguyencthe@gmail.com','0981234571','5','2000-09-30','ThiEm.jpg',1,N'Quận Phú Nhuận',N'Phường 10'),
	 ('6',N'Vũ Hồng Kiện',0,'vuhongf@gmail.com','0981234572','6','1987-11-25','HongKien.jpg',1,N'Quận 6',N'Phường 12'),
	 ('7',N'Đỗ Kim Giao',0,'dokimg@gmail.com','0981234573','7','1992-04-14','KimGiao.jpg',0,N'Quận 7',N'Phường Tân Phú'),
	 ('8',N'Hoàng Lan Hoa',1,'hoanglanh@gmail.com','0981234574','8','1998-06-18','LanHoa.jpg',0,N'Quận 8',N'Phường 3'),
	 ('9',N'Lê Thanh Hoà',0,'lethanyi@gmail.com','0981234575','9','1986-12-02','ThanhHoa.jpg',1,N'Quận 3',N'Phường Võ Thị Sáu'),
	 ('10',N'Phan Minh Quang',1,'phanminhj@gmail.com','0981234576','10','1993-02-28','minhquang.jpg',0,N'Quận 10',N'Phường 7'),
	 ('11',N'Nguyễn Kim Phượng',0,'nguyenkimk@gmail.com','0981234577','11','1997-08-10','KimPhuong.jpg',1,N'Quận 11',N'Phường 14'),
	 ('12',N'Trần Văn Ơn',0,'tranvanl@gmail.com','0981234578','12','1984-01-30','VanOn.jpg',1,N'Quận 12',N'Phường Hiệp Thành'),
	 ('13',N'Lê Thị Mơ',1,'lethim@gmail.com','0981234579','13','1990-11-05','ThiMo.jpg',1,N'Quận Tân Bình',N'Phường 12'),
	 ('14',N'Vũ Đức Thịnh',0,'vuducn@gmail.com','0981234580','14','1996-07-14','dinhtien.jpg',1,N'Quận Tân Phú',N'Phường 1'),
	 ('15',N'Đỗ Thị Hoa',1,'dothio@gmail.com','0981234581','15','1989-04-21','Vananh.jpg',1,N'Quận Bình Thạnh',N'Phường 12'),
	 ('16',N'Hoàng Văn Phang',0,'hoangvanp@gmail.com','0981234582','16','1994-09-18','vanphang.jpg',0,N'Quận Bình Tân',N'Phường Tân Tạo A'),
	 ('17',N'Phan Thị Quành',1,'phanthiq@gmail.com','0981234583','17','1991-05-07','ThiBe.jpg',1,N'Quận Gò Vấp',N'Phường 6'),
	 ('18',N'Lê Đức Trọng',0,'leducr@gmail.com','0981234584','18','1993-10-13','hongson.jpg',1,N'Quận Phú Nhuận',N'Phường 5'),
	 ('19',N'Trương Hồng Sơn',1,'truonghongs@gmail.com','0981234585','19','1982-02-22','HongKien.jpg',1,N'Quận 7',N'Phường Tân Hưng'),
	 ('20',N'Nguyễn Thái Thịnh',0,'nguyenhtai@gmail.com','0981234586','20','1988-12-25','ThiEm.jpg',1,N'Quận 8',N'Phường 4');
	 
INSERT INTO loaisanpham (MaLoai,TenLoai,MoTa,Hinh,Alias) VALUES
	 ('NUT',N'Hạt dinh dưỡng',N'Các loại hạt hữu cơ như hạnh nhân, óc chó, và hạt chia, cung cấp nguồn dinh dưỡng dồi dào.','01.jpg','hat-dinh-duong'),
	 ('JUICE',N'Nước ép organic',N'Nước ép từ trái cây tươi sạch, không thêm đường và chất bảo quản.','02.jpg','nuoc-ep-organic'),
	 ('GRAIN',N'Ngũ cốc nguyên cám',N'Ngũ cốc organic như yến mạch, gạo lứt, và lúa mì, tốt cho sức khỏe và hỗ trợ tiêu hóa.','03.jpg','ngu-coc-nguyen-cam'),
	 ('SAUCE',N'Sốt và gia vị',N'Các loại sốt và gia vị hữu cơ như tương cà, tương ớt, và dầu ô liu organic.','04.jpg','sot-va-gia-vi'),
	 ('FRUIT',N'Trái cây',N'Các loại trái cây hữu cơ tươi sạch, được chọn lọc kỹ lưỡng để đảm bảo chất lượng.','05.jpg','trai-cay');
	 
INSERT INTO phuongthucthanhtoan (MaPTTT,TenPTTT,NoiDung) VALUES
	 ('1',N'Thẻ tín dụng',N'Thanh toán bằng thẻ tín dụng Visa, MasterCard.'),
	 ('2',N'Ví Momo',N'Thanh toán qua ví điện tử Momo.'),
	 ('3',N'Chuyển khoản ngân hàng',N'Thanh toán trực tiếp qua tài khoản ngân hàng.'),
	 ('4',N'Thanh toán khi nhận hàng',N'Thanh toán bằng tiền mặt khi nhận hàng.'),
	 ('5',N'VNPay',N'Thanh toán qua cổng thanh toán VNPay.');
	 
INSERT INTO sanpham (MaSanPham,TenSanPham,MaLoai,GiaSanPham,GiamGia,GiaSauGiam,ShortDesc,BestSellers,TinhTrang,SLTonKho,HomeFlag,MoTa,Hinh1,Hinh2,NgaySanXuat,HanSuDung,Alias) VALUES
	 ('NUT001',N'Hạt hạnh nhân Mỹ','NUT',150000.0,10.0,135000.0,N'Hạnh nhân giàu dưỡng chất tự nhiên',1,1,100,1,N'Thành phần: 100% hạt hạnh nhân nguyên chất từ Mỹ, chứa nhiều vitamin E, magiê, chất xơ và protein. Hạt hạnh nhân là nguồn cung cấp chất béo lành mạnh, tốt cho sức khỏe tim mạch và làn da.
- Hướng dẫn sử dụng: Ăn trực tiếp như một món snack bổ dưỡng, hoặc có thể xay thành bột để làm sinh tố, bánh ngọt, hoặc salad. Hạt hạnh nhân cũng có thể làm topping cho sữa chua, cháo, hoặc kết hợp với các món ăn khác như ngũ cốc hoặc món xào.','almond1.png','almond2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','hat-hanh-nhan-my'),
	 ('NUT002',N'Hạt óc chó California','NUT',200000.0,15.0,170000.0,N'Óc chó nguyên vỏ thơm ngon',0,1,80,0,N'Thành phần: 100% hạt óc chó nhập khẩu từ California, giàu axit béo omega-3, vitamin E, protein và chất xơ. Hạt óc chó có tác dụng giảm cholesterol, bảo vệ tim mạch và cải thiện chức năng não bộ.
- Hướng dẫn sử dụng: Ăn trực tiếp, hoặc sử dụng trong các món tráng miệng, bánh ngọt, muesli, hoặc sinh tố. Có thể thêm vào salad hoặc các món ăn như xào, nướng. Hạt óc chó cũng là nguyên liệu tuyệt vời cho món bánh quy, bánh muffin hoặc các món nướng khác.','walnut1.png','walnut2.png','2024-11-02 00:00:00','2025-05-02 00:00:00','hat-oc-cho'),
	 ('NUT003',N'Hạt điều rang muối','NUT',120000.0,5.0,114000.0,N'Điều rang muối thơm bùi tự nhiên',1,1,150,1,N'Thành phần: 100% hạt điều rang muối, giàu vitamin E, magnesium, chất xơ và khoáng chất thiết yếu. Hạt điều có tác dụng giúp giảm cholesterol xấu, tốt cho hệ tim mạch và cải thiện sức khỏe da.
- Hướng dẫn sử dụng: Ăn trực tiếp như một món snack, hoặc sử dụng trong các món salad, bánh ngọt, tráng miệng hoặc các món xào, nướng. Cũng có thể dùng trong các món ăn nhanh, sandwich, hoặc mix với các loại hạt khác.','cashew1.png','cashew2.png','2024-11-03 00:00:00','2025-05-03 00:00:00','hat-dieu-rang'),
	 ('NUT004',N'Hạt bí xanh sấy khô','NUT',90000.0,10.0,81000.0,N'Hạt bí xanh nguyên vị',0,1,200,0,N'Thành phần: 100% hạt bí xanh nguyên chất, được sấy khô, chứa nhiều vitamin A, magiê, kẽm, và chất xơ. Hạt bí là nguồn cung cấp chất béo lành mạnh, giúp giảm nguy cơ mắc bệnh tim mạch và cải thiện giấc ngủ.
- Hướng dẫn sử dụng: Ăn trực tiếp, hoặc có thể thêm vào món salad, sinh tố, các món ngũ cốc, cháo, hoặc làm topping cho các món ăn như sữa chua, bánh mì. Hạt bí cũng có thể nấu với cơm hoặc kết hợp với các món xào, nướng.','pumpkin1.png','pumpkin2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','hat-bi-xanh'),
	 ('NUT005',N'Hạt dẻ cười nhập khẩu','NUT',250000.0,20.0,200000.0,N'Hạt dẻ cười xanh thơm béo',0,1,70,0,N'Thành phần: 100% hạt dẻ cười nhập khẩu, chứa vitamin E, chất béo không bão hòa, protein và khoáng chất. Hạt dẻ cười có tác dụng cải thiện sức khỏe tim mạch, giảm nguy cơ mắc bệnh tiểu đường và hỗ trợ giảm cân.
- Hướng dẫn sử dụng: Ăn trực tiếp như một món snack, hoặc có thể sử dụng trong các món salad, bánh ngọt, món tráng miệng, hoặc kết hợp với các món ăn khác. Hạt dẻ cười cũng có thể thêm vào các món nướng, bánh kẹo hoặc làm topping cho các món tráng miệng.','pistachio1.png','pistachio2.png','2024-11-04 00:00:00','2025-05-04 00:00:00','hat-de-cuoi'),
	 ('NUT006',N'Hạt mắc ca Úc','NUT',300000.0,15.0,255000.0,N'Hạt mắc ca cao cấp Úc',0,1,90,0,N'Thành phần: 100% hạt mắc ca nguyên chất, chứa axit béo không bão hòa, vitamin A, B, C và khoáng chất như magiê, canxi. Hạt mắc ca giúp cải thiện sức khỏe tim mạch, tăng cường miễn dịch và tốt cho da.
- Hướng dẫn sử dụng: Ăn trực tiếp như một món snack, hoặc có thể thêm vào các món salad, bánh ngọt, sinh tố. Hạt mắc ca cũng có thể dùng trong các món ăn như xào, nướng, hoặc làm topping cho các món ăn khác như cháo, sữa chua, bánh mì.','macadamia1.png','macadamia2.png','2024-11-05 00:00:00','2025-05-05 00:00:00','hat-mac-ca'),
	 ('NUT007',N'Hạt chia hữu cơ','NUT',100000.0,10.0,90000.0,N'Hạt chia giàu chất xơ và omega-3',1,1,120,1,N'Thành phần: 100% hạt chia hữu cơ, giàu axit omega-3, chất xơ và protein. Hạt chia có tác dụng giúp giảm cholesterol xấu, duy trì sức khỏe tim mạch và hỗ trợ giảm cân.
- Hướng dẫn sử dụng: Ngâm hạt chia trong nước hoặc sữa để làm pudding, hoặc thêm vào sinh tố, nước trái cây, hoặc dùng làm topping cho các món bánh, salad, hoặc sữa chua. Hạt chia cũng có thể rắc lên bánh mì, cháo hoặc trộn với các món ngũ cốc.','chia1.png','chia2.png','2024-11-01 00:00:00','2025-11-01 00:00:00','hat-chia'),
	 ('NUT008',N'Hạt dẻ rang thơm','NUT',80000.0,0.0,80000.0,N'Dẻ thơm ngon, giữ nguyên vị',0,1,50,0,N'Thành phần: 100% hạt dẻ rang, chứa nhiều vitamin C, sắt và protein. Hạt dẻ là nguồn cung cấp năng lượng tuyệt vời và có tác dụng tốt cho hệ thần kinh và tim mạch.
- Hướng dẫn sử dụng: Ăn trực tiếp như một món snack, hoặc có thể thêm vào các món ăn, bánh ngọt, hoặc làm topping cho salad. Hạt dẻ cũng có thể chế biến thành các món xào, nướng, hoặc trộn với ngũ cốc, làm nguyên liệu cho các món tráng miệng như kem, bánh tart.','chestnut1.png','chestnut2.png','2024-10-01 00:00:00','2025-03-01 00:00:00','hat-de-rang'),
	 ('NUT009',N'Hạt kê vàng organic','NUT',110000.0,10.0,99000.0,N'Kê vàng giàu dinh dưỡng',0,1,60,0,N'Thành phần: 100% hạt kê vàng organic, giàu protein, vitamin B, khoáng chất như magiê và sắt. Hạt kê có tác dụng hỗ trợ tiêu hóa, tăng cường sức khỏe tim mạch và giúp duy trì cân nặng.
- Hướng dẫn sử dụng: Ăn trực tiếp, hoặc có thể nấu cháo, thêm vào sinh tố, hoặc làm thành các món ngũ cốc, bánh mì, bánh ngọt. Hạt kê cũng có thể dùng để làm bột mì, hoặc kết hợp với các món ăn khác như salad, súp, cơm, hoặc bánh ngọt.','millet1.png','millet2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','hat-ke-vang'),
	 ('NUT010',N'Hạt hướng dương Mỹ','NUT',50000.0,0.0,50000.0,N'Hướng dương không tẩm vị',1,1,100,1,N'Thành phần: 100% hạt hướng dương, chứa nhiều vitamin E, axit folic, chất xơ và khoáng chất như kẽm và magiê. Hạt hướng dương giúp tăng cường hệ miễn dịch, hỗ trợ giảm nguy cơ bệnh tim mạch và cải thiện làn da.
- Hướng dẫn sử dụng: Ăn trực tiếp hoặc thêm vào các món salad, sinh tố, muesli, hoặc làm topping cho bánh ngọt, sữa chua. Cũng có thể xay thành bột để làm nguyên liệu nấu ăn, trộn với các loại hạt khác trong món snack, hoặc dùng để làm món xào, nướng.','sunflower1.png','sunflower2.png','2024-11-05 00:00:00','2025-05-05 00:00:00','hat-huong-duong'),
	 ('JUICE001',N'Nước ép táo tươi','JUICE',50000.0,5.0,47500.0,N'Nước ép táo tươi, không chất bảo quản',1,1,200,1,N'Thành phần: Táo tươi nhập khẩu từ các nông trại đạt chuẩn hữu cơ, được rửa sạch và ép lạnh để giữ trọn dưỡng chất. Nước ép giàu vitamin C, chất xơ hòa tan và các chất chống oxy hóa như quercetin, hỗ trợ tăng cường miễn dịch và sức khỏe tim mạch. Không thêm đường, phẩm màu hoặc chất bảo quản.
- Hướng dẫn sử dụng: Lắc đều trước khi uống. Uống ngon nhất khi lạnh. Có thể dùng vào bữa sáng, kèm với bánh mì hoặc ngũ cốc để tăng năng lượng cho ngày mới.','apple1.png','apple2.png','2024-11-01 00:00:00','2024-11-15 00:00:00','nuoc-ep-tao'),
	 ('JUICE002',N'Nước ép cam sành hữu cơ','JUICE',45000.0,10.0,40500.0,N'Nước ép cam tươi, vị ngọt thanh',0,1,180,0,N'Thành phần: Cam sành được trồng theo phương pháp hữu cơ, không sử dụng thuốc trừ sâu hay phân bón hóa học. Ép lấy nước nguyên chất, giữ lại hàm lượng cao vitamin C, axit folic và kali, giúp làm đẹp da, tăng đề kháng và cân bằng huyết áp. Không chứa đường hay phụ gia.
- Hướng dẫn sử dụng: Thích hợp uống sau khi vận động hoặc buổi sáng để khởi đầu ngày mới. Có thể pha thêm mật ong hoặc làm nguyên liệu pha chế nước trái cây hỗn hợp.','orange1.png','orange2.png','2024-11-02 00:00:00','2024-11-16 00:00:00','nuoc-ep-cam-sanh'),
	 ('JUICE003',N'Nước ép cà rốt ngọt','JUICE',40000.0,0.0,40000.0,N'Cà rốt organic, giàu vitamin A',1,1,150,1,N'Thành phần: Cà rốt tươi, được tuyển chọn từ các vùng trồng sạch, ép nguyên chất để bảo toàn beta-carotene, vitamin A, K, và chất xơ. Cà rốt cung cấp năng lượng lành mạnh, hỗ trợ sức khỏe mắt và tăng cường hệ miễn dịch. Không chứa chất bảo quản.
- Hướng dẫn sử dụng: Uống trực tiếp hoặc kết hợp với nước ép táo/cam để cân bằng vị ngọt. Phù hợp làm thức uống dinh dưỡng cho trẻ em hoặc người lớn tuổi.','carrot1.png','carrot2.png','2024-11-01 00:00:00','2024-11-12 00:00:00','nuoc-ep-ca-rot'),
	 ('JUICE004',N'Nước ép dưa hấu mát lạnh','JUICE',30000.0,0.0,30000.0,N'Dưa hấu không hạt, vị thanh mát',1,1,100,1,N'Thành phần: 100% dưa hấu tươi từ các trang trại địa phương, được chọn lọc để có độ chín mọng và vị ngọt tự nhiên. Dưa hấu chứa lycopene, vitamin A và C, hỗ trợ chống oxy hóa và cấp nước cho cơ thể. Không thêm nước, đường hoặc phẩm màu.
- Hướng dẫn sử dụng: Dùng tốt nhất khi lạnh, có thể thêm đá hoặc lá bạc hà để tăng hương vị. Thích hợp cho các bữa tiệc ngoài trời hoặc làm nền cho cocktail mùa hè.','watermelon1.png','watermelon2.png','2024-11-01 00:00:00','2024-11-10 00:00:00','nuoc-ep-dua-hau'),
	 ('JUICE005',N'Nước ép cần tây detox','JUICE',60000.0,15.0,51000.0,N'Nước ép cần tây giảm cân hiệu quả',1,1,90,1,N'Thành phần: Cần tây tươi 100% không hóa chất, giàu chất xơ, vitamin K, kali và chất chống oxy hóa tự nhiên như apigenin và luteolin. Cần tây giúp thanh lọc cơ thể, giảm viêm và cải thiện tiêu hóa. Không chứa chất tạo màu hoặc bảo quản.
- Hướng dẫn sử dụng: Uống vào buổi sáng khi bụng đói để tăng hiệu quả detox. Có thể pha thêm nước chanh hoặc táo để giảm độ hăng, phù hợp với người mới sử dụng cần tây.','celery1.png','celery2.png','2024-11-02 00:00:00','2024-11-14 00:00:00','nuoc-ep-can-tay'),
	 ('JUICE006',N'Nước ép dứa ngọt','JUICE',45000.0,0.0,45000.0,N'Dứa organic, vị ngọt dịu tự nhiên',0,1,120,0,N'Thành phần: Dứa tươi được hái chín, ép nguyên chất để giữ trọn bromelain (enzyme tự nhiên giúp tiêu hóa protein), vitamin C, và các khoáng chất cần thiết. Dứa có vị ngọt tự nhiên, không cần thêm đường hay chất bảo quản.
- Hướng dẫn sử dụng: Dùng tốt nhất sau bữa ăn để hỗ trợ tiêu hóa. Có thể làm sinh tố nhiệt đới hoặc kết hợp với nước ép cam để tạo thức uống đặc biệt.','pineapple1.png','pineapple2.png','2024-11-02 00:00:00','2024-11-16 00:00:00','nuoc-ep-dua'),
	 ('JUICE007',N'Nước ép lựu đỏ bổ dưỡng','JUICE',70000.0,10.0,63000.0,N'Lựu organic giàu chất chống oxy hóa',1,1,70,1,N'Thành phần: Lựu đỏ tươi nguyên quả, giàu polyphenol, vitamin L:L, vitamin K và các chất chống oxy hóa mạnh mẽ. Lựu giúp hỗ trợ sức khỏe tim mạch, giảm viêm và ngăn ngừa lão hóa da. Nước ép không chứa đường hay hóa chất.
- Hướng dẫn sử dụng: Uống trực tiếp để tận hưởng lợi ích sức khỏe tối đa. Có thể pha loãng hoặc thêm đá nếu cần. Thích hợp dùng trong các bữa tiệc gia đình hoặc làm quà tặng sức khỏe.','pomegranate1.png','pomegranate2.png','2024-11-03 00:00:00','2024-11-15 00:00:00','nuoc-ep-luu'),
	 ('JUICE008',N'Nước ép dâu tây chua ngọt','JUICE',50000.0,5.0,47500.0,N'Dâu tây tươi, ngọt thanh',0,1,100,0,N'Thành phần: Dâu tây tươi hữu cơ, được rửa sạch và ép lạnh để bảo toàn hàm lượng vitamin C, mangan, chất chống oxy hóa như anthocyanin. Không thêm đường, hương liệu nhân tạo hoặc phẩm màu.
- Hướng dẫn sử dụng: Dùng tốt nhất khi lạnh. Có thể pha chế thành sinh tố hoặc dùng làm nước sốt cho các món tráng miệng. Phù hợp với người yêu thích hương vị chua ngọt tự nhiên.','strawberry1.png','strawberry2.png','2024-11-01 00:00:00','2024-11-12 00:00:00','nuoc-ep-dau-tay'),
	 ('JUICE009',N'Nước ép xoài nhiệt đới','JUICE',55000.0,10.0,49500.0,N'Xoài cát Hòa Lộc, vị ngọt thơm',1,1,80,1,N'Thành phần: Xoài chín vàng tự nhiên, ép nguyên chất để giữ trọn vị ngọt đậm đà và hương thơm nhiệt đới. Giàu vitamin A, C và chất xơ hòa tan, tốt cho hệ tiêu hóa và làm đẹp da. Không chứa phẩm màu hay chất bảo quản.
- Hướng dẫn sử dụng: Dùng trực tiếp hoặc pha cùng sữa tươi để làm sinh tố. Phù hợp làm thức uống bổ dưỡng trong mùa hè hoặc khi cần tăng năng lượng.','mango1.png','mango2.png','2024-11-03 00:00:00','2024-11-17 00:00:00','nuoc-ep-xoai'),
	 ('JUICE010',N'Nước ép bưởi hồng','JUICE',65000.0,0.0,65000.0,N'Bưởi hồng hữu cơ, giúp detox',1,1,110,1,N'Thành phần: Bưởi hồng tươi, ép lấy nước giữ lại vị chua ngọt thanh mát. Bưởi hồng chứa vitamin C, lycopene và chất chống oxy hóa hỗ trợ giảm cân và tăng cường miễn dịch. Không thêm đường hay chất bảo quản.
- Hướng dẫn sử dụng: Uống trực tiếp trước bữa ăn để hỗ trợ giảm cân hoặc pha thêm nước chanh mật ong để tăng hương vị. Thích hợp làm thức uống dinh dưỡng hàng ngày.','grapefruit1.png','grapefruit2.png','2024-11-01 00:00:00','2024-11-14 00:00:00','nuoc-ep-buoi-hong'),
	 ('GRAIN001',N'Ngũ cốc yến mạch','GRAIN',80000.0,10.0,72000.0,N'Yến mạch hữu cơ, không phụ gia',0,1,100,0,N'Thành phần: 100% yến mạch nguyên chất từ vùng trồng sạch đạt tiêu chuẩn quốc tế. Chứa hàm lượng cao beta-glucan, protein, chất xơ hòa tan, vitamin nhóm B và khoáng chất như sắt, magiê, kẽm. Hỗ trợ giảm cholesterol, kiểm soát đường huyết và thúc đẩy cảm giác no lâu.
- Hướng dẫn sử dụng: Nấu cháo yến mạch cùng nước hoặc sữa, thêm mật ong, trái cây tươi hoặc các loại hạt. Cũng có thể dùng làm nguyên liệu trong bánh ngọt, bánh mì hoặc sinh tố để tăng giá trị dinh dưỡng.','oats1.png','oats2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','ngu-coc-yen-mach'),
	 ('GRAIN002',N'Ngũ cốc nguyên cám trộn','GRAIN',90000.0,5.0,85500.0,N'Hỗn hợp ngũ cốc nguyên cám tiện lợi',0,1,80,0,N'Thành phần: Hỗn hợp từ yến mạch nguyên cám, lúa mì, lúa mạch đen, hạt óc chó, hạnh nhân và hạt bí. Cung cấp lượng lớn chất xơ không hòa tan, vitamin E, magiê và protein. Sản phẩm giàu năng lượng, hỗ trợ hệ tiêu hóa và cung cấp nguồn dinh dưỡng lâu dài.
- Hướng dẫn sử dụng: Pha với sữa nóng, sữa chua hoặc nước trái cây. Có thể trộn thêm mật ong, trái cây khô hoặc nấu cùng súp, cháo. Phù hợp làm bữa sáng tiện lợi hoặc bữa phụ nhẹ nhàng.','mix1.png','mix2.png','2024-11-02 00:00:00','2025-05-02 00:00:00','ngu-coc-mix'),
	 ('GRAIN003',N'Ngũ cốc hạt quinoa','GRAIN',110000.0,15.0,93500.0,N'Quinoa giàu dinh dưỡng',0,1,120,0,N'Thành phần: Hạt quinoa nhập khẩu, không chứa gluten, giàu protein hoàn chỉnh với đủ 9 loại axit amin thiết yếu. Chứa lượng lớn chất xơ, axit béo omega-3, sắt, canxi và kali. Quinoa là lựa chọn tuyệt vời cho người ăn chay và những ai cần chế độ ăn lành mạnh.
- Hướng dẫn sử dụng: Rửa sạch hạt trước khi nấu. Có thể dùng thay cơm hoặc trộn vào salad, súp, cháo. Cũng thích hợp để làm bánh hoặc các món ăn sáng. Khi nấu, hạt quinoa có hương vị béo nhẹ và kết cấu mềm mại, dễ ăn.','quinoa1.png','quinoa2.png','2024-11-03 00:00:00','2025-05-03 00:00:00','ngu-coc-quinoa'),
	 ('GRAIN004',N'Ngũ cốc lúa mạch nguyên cám','GRAIN',85000.0,10.0,76500.0,N'Lúa mạch nguyên cám, giàu dưỡng chất',0,1,90,0,N'Thành phần: Lúa mạch nguyên cám, giàu chất xơ beta-glucan giúp giảm cholesterol LDL (xấu), kiểm soát đường huyết và hỗ trợ giảm cân. Ngoài ra, lúa mạch còn chứa vitamin B, selen và mangan, giúp tăng cường hệ miễn dịch và cải thiện sức khỏe tim mạch.
- Hướng dẫn sử dụng: Nấu cháo lúa mạch kết hợp với rau củ hoặc thịt để làm món ăn sáng bổ dưỡng. Dùng như nguyên liệu trong súp, salad hoặc pha với nước nóng như thức uống. Cũng có thể làm bánh hoặc nấu kèm món ăn chính.','barley1.png','barley2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','ngu-coc-lua-mach'),
	 ('GRAIN005',N'Ngũ cốc yến mạch cán dẹt','GRAIN',75000.0,5.0,71250.0,N'Yến mạch cán dẹt tiện lợi',1,1,120,1,N'Thành phần: Yến mạch cán dẹt loại 1, giữ nguyên dinh dưỡng từ hạt yến mạch, giàu chất xơ hòa tan beta-glucan, protein, vitamin nhóm B và chất chống oxy hóa avenanthramides. Thích hợp cho người cần kiểm soát cân nặng và hỗ trợ hệ tiêu hóa.
- Hướng dẫn sử dụng: Ngâm trong nước hoặc sữa từ 5-10 phút trước khi dùng. Có thể thêm mật ong, trái cây tươi hoặc bơ đậu phộng. Dùng làm nguyên liệu cho các món bánh quy, bánh pancake hoặc sinh tố tăng năng lượng.','flat_oats1.png','flat_oats2.png','2024-11-02 00:00:00','2025-05-02 00:00:00','yen-mach-can-det'),
	 ('GRAIN006',N'Ngũ cốc hạt kê vàng','GRAIN',70000.0,0.0,70000.0,N'Hạt kê vàng, dễ nấu, giàu dinh dưỡng',0,1,100,0,N'Thành phần: Hạt kê vàng hữu cơ, giàu chất xơ, vitamin nhóm B, sắt, phốt pho và magiê. Đây là nguồn thực phẩm không chứa gluten, dễ tiêu hóa, phù hợp với người nhạy cảm gluten hoặc ăn kiêng. Hạt kê giúp tăng cường sức khỏe xương khớp và hỗ trợ làm đẹp da.
- Hướng dẫn sử dụng: Rửa sạch hạt trước khi nấu. Nấu cháo kê với thịt, cá hoặc rau củ. Cũng có thể nấu súp, trộn salad hoặc rang hạt kê để ăn kèm như món snack.','millet1.png','millet2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','hat-ke-vang'),
	 ('GRAIN007',N'Bột ngũ cốc nguyên cám','GRAIN',95000.0,10.0,85500.0,N'Bột ngũ cốc mịn, bổ dưỡng',0,1,80,0,N'Thành phần: Bột từ hỗn hợp yến mạch, lúa mạch, hạt kê và các loại hạt dinh dưỡng như hạt chia, hạt lanh. Cung cấp năng lượng lâu dài, chất xơ, protein thực vật và vitamin nhóm B. Tốt cho sức khỏe đường ruột và duy trì năng lượng ổn định suốt ngày.
- Hướng dẫn sử dụng: Pha với nước nóng, sữa hoặc sữa chua. Thêm mật ong, bột cacao hoặc trái cây khô để tăng hương vị. Cũng thích hợp để làm bột bánh, cháo dinh dưỡng cho trẻ em hoặc người lớn tuổi.','flour1.png','flour2.png','2024-11-02 00:00:00','2025-05-02 00:00:00','bot-ngu-coc'),
	 ('GRAIN008',N'Ngũ cốc hạt chia','GRAIN',120000.0,15.0,102000.0,N'Hạt chia giàu omega-3 và chất xơ',1,1,150,1,N'Thành phần: Hạt chia hữu cơ, không chứa gluten, giàu axit béo omega-3, chất xơ hòa tan và khoáng chất như canxi, phốt pho, magie. Hỗ trợ sức khỏe tim mạch, giảm cân và cải thiện làn da.
- Hướng dẫn sử dụng: Ngâm hạt chia với nước hoặc sữa trong 10-15 phút để tạo pudding. Có thể thêm vào sinh tố, nước ép, salad hoặc các món bánh. Dùng làm topping cho sữa chua, kem hoặc món tráng miệng.','chia_cereal1.png','chia_cereal2.png','2024-11-03 00:00:00','2025-05-03 00:00:00','hat-chia'),
	 ('GRAIN009',N'Ngũ cốc hạt lanh','GRAIN',80000.0,5.0,76000.0,N'Hạt lanh bổ sung dinh dưỡng',0,1,70,0,N'Thành phần: Hạt lanh giàu lignans (hợp chất chống oxy hóa), chất xơ hòa tan và axit béo omega-3. Tốt cho sức khỏe tim mạch, hỗ trợ tiêu hóa và cân bằng hormone.
- Hướng dẫn sử dụng: Xay nhuyễn trước khi dùng để cơ thể hấp thụ tốt nhất. Trộn vào sinh tố, sữa chua, cháo hoặc nấu bánh. Cũng có thể dùng như nguyên liệu trong món salad, súp hoặc món chính.','flaxseed1.png','flaxseed2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','hat-lanh'),
	 ('GRAIN010',N'Ngũ cốc mix trái cây khô','GRAIN',110000.0,10.0,99000.0,N'Ngũ cốc mix với trái cây sấy khô',1,1,200,1,N'Thành phần: Hỗn hợp ngũ cốc nguyên cám (yến mạch, lúa mì, lúa mạch) và trái cây sấy khô như nho, chuối, táo, việt quất, cùng hạt dinh dưỡng như hạt hạnh nhân, hạt bí. Giàu chất xơ, vitamin và chất chống oxy hóa.
- Hướng dẫn sử dụng: Ăn trực tiếp như món ăn vặt hoặc pha với sữa, sữa chua. Có thể làm topping cho bánh hoặc nấu kèm cháo, súp. Phù hợp cho bữa sáng hoặc snack bổ dưỡng.','fruit_mix1.png','fruit_mix2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','ngu-coc-mix-trai-cay'),
	 ('SAUCE001',N'Sốt mè rang Nhật Bản','SAUCE',60000.0,10.0,54000.0,N'Sốt mè rang đậm vị thơm ngon',0,1,150,0,N'Thành phần: Kết hợp hài hòa mè rang nghiền nhuyễn, dầu mè ép lạnh, nước tương lên men tự nhiên, giấm gạo truyền thống Nhật Bản, đường tinh luyện và một chút mật ong để tạo độ ngọt dịu. Chứa nhiều chất chống oxy hóa và axit béo tốt cho sức khỏe.
- Hướng dẫn sử dụng: Thích hợp trộn salad rau củ, làm nước chấm cho các món gỏi hoặc dùng làm sốt cho các món nướng như cá hồi, gà nướng. Mang lại hương vị béo bùi và thơm đậm đà.','sesame1.png','sesame2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','sot-me-rang-nhat'),
	 ('SAUCE002',N'Sốt Teriyaki Nhật Bản','SAUCE',70000.0,15.0,59500.0,N'Sốt teriyaki đậm đà vị truyền thống',0,1,100,0,N'Thành phần: Là sự hòa quyện của nước tương đậm đặc, rượu mirin ngọt nhẹ, đường nâu hảo hạng và gừng tươi xay nhuyễn. Sản phẩm không chứa phẩm màu nhân tạo, giàu protein và axit amin tự nhiên.
- Hướng dẫn sử dụng: Dùng để ướp gà, cá hồi, hoặc thịt bò trước khi nướng. Có thể thêm trực tiếp vào các món áp chảo như rau củ hoặc đậu phụ để tạo hương vị Nhật Bản chuẩn mực.','teriyaki1.png','teriyaki2.png','2024-11-02 00:00:00','2025-05-02 00:00:00','sot-teriyaki'),
	 ('SAUCE003',N'Nước tương đậu nành hữu cơ','SAUCE',50000.0,5.0,47500.0,N'Nước tương organic từ đậu nành lên men',1,1,200,1,N'Thành phần: Chế biến từ đậu nành hữu cơ chọn lọc và lúa mì lên men tự nhiên trong thùng gỗ, tạo ra vị mặn ngọt hài hòa cùng hương thơm đặc trưng. Giàu đạm thực vật và các chất chống oxy hóa tự nhiên.
- Hướng dẫn sử dụng: Dùng làm gia vị nêm nếm, pha nước chấm hoặc trộn salad. Phù hợp nhất khi ăn kèm sushi, sashimi hoặc các món xào nhẹ. Sản phẩm an toàn cho người ăn kiêng và ăn chay.','soy_sauce1.png','soy_sauce2.png','2024-11-01 00:00:00','2025-06-01 00:00:00','nuoc-tuong-huu-co'),
	 ('SAUCE004',N'Gia vị rắc cơm Nhật','SAUCE',40000.0,0.0,40000.0,N'Gia vị rắc cơm tiện lợi, đậm đà',0,1,120,0,N'Thành phần: Hỗn hợp tảo biển nori nghiền nhuyễn, mè rang vàng, cá ngừ khô bào mỏng, trứng cá tuyết sấy khô, rong biển kombu cắt nhỏ và một chút muối biển tinh khiết. Giàu iốt, omega-3 và chất xơ.
- Hướng dẫn sử dụng: Rắc trực tiếp lên cơm nóng, cơm nắm, mì ramen hoặc salad để tăng hương vị. Thích hợp cho các bữa ăn nhanh nhưng vẫn đầy đủ dinh dưỡng.','furikake1.png','furikake2.png','2024-11-03 00:00:00','2025-05-03 00:00:00','gia-vi-rac-com'),
	 ('SAUCE005',N'Sốt ớt cay Hàn Quốc','SAUCE',65000.0,10.0,58500.0,N'Sốt ớt cay Gochujang',1,1,90,1,N'Thành phần: Được làm từ ớt đỏ Hàn Quốc xay nhuyễn, tương đậu nành lên men, tỏi tươi giã nhuyễn, đường nâu và giấm gạo. Vị cay nồng kết hợp với vị ngọt và chút chua nhẹ tạo nên đặc trưng của ẩm thực Hàn Quốc.
- Hướng dẫn sử dụng: Phù hợp cho các món lẩu cay, ướp thịt BBQ, hoặc làm gia vị chính trong món tokbokki, súp cay Hàn Quốc. Có thể pha loãng để làm nước chấm.','chili_sauce1.png','chili_sauce2.png','2024-11-01 00:00:00','2025-06-01 00:00:00','sot-ot-han-quoc'),
	 ('SAUCE006',N'Dầu oliu nguyên chất','SAUCE',120000.0,5.0,114000.0,N'Dầu oliu nhập khẩu từ Ý',1,1,80,1,N'Thành phần: 100% dầu oliu ép lạnh từ trái oliu trồng hữu cơ ở vùng Địa Trung Hải, không qua xử lý nhiệt hay hóa chất. Giàu axit béo không bão hòa đơn, vitamin E và polyphenol giúp giảm viêm và bảo vệ sức khỏe tim mạch.
- Hướng dẫn sử dụng: Dùng trộn salad, làm sốt pasta, hoặc phết bánh mì. Tránh dùng ở nhiệt độ cao để giữ nguyên giá trị dinh dưỡng. Cũng thích hợp dùng dưỡng tóc và da.','olive_oil1.png','olive_oil2.png','2024-11-02 00:00:00','2025-11-02 00:00:00','dau-oliu-nguyen-chat'),
	 ('SAUCE007',N'Mật ong nguyên chất','SAUCE',100000.0,15.0,85000.0,N'Mật ong tự nhiên không pha trộn',1,1,200,1,N'Thành phần: 100% mật ong rừng tự nhiên, thu hoạch từ hoa rừng nguyên sinh, không pha chế, không qua xử lý nhiệt. Giàu chất chống oxy hóa, enzyme tự nhiên, vitamin C và các khoáng chất như sắt, kali.
- Hướng dẫn sử dụng: Pha nước mật ong với chanh ấm, dùng làm nguyên liệu nấu ăn, nướng bánh hoặc làm sốt salad. Cũng có thể dùng để dưỡng da hoặc làm dịu cổ họng khi bị cảm.','honey1.png','honey2.png','2024-11-01 00:00:00','2025-11-01 00:00:00','mat-ong-nguyen-chat'),
	 ('SAUCE008',N'Muối hồng Himalaya','SAUCE',90000.0,0.0,90000.0,N'Muối hồng giàu khoáng chất',1,1,120,1,N'Thành phần: Muối tự nhiên được khai thác từ các mỏ muối cổ đại ở dãy Himalaya, không qua tinh chế, chứa hơn 80 khoáng chất vi lượng như magiê, canxi, kali, sắt. Màu hồng đặc trưng nhờ hàm lượng oxit sắt cao.
- Hướng dẫn sử dụng: Dùng thay thế muối ăn thông thường để nêm nếm hoặc làm gia vị nướng. Có thể pha nước uống detox hoặc sử dụng trong các liệu pháp làm đẹp như tẩy tế bào chết.','himalaya_salt1.png','himalaya_salt2.png','2024-11-01 00:00:00','2026-11-01 00:00:00','muoi-hong-himalaya'),
	 ('SAUCE009',N'Tương ớt tỏi đặc biệt','SAUCE',50000.0,5.0,47500.0,N'Tương ớt cay với vị tỏi thơm nồng',1,1,100,1,N'Thành phần: Ớt đỏ tươi, tỏi ta bóc vỏ, đường mía tự nhiên, giấm gạo chua dịu và muối biển sạch. Không chứa chất bảo quản, đảm bảo hương vị tự nhiên cay nồng, thơm dịu.
- Hướng dẫn sử dụng: Phù hợp để làm nước chấm cho các món chiên, nướng. Có thể dùng trong các món xào để tăng vị đậm đà hoặc phết lên bánh mì kèm bơ cho bữa sáng ngon miệng.','chili_garlic1.png','chili_garlic2.png','2024-11-03 00:00:00','2025-06-03 00:00:00','tuong-ot-toi'),
	 ('SAUCE010',N'Sốt bơ đậu phộng hữu cơ','SAUCE',80000.0,10.0,72000.0,N'Sốt bơ đậu phộng thơm béo',0,1,110,0,N'Thành phần: 100% đậu phộng hữu cơ rang chín, không chứa dầu cọ, đường hay muối. Giàu protein thực vật, axit béo tốt và chất xơ. Được sản xuất theo quy trình kiểm soát nghiêm ngặt, đảm bảo vệ sinh và giữ nguyên giá trị dinh dưỡng.
- Hướng dẫn sử dụng: Dùng làm nhân bánh mì, sốt trộn salad, hoặc pha chế sinh tố bơ đậu phộng. Có thể thêm vào các món bánh nướng để tăng độ thơm béo.','peanut_butter1.png','peanut_butter2.png','2024-11-02 00:00:00','2025-06-02 00:00:00','sot-bo-dau-phong'),
	 ('FRUIT001',N'Táo Fuji hữu cơ','FRUIT',80000.0,0.0,80000.0,N'Táo Fuji giòn ngọt nhập khẩu',0,1,100,0,N'Thành phần: Táo Fuji hữu cơ trồng tại các nông trại đạt tiêu chuẩn quốc tế, không sử dụng phân bón hóa học hay thuốc trừ sâu. Táo có lớp vỏ căng mọng, màu đỏ tươi pha sọc vàng, thịt giòn, vị ngọt đậm và hương thơm dịu. Chứa nhiều vitamin C, chất xơ hòa tan, kali và chất chống oxy hóa như quercetin, giúp giảm viêm, hỗ trợ hệ tiêu hóa và tăng cường hệ miễn dịch.
- Hướng dẫn sử dụng: Rửa sạch vỏ dưới nước, ăn trực tiếp cả vỏ để tận dụng tối đa chất xơ. Có thể dùng trong món salad, nước ép hoặc chế biến thành bánh táo nướng.','applefruit1.png','applefruit2.png','2024-11-01 00:00:00','2024-11-07 00:00:00','tao-fuji'),
	 ('FRUIT002',N'Cam sành hữu cơ','FRUIT',45000.0,5.0,42750.0,N'Cam sành tươi ngon, không chất bảo quản',0,1,200,0,N'Thành phần: Cam sành hữu cơ với lớp vỏ xanh đậm, đôi khi điểm chút vàng khi chín. Ruột cam mọng nước, vị ngọt thanh hòa lẫn chút chua nhẹ. Cam giàu vitamin C, kali và chất xơ giúp hỗ trợ tiêu hóa, tăng cường miễn dịch và làm đẹp da. Đặc biệt, cam được trồng không hóa chất, an toàn cho sức khỏe.
- Hướng dẫn sử dụng: Rửa sạch vỏ trước khi gọt, vắt lấy nước để làm nước ép hoặc cắt múi ăn trực tiếp. Phù hợp với các bữa sáng, món tráng miệng hoặc nước giải khát trong ngày hè.','orangefruit1.png','orangefruit2.png','2024-11-02 00:00:00','2024-11-09 00:00:00','cam-sanh'),
	 ('FRUIT003',N'Chuối Cavendish sạch','FRUIT',30000.0,0.0,30000.0,N'Chuối Cavendish thơm ngọt',0,1,150,0,N'Thành phần: Chuối Cavendish với vỏ vàng nhạt, thịt chuối mềm, vị ngọt tự nhiên và thơm dịu. Chuối giàu kali, vitamin B6 và magiê, hỗ trợ sức khỏe tim mạch, hệ thần kinh và cung cấp năng lượng nhanh chóng. Đây là loại chuối được trồng sạch, không dư lượng thuốc trừ sâu.
- Hướng dẫn sử dụng: Bóc vỏ và ăn trực tiếp, dùng làm nguyên liệu cho sinh tố, bánh chuối hoặc trộn cùng ngũ cốc và sữa chua. Phù hợp cho các bữa ăn nhẹ hoặc sau khi tập luyện.','bananafruit1.png','bananafruit2.png','2024-11-01 00:00:00','2024-11-10 00:00:00','chuoi-cavendish'),
	 ('FRUIT004',N'Dưa hấu không hạt','FRUIT',40000.0,10.0,36000.0,N'Dưa hấu không hạt, mát lạnh, ngọt dịu',0,1,180,0,N'Thành phần: Dưa hấu không hạt với vỏ xanh đậm, ruột đỏ mọng nước, vị ngọt thanh tự nhiên. Loại dưa này chứa nhiều nước, lycopene, vitamin A và C, giúp cấp nước, tăng cường sức khỏe da và chống oxy hóa. Không sử dụng chất bảo quản.
- Hướng dẫn sử dụng: Rửa sạch vỏ trước khi gọt, cắt miếng ăn trực tiếp, làm sinh tố hoặc trang trí trong món trái cây dĩa. Rất thích hợp để giải nhiệt trong những ngày hè nóng bức hoặc bổ sung năng lượng nhanh chóng.','watermelonfruit1.png','watermelonfruit2.png','2024-11-01 00:00:00','2024-11-10 00:00:00','dua-hau-khong-hat'),
	 ('FRUIT005',N'Xoài cát Hòa Lộc','FRUIT',55000.0,0.0,55000.0,N'Xoài cát ngọt thơm, giàu vitamin A',1,1,80,1,N'Thành phần: Xoài cát Hòa Lộc là đặc sản từ vùng đất phù sa Hòa Lộc, Tiền Giang. Trái xoài chín tự nhiên, có lớp vỏ vàng óng, thịt dẻo, vị ngọt thơm đặc trưng và ít xơ. Giàu vitamin A, C, beta-carotene và chất xơ, xoài giúp cải thiện thị lực, hỗ trợ hệ tiêu hóa và làm đẹp da.
- Hướng dẫn sử dụng: Gọt vỏ và ăn trực tiếp, chế biến thành sinh tố, làm nước ép hoặc ăn kèm sữa chua. Cũng có thể dùng để làm nguyên liệu trong các món gỏi hoặc tráng miệng đặc biệt.','mangofruit1.png','mangofruit2.png','2024-11-01 00:00:00','2024-11-10 00:00:00','xoai-cat-hoa-loc'),
	 ('FRUIT006',N'Dâu tây Đà Lạt','FRUIT',90000.0,15.0,76500.0,N'Dâu tây Đà Lạt hữu cơ, tươi ngon',0,1,70,0,N'Thành phần: Dâu tây Đà Lạt được trồng trong điều kiện khí hậu mát mẻ, không hóa chất độc hại. Trái dâu đỏ tươi, căng mọng, vị chua ngọt tự nhiên, giàu vitamin C, mangan, folate và chất chống oxy hóa mạnh. Dâu tây hỗ trợ tăng cường sức khỏe da, ngăn ngừa lão hóa và cải thiện sức khỏe tim mạch.
- Hướng dẫn sử dụng: Rửa sạch với nước muối loãng trước khi ăn. Ăn trực tiếp hoặc chế biến thành sinh tố, mứt, hoặc dùng làm topping cho bánh, kem, sữa chua. Phù hợp cho các bữa tiệc hay món ăn nhẹ lành mạnh.','strawberryfruit1.png','strawberryfruit2.png','2024-11-01 00:00:00','2024-11-09 00:00:00','dau-tay-da-lat'),
	 ('FRUIT007',N'Kiwi vàng New Zealand','FRUIT',100000.0,5.0,95000.0,N'Kiwi vàng ngọt thanh, nhập khẩu',0,1,50,0,N'Thành phần: Kiwi vàng nhập khẩu từ New Zealand với vỏ mỏng, ruột vàng rực rỡ và vị ngọt thanh nhẹ. Kiwi chứa nhiều vitamin C, E, kali và chất xơ hòa tan, giúp tăng cường hệ miễn dịch, hỗ trợ tiêu hóa và bảo vệ da khỏi tác hại của môi trường.
- Hướng dẫn sử dụng: Gọt vỏ trước khi ăn hoặc cắt lát làm topping cho món salad, bánh ngọt, hoặc pha chế nước trái cây hỗn hợp. Thích hợp sử dụng hàng ngày, đặc biệt cho chế độ ăn uống lành mạnh.','kiwifruit1.png','kiwifruit2.png','2024-11-01 00:00:00','2024-11-12 00:00:00','kiwi-vang'),
	 ('FRUIT008',N'Bơ sáp Dak Lak','FRUIT',60000.0,0.0,60000.0,N'Bơ sáp thơm béo, đặc sản Dak Lak',0,1,200,0,N'Thành phần: Bơ sáp Dak Lak có lớp vỏ xanh mịn, thịt bơ vàng nhạt, dẻo mềm và béo ngậy. Bơ giàu axit béo không bão hòa, vitamin E, K, và chất xơ, giúp giảm cholesterol xấu, tăng cường sức khỏe tim mạch và cải thiện làn da. Bơ được trồng tại vùng đất bazan màu mỡ của Dak Lak.
- Hướng dẫn sử dụng: Bổ đôi, tách hạt và ăn trực tiếp. Có thể làm sinh tố bơ, trộn salad hoặc ăn kèm với bánh mì. Phù hợp với chế độ ăn kiêng hoặc thực đơn lành mạnh hàng ngày.','avocadofruit1.png','avocadofruit2.png','2024-11-01 00:00:00','2024-11-08 00:00:00','bo-sap'),
	 ('FRUIT009',N'Lựu đỏ nhập khẩu','FRUIT',70000.0,5.0,66500.0,N'Lựu đỏ giàu chất chống oxy hóa',0,1,100,0,N'Thành phần: Lựu đỏ nhập khẩu với lớp vỏ căng bóng, hạt lựu đỏ thẫm, vị ngọt thanh lẫn chút chua nhẹ. Lựu chứa polyphenol, vitamin C, K, và các chất chống oxy hóa mạnh, giúp bảo vệ tim mạch, ngăn ngừa viêm nhiễm và làm đẹp da.
- Hướng dẫn sử dụng: Tách hạt và ăn trực tiếp hoặc ép lấy nước uống. Có thể thêm hạt lựu vào món salad, sữa chua hoặc làm topping cho các món tráng miệng. Thích hợp cho những ai muốn bổ sung dưỡng chất hàng ngày.','pomegranatefruit1.png','pomegranatefruit2.png','2024-11-01 00:00:00','2025-05-01 00:00:00','ngu-coc-mix-trai-cay'),
	 ('FRUIT010',N'Nho đen không hạt nhập khẩu','FRUIT',120000.0,5.0,114000.0,N'Nho đen giòn ngọt, nhập khẩu từ Mỹ',0,1,80,0,N'Thành phần: Nho đen không hạt nhập khẩu có vỏ mỏng, ruột căng mọng, vị ngọt tự nhiên. Nho giàu resveratrol, vitamin C, K và các chất chống oxy hóa, giúp cải thiện tuần hoàn máu, giảm nguy cơ mắc bệnh tim mạch và làm chậm quá trình lão hóa.
- Hướng dẫn sử dụng: Rửa sạch trước khi ăn. Dùng làm món ăn nhẹ, nguyên liệu cho món salad hoặc trang trí các món tráng miệng. Thích hợp cho cả trẻ em và người lớn, mang lại nguồn dinh dưỡng phong phú.','blackgrapefruit1.png','blackgrapefruit2.png','2024-11-02 00:00:00','2024-11-12 00:00:00','nho-den-khong-hat');

INSERT INTO taikhoan (MaTaiKhoan,TenTaiKhoan,MatKhau,SoDienThoai,Email,VaiTro,NgayTaoTK,LanCuoiTruyCap,TinhTrangTK,MaKhachHang) VALUES
	 ('1','nguyenvanA','pass123','981234567','nguyenvana@gmail.com','User','2023-01-01 00:00:00','2024-11-22 00:00:00',1,'1'),
	 ('2','tranthib','abc456','981234568','tranthib@gmail.com','Admin','2023-02-15 00:00:00','2024-11-20 00:00:00',0,'2'),
	 ('3','phamminhc','12345@6','981234569','phamminhc@gmail.com','Admin','2023-03-20 00:00:00','2024-11-15 00:00:00',0,'3'),
	 ('4','lehoangd','secret89','981234570','lehoangd@gmail.com','User','2023-04-05 00:00:00','2024-11-18 00:00:00',1,'4'),
	 ('5','nguyencthe','mypass22','981234571','nguyencthe@gmail.com','Admin','2023-05-10 00:00:00','2024-11-21 00:00:00',0,'5'),
	 ('6','vuhongf','1234567','981234572','vuhongf@gmail.com','User','2023-06-01 00:00:00','2024-11-22 00:00:00',1,'6'),
	 ('7','dokimg','pass@123','981234573','dokimg@gmail.com','User','2023-07-25 00:00:00','2024-11-19 00:00:00',0,'7'),
	 ('8','hoanglanh','qwerty7','981234574','hoanglanh@gmail.com','User','2023-08-12 00:00:00','2024-11-10 00:00:00',1,'8'),
	 ('9','lethanyi','654321abc','981234575','lethanyi@gmail.com','Admin','2023-09-05 00:00:00','2024-11-16 00:00:00',0,'9'),
	 ('10','phanminhj','pass@567','981234576','phanminhj@gmail.com','User','2023-10-10 00:00:00','2024-11-12 00:00:00',0,'10'),
	 ('11','nguyenkimk','testpass','981234577','nguyenkimk@gmail.com','User','2023-11-01 00:00:00','2024-11-20 00:00:00',0,'11'),
	 ('12','tranvanl','abc@789','981234578','tranvanl@gmail.com','Admin','2023-11-05 00:00:00','2024-11-22 00:00:00',0,'12'),
	 ('13','lethim','654abc12','981234579','lethim@gmail.com','User','2023-11-10 00:00:00','2024-11-15 00:00:00',0,'13'),
	 ('14','vuducn','123qwe45','981234580','vuducn@gmail.com','User','2023-11-12 00:00:00','2024-11-13 00:00:00',1,'14'),
	 ('15','dothio','1qaz2wsx','981234581','dothio@gmail.com','User','2023-11-15 00:00:00','2024-11-21 00:00:00',1,'15'),
	 ('16','hoangvanp','pass789','981234582','hoangvanp@gmail.com','Admin','2023-11-20 00:00:00','2024-11-18 00:00:00',0,'16'),
	 ('17','phanthiq','987654qwe','981234583','phanthiq@gmail.com','User','2023-11-22 00:00:00','2024-11-20 00:00:00',0,'17'),
	 ('18','leducr','pass678','981234584','leducr@gmail.com','User','2023-11-25 00:00:00','2024-11-17 00:00:00',1,'18'),
	 ('19','truonghongs','pass1234','981234585','truonghongs@gmail.com','Admin','2023-12-01 00:00:00','2024-11-19 00:00:00',1,'19'),
	 ('20','nguyenhtai','123abc789','981234586','nguyenhtai@gmail.com','User','2023-12-05 00:00:00','2024-11-22 00:00:00',0,'20');
	 
INSERT INTO tukhoa (MaTuKhoa,TenTuKhoa) VALUES
	 ('TK0001',N'Hạt'),
	 ('TK0002',N'Hạnh nhân'),
	 ('TK0003',N'Óc chó'),
	 ('TK0004',N'Điều rang'),
	 ('TK0005',N'Bí xanh'),
	 ('TK0006',N'Dẻ cười'),
	 ('TK0007',N'Mắc ca'),
	 ('TK0008',N'Chia'),
	 ('TK0009',N'Dẻ rang'),
	 ('TK0010',N'Kê vàng'),
	 ('TK0011',N'Hướng dương'),
	 ('TK0012',N'Nước ép'),
	 ('TK0013',N'Táo'),
	 ('TK0014',N'Cam sành'),
	 ('TK0015',N'Cà rốt'),
	 ('TK0016',N'Dưa hấu'),
	 ('TK0017',N'Cần tây'),
	 ('TK0018',N'Dứa'),
	 ('TK0019',N'Lựu đỏ'),
	 ('TK0020',N'Dâu tây'),
	 ('TK0021',N'Xoài'),
	 ('TK0022',N'Bưởi hồng'),
	 ('TK0023',N'Ngũ cốc'),
	 ('TK0024',N'Yến mạch'),
	 ('TK0025',N'Nguyên cám'),
	 ('TK0026',N'Hạt quinoa'),
	 ('TK0027',N'Lúa mạch'),
	 ('TK0028',N'Hạt chia'),
	 ('TK0029',N'Hạt lanh'),
	 ('TK0030',N'Mix trái cây'),
	 ('TK0031',N'Sốt'),
	 ('TK0032',N'Mè rang'),
	 ('TK0033',N'Teriyaki'),
	 ('TK0034',N'Nước tương'),
	 ('TK0035',N'Gia vị'),
	 ('TK0036',N'Sốt ớt'),
	 ('TK0037',N'Dầu oliu'),
	 ('TK0038',N'Mật ong'),
	 ('TK0039',N'Muối hồng'),
	 ('TK0040',N'Tương ớt'),
	 ('TK0041',N'Sốt bơ đậu'),
	 ('TK0042',N'Trái cây'),
	 ('TK0043',N'Chuối'),
	 ('TK0044',N'Kiwi'),
	 ('TK0045',N'Bơ'),
	 ('TK0046',N'Nho');

-- Tạo khóa ngoại cho các bảng
ALTER TABLE KhachHang 
ADD CONSTRAINT khachhang_madiachi
FOREIGN KEY (MaDiaChi)
REFERENCES DiaChi(MaDiaChi);
ALTER TABLE TaiKhoan 
ADD CONSTRAINT taikhoan_makhachhang
FOREIGN KEY (MaKhachHang)
REFERENCES KhachHang(MaKhachHang);
ALTER TABLE DonHang 
ADD CONSTRAINT donhang_mataikhoan
FOREIGN KEY (MaTaiKhoan)
REFERENCES TaiKhoan(MaTaiKhoan);
ALTER TABLE DonHang 
ADD CONSTRAINT donhang_magiaohang
FOREIGN KEY (MaGiaoHang)
REFERENCES GiaoHang(MaGiaoHang);
ALTER TABLE DonHang 
ADD CONSTRAINT donhang_mapttt
FOREIGN KEY (MaPTTT)
REFERENCES PhuongThucThanhToan(MaPTTT);
ALTER TABLE DonHang 
ADD CONSTRAINT donhang_magiamgia
FOREIGN KEY (MaGiamGia)
REFERENCES GiamGia(MaGiamGia);
ALTER TABLE ChiTietDonHang 
ADD CONSTRAINT chitietdonhang_madonhang
FOREIGN KEY (MaDonHang)
REFERENCES DonHang(MaDonHang);
ALTER TABLE ChiTietDonHang 
ADD CONSTRAINT chitietdonhang_masanpham
FOREIGN KEY (MaSanPham)
REFERENCES SanPham(MaSanPham);
ALTER TABLE DanhGiaSanPham 
ADD CONSTRAINT danhgiasanpham_mataikhoan
FOREIGN KEY (MaTaiKhoan)
REFERENCES TaiKhoan(MaTaiKhoan);
ALTER TABLE DanhGiaSanPham 
ADD CONSTRAINT danhgiasanpham_masanpham
FOREIGN KEY (MaSanPham)
REFERENCES SanPham(MaSanPham);
ALTER TABLE SanPham 
ADD CONSTRAINT sanpham_maloai
FOREIGN KEY (MaLoai)
REFERENCES LoaiSanPham(MaLoai);
ALTER TABLE ChiTietTuKhoa 
ADD CONSTRAINT ChiTietTuKhoa_matukhoa
FOREIGN KEY (MaTuKhoa)
REFERENCES TuKhoa(MaTuKhoa);
ALTER TABLE ChiTietTuKhoa 
ADD CONSTRAINT ChiTietTuKhoa_masanpham
FOREIGN KEY (MaSanPham)
REFERENCES SanPham(MaSanPham);
