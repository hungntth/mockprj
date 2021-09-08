DROP DATABASE IF EXISTS MockProject;
CREATE DATABASE MockProject;
USE MockProject;

CREATE TABLE `Account` (
    AccountID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	FullName NVARCHAR(100) NOT NULL,
	UserName VARCHAR(100) UNIQUE KEY NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE KEY,
    `PassWord` VARCHAR(24) NOT NULL,
    `Type` ENUM('Manager','Admin') DEFAULT 'Manager',
    CreateDate DATETIME DEFAULT NOW() 
);


CREATE TABLE `CategoryQuestion`(
	CategoryID						INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName					ENUM('SQL','JAVA','IQ')
    
);

CREATE TABLE `Question`(
	QuestionID						INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content							NVARCHAR(300),
    CategoryID						INT UNSIGNED NOT NULL,
    Creator							INT UNSIGNED NOT NULL,
    CreateDate						DATETIME DEFAULT NOW() ,
    
	FOREIGN KEY(CategoryID)REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(Creator)REFERENCES `Account`(AccountID)
);

CREATE TABLE `Answer`(
	AnswerID						INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content							NVARCHAR(500) ,
    QuestionID						INT UNSIGNED NOT NULL,
    isCorrect						BIT DEFAULT 0,
    Creator						INT UNSIGNED NOT NULL,		
     CreateDate						DATETIME DEFAULT NOW() ,
     FOREIGN KEY(QuestionID)REFERENCES Question(QuestionID),
     FOREIGN KEY(Creator)REFERENCES `Account`(AccountID)
);

CREATE TABLE `Exam`(
	ExamID							INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Code`							VARCHAR(50) NOT NULL  UNIQUE KEY,
    CategoryID						INT UNSIGNED NOT NULL,
    Creator					INT UNSIGNED NOT NULL,
    CreateDate						DATETIME DEFAULT NOW() ,
    
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(Creator)REFERENCES `Account`(AccountID)
);

CREATE TABLE ExamQuestion(
	ExamID							INT UNSIGNED NOT NULL,
    QuestionID						INT UNSIGNED NOT NULL,
    
    PRIMARY KEY(ExamID,QuestionID),
    FOREIGN KEY(ExamID)REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

CREATE TABLE ExamSet(
	ExamSetID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ExamSetName			VARCHAR(50) NOT NULL,
    Creator				INT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW() ,
    
    FOREIGN KEY(Creator) REFERENCES `Account`(AccountID)
);

CREATE TABLE Candidate(
	CandidateID			INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FullName			NVARCHAR(100) NOT NULL,
    PhoneNumber			VARCHAR(20) NOT NULL UNIQUE KEY,
    ExamSetID				INT UNSIGNED ,
    `Status` 			BIT DEFAULT 0,
    Creator				INT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW() ,
    
    FOREIGN KEY(Creator) REFERENCES `Account`(AccountID),
    FOREIGN KEY(ExamSetID)REFERENCES ExamSet(ExamSetID)
);



CREATE TABLE `Point` (
	PointID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	CandidateID INT UNSIGNED NOT NULL,
    PointSQL	INT,
    PointJAVA	INT,
    PointIQ		INT,
    `Date`		DATETIME DEFAULT NOW() ,
    
    FOREIGN KEY(CandidateID) REFERENCES Candidate(CandidateID)
);


-- exam-examset
CREATE TABLE EESet(
	ExamSetID			INT UNSIGNED NOT NULL,
    ExamID				INT UNSIGNED NOT NULL,
    
    PRIMARY KEY(ExamSetID,ExamID),
    FOREIGN KEY(ExamSetID)REFERENCES ExamSet(ExamSetID),
    FOREIGN KEY(ExamID)REFERENCES Exam(ExamID)
);

INSERT INTO `Account` (FullName, UserName, Email, `PassWord`, `Type`)
VALUES ('Trần Trung Kiên','trungkien','trungkien@gmail.com','123456a@','Admin'),
		('Nguyễn Thành Trung','thanhtrung','thanhtrung@gmail.com','123456a@','Manager'),
        ('Nguyễn Thị Nhung','nguyennhung','nguyennhung@gmail.com','123456a@','Manager'),
        ('Trương Văn Tuấn','vantuan','vantuan@gmail.com','123456a@','Manager'),
        ('Dương Trọng Thắng','trongthang','trongthang@gmail.com','123456a@','Manager'),
        ('Nguyễn Thái Hưng','thaihung','thaihung@gmail.com','123456a@','Manager');
        

INSERT INTO `CategoryQuestion`(CategoryName)
VALUES ('SQL'), ('JAVA'),('IQ');

INSERT INTO Question (Content, CategoryID, Creator)
VALUES ('Hãy cho biết SQL là viết tắt của?','1','3'),
('Hãy cho biết DBMS là viết tắt của?','1','3'),
('Allow Nulls có tác dụng gì ?','1','3'),
('nếu tại Data Type của cột tương ứng người dùng chọn kiểu 
	‘‘Datetime’’ thì dữ liệu của cột đó nhận giá trị dạng thế nào?','1','2'),
('Hãy nêu tác dụng của Data Type?','1','3'),
('Hãy nêu cấu trúc lời gọi Store Procedure?','1','4'),
('Inner Join là kiểu liên kết gì ?','1','4'),
('Trong Cú pháp câu lệnh ràng buộc Forein Key, từ khoá On Update có nghĩa là gì ?','1','4'),
('Cú pháp câu lệnh xoá thủ tục?','1','3'),
('Hãy nêu cú pháp câu lệnh khai báo tham số?','1','3'),
('Trong khai báo thủ tục, thân thủ tục chính bắt đầu sau từ khoá nào?','1','3'),

('File chứa mã nguồn java sau khi được biên dịch có đuôi là gì ?','2','2'),
('Java Virtual Machine là gì?','2','2'),
('Java chạy trên hệ điều hành nào sau đây:','2','4'),
('API là gì?','2','4'),
('Ngôn ngữ lập trình Java cung cấp các tính năng nào sau đây?','2','4'),
('Có bao nhiêu cách viết chú thích?','2','5'),
('Thứ tự các từ khóa public và static khi khai bao như thế nào?','2','6'),
('Câu lệnh khai báo chuẩn cho phương thức main như thế nào?','2','6'),
('Câu nào sau đây là sai?','2','2'),
('Exception in thread main java.lang.NoClassDefFoundError: myprogram. Lỗi này có nghĩa gì?','2','6'),
('Đối tượng trong OOP là gì?','2','2'),
('Cách đặt tên nào sau đây là sai?','2','2'),
('Một lớp trong Java có thể có bao nhiêu lớp cha?','2','6'),
('Một lớp trong Java có bao nhiêu lớp con?','2','2'),
('Để khai báo lớp Xedap1 kế thừa lớp Xedap phải làm như thế nào?','2','2'),
('Interface là gì?','2','4'),
('Có bao nhiêu kiểu dữ liệu cơ sở trong Java?','2','2'),
('Có bao nhiêu kiểu số nguyên trong Java?','2','2'),

('Nhà Thanh có ao bèo 1.000m2, ngày hôm sau số lượng bèo sẽ nở gấp đôi ngày hôm trước, 
	đến ngày thứ 18 thì bèo đã nở được nửa ao. 
	Vậy đến ngày thứ bao nhiêu thì bèo sẽ nở đầy ao?','3','5'),
('9 – 6 - 1; 27 – 1 - 2; 6 - 3 - ?','3','5'),
('Số tiếp theo của dãy 19, 28, 37, 46, ... là số nào? ','3','5'),
('Hãy tính dãy số sau đây: 1 + 2 + 3 + ..... + 99 = ...........','3','4'),
('Minh 4 tuổi, tuổi anh Minh gấp 3 lần tuổi Minh. 
	Khi anh Minh bao nhiêu tuổi thì tuổi anh Minh chỉ còn gấp đôi tuổi Minh?','3','2'),
('John có 10 đôi tất. Nếu anh ta mất 7 chiếc tất riêng lẻ 
	thì số đôi nhiều nhất mà anh ta còn lại là bao nhiêu?','3','3'),
('Một đội bóng rổ chơi được 2/3 trận đấu và đã thắng 17 bàn, thua 3 bàn. 
	Trong suốt trận đấu còn lại đội bóng có thể thua nhiều nhất bao nhiêu 
	mà vẫn thắng ít nhất 3/4 toàn trận đấu?','3','4'),
('Các đồng xu được thả vào một cái hộp với tốc độ 2 fit khối/giờ. 
	Nếu một hộp rỗng có kích thước là dài 4 fit, rộng 4 fit và sâu 3 fit, 
    sẽ mất bao lâu để đôt đầy chiếc hộp đó?','3','5'),
('Nếu x và y là các số nguyên tố thì các giá trị nào 
	trong các giá trị sau không thể là tổng của x và y?','3','4'),
('Tiền thuê 1 chỗ đậu xe trong gara là 10 đôla/tuần hoặc 30 đôla/tháng. 
	Một người có thể tiết kiệm được bao nhiêu tiền trong 1 năm nếu thuê theo tháng?','3','5'),
('Tìm số tiếp theo của dãy số: 13; 8; 14; 9; 15','3','5'),
('Tìm số còn thiếu trong dãy số sau: 1  4  9  16  ?','3','4'),
('Nếu 8 năm trước Mario 32 tuổi thì anh ta bao nhiêu tuổi cách đây x năm?','3','2'),
('Tuấn cao hơn Nam, Bình thấp hơn Tuấn. Câu nào đúng nhất :','3','5'),
('Nếu chiều dài và chiều rộng của một khu vườn hình chữ nhật tăng lên 20%, 
	thì khu vườn sẽ tăng lên bao nhiêu % ?','3','5'),
('Cho dãy số: 10, 30, 32, 96, 98, 294, 296, ?, ? Hãy điền vào chỗ hai dấu hỏi hai số tiếp theo?','3','6'),
('Điền những số còn thiếu trong dãy số sau sao cho thích hợp. 4; 12; 8; 24; 16; ...','3','6'),
('Số tiếp theo của dãy số 5 11 18 26 35 ?','3','5'),
('1 ->1 ->2 -> 6 -> 24 -> 120 -> ... Hãy điền số thích hợp tiếp theo ?','3','5');

INSERT INTO `Answer` (Content, QuestionID, isCorrect, Creator)
VALUES ('Structured Query Language',1,1,3),
		('Query Structure Language',1,0,3),
        ('Structure Question Language',1,0,3),
        ('Structure Query Locator',1,0,3),
        
        ('Database Management System',2,1,3),
        ('Database makeup System',2,0,3),
        ('Datbase Management System',2,0,3),
        ('Database Managment System',2,0,3),
        
        ('Người dùng không được để trống tất cả các cột trong bảng.',3,0,3),
        ('Không bắt buộc người dùng nhập dữ liệu.',3,0,3),
        ('Bắt buộc người dùng nhập dữ liệu.',3,0,3),
        ('Ràng buộc người dùng bắt buộc nhập dữ liệu cho cột tương ứng hoặc không',3,1,3),
        
        ('Thời gian (mm/dd/yyyy:hh:mm:ss).',4,1,2),
        ('Thời gian (mm/dd/yyyy).',4,0,2),
        ('Thời gian (hh:mm:ss).',4,0,2),
        ('Thời gian(dd/mm/yyyy).',4,0,2),
        
        ('Tạo mới kiểu dữ liệu cho cột tương ứng',5,0,3),
        ('Chọn kiểu dữ liệu cho cột tương ứng',5,1,3),
        ('Chọn kiểu cột tương ứng',5,0,3),
        ('Tạo mới kiểu cột tương ứng',5,0,3),
        
        ('exec <tên Store Procedure > [<danh sách các tham số>]',6,1,4),
        ('exec <tên STORE PROCEDURE> [ <kiểu dữ liệu>]',6,0,4),
        ('exec <tên STORE PROCEDURE> [ <danh sách các tham số> <kiểu dữ liệu>]',6,0,4),
        ('exec <tên STORE PROCEDURE>',6,0,4),
        
        ('Liên kết bằng.',7,1,4),
        ('Liên kết phải.',7,0,4),
        ('Liên kết trái',7,0,4),
        ('Liên kết đầy đủ.',7,0,4),
        
        ('Ràng buộc được phép cập nhật khoá Forein Key.',8,0,4),
        ('Bắt buộc phải cập nhật dữ liệu cho bảng.',8,0,4),
        ('Không được cập nhật dữ liệu.',8,0,4),
        ('Áp dụng câu lệnh cho thao tác cập nhật dữ liệu.',8,1,4),
        
        ('delete procedure <tên thủ tục>',9,0,3),
        ('drop procedure <tên thủ tục>',9,1,3),
        ('drop store procedure <tên thủ tục>',9,0,3),
        ('delete store procedure <tên thủ tục>',9,0,3),
        
        ('<kiểu dữ liệu> @<tên tham số>',10,0,3),
        ('declare @<tên tham số> < kiểu dữ liệu>',10,1,3),
        ('var @<tên tham số> <kiểu dữ liệu>',10,0,3),
        ('@<tên tham số> <kiểu dữ liệu>',10,0,3),
        
        ('create procedure',11,0,3),
        ('begin',11,0,3),
        ('as',11,1,3),
        ('create',11,0,3),
        
        ('.java',12,0,2),
        ('.class',12,1,2),
        ('.com',12,0,2),
        ('.exe',12,0,2),
        
        ('Là một thành phần của Java platform dùng để đọc mã bytecode trong file .class',13,1,2),
        ('Là chương trình biên dịch của java dùng để biên dịch file nguồn java thành mã bytecode',13,0,2),
        ('Là chương trình chạy cho java',13,0,2),
        ('Tất cả các đáp án đều đúng',13,0,2),
        
        ('Microsoft Windows',14,0,4),
        ('Linux',14,0,4),
        ('Sun Solaris OS',14,0,4),
        ('Tất cả các đáp án đều đúng.',14,1,4),
        
        
        ('Thư viện mã nguồn của Java.',15,0,4),
        ('Là thư viện chứa các thành phần phần mềm tạo sẵn 
			cung cấp các chức năng cho chương trình Java.',15,1,4),
        ('Thư viện cung cấp giao diện đồ họa cho chương trình Java.',15,0,4),
        ('Tất cả đều sai.',15,0,4),
        
        ('Tất cả đáp án trên',16,1,4),
        ('Giao diện lập trình ứng dụng',16,0,4),
        ('Bộ công cụ giao diện người dùng',16,0,4),
        ('Thư viện tích hợp',16,0,4),
        
        ('1',17,0,5),
        ('2',17,0,5),
        ('3',17,1,5),
        ('4',17,0,5),
        
        ('public đứng trước static',18,0,6),
        ('static đứng trước public',18,0,6),
        ('Thứ tự bất kỳ nhưng thông thường public đứng trước',18,1,6),
        ('Tất cả đều sai.',18,0,6),
        
        ('public static void main(String[] a) {}',19,1,6),
        ('public static int main(String args) {}',19,0,6),
        ('public static main(String[] args) {}',19,0,6),
        ('public static final void main(String[] args) {}',19,0,6),
        
        ('/** chú thích */',20,0,2),
        ('/* chú thích */',20,0,2),
        ('/* chú thích',20,1,2),
        ('// chú thích',20,0,2),
        
        ('Đường dẫn chương trình sai.',21,1,6),
        ('Không có hàm main',21,0,6),
        ('Không khai báo class',21,0,6),
        ('Không có từ khóa public tại mở đầu khai báo class',21,0,6),
        
        ('Là một bó phần mềm gồm các hành vi và trạng thái có liên quan với nhau.',22,0,2),
        ('Là vật thể xác định của thế giới thực.',22,0,2),
        ('Là vật thể gồm hành vi và trạng thái.',22,0,2),
        ('Là các đối tượng được biểu diễn trong phần mềm gồm có 
			2 thuộc tính trường dữ liệu và các cách xử lý dữ liệu.',22,1,2),
        
        ('public class default {}',23,0,2),
        ('protected inner class engine {}',23,0,2),
        ('final class outer {}',23,1,2),
        ('Tất cả đều sai',23,0,2),
        
        ('1',24,1,6),
        ('2',24,0,6),
        ('3',24,0,6),
        ('4',24,0,6),
        
        ('2',25,0,2),
        ('3',25,0,2),
        ('4',25,0,2),
        ('Vô số',25,1,2),
        
        ('class Xedap1 extend Xedap {}',26,0,2),
        ('public classs Xedap1 extend Xedap {}',26,0,2),
        ('class Xedap1 extends Xedap {}',26,1,2),
        ('Tất cả đều sai.',26,0,2),
        
        ('Là lớp chứa các cách rỗng có liên quan với nhau.',27,0,4),
        ('Là một kiểu tham chiếu, tương tự như class, chỉ có thể chứa hằng giá trị, 
			khai báo cách và kiểu lồng.',27,1,4),
        ('Là một cách thực hiện của lớp khác.',27,0,4),
        ('Là lớp nối giữa lớp cơ sở và lớp cha.',27,0,4),
        
        ('7',28,0,2),
        ('8',28,1,2),
        ('9',28,0,2),
        ('5',28,0,2),
        
        ('1',29,0,2),
        ('2',29,0,2),
        ('3',29,0,2),
        ('Tất cả đều sai.',29,1,2),
        
        ('ngày thứ 1',30,0,5),
        ('Ngày thứ 19',30,1,5),
        ('Ngày thứ 36',30,0,5),
        ('Ngày thứ 42',30,0,5),
        
        ('2',31,0,5),
        ('3',31,1,5),
        ('4',31,0,5),
        ('5',31,0,5),
        
        ('79',32,0,5),
		('55',32,1,5),
        ('49',32,0,5),
        ('67',32,0,5),
        
        ('4950',33,1,4),
        ('4500',33,0,4),
        ('4850',33,0,4),
        ('4650',33,0,4),
        
        ('20',34,0,2),
        ('18',34,0,2),
        ('14',34,0,2),
        ('16',34,1,2),
        
        ('6',35,1,3),
        ('7',35,0,3),
        ('3',35,0,3),
        ('5',35,0,3),
        
        ('5',36,0,4),
        ('4',36,1,4),
        ('3',36,0,4),
        ('7',36,0,4),
        
        ('8',37,0,5),
        ('16',37,0,5),
        ('24',37,1,5),
        ('48',37,0,5),
        
        ('9',38,0,4),
        ('13',38,0,4),
        ('16',38,0,4),
        ('23',38,1,4),
        
        ('140',39,0,5),
        ('160',39,1,5),
        ('240',39,0,5),
        ('260',39,0,5),
        
        ('11',40,0,5),
        ('10',40,1,5),
        ('13',40,0,5),
        ('7',40,0,5),
        
        ('27',41,0,4),
        ('25',41,1,4),
        ('36',41,0,4),
        ('13',41,0,4),
        
        ('x - 40x',42,0,2),
        ('x - 24',42,0,2),
        ('40 - x',42,1,2),
        ('24 - x',42,0,2),
        
        ('Bình thấp hơn Nam.',43,0,5),
        ('Bình cao hơn Nam.',43,0,5),
        ('Bình cao bằng Nam.',43,0,5),
        ('Không nói được là Bình hay Nam cao hơn.',43,1,5),
        
        ('20 %',44,0,5),
		('24 %',44,0,5),
		('36 %',44,0,5),
		('44 %',44,1,5),
        
		('887, 890',45,0,6),
        ('888, 891',45,0,6),
        ('888, 890',45,1,6),
        ('889, 899',45,0,6),
        
        ('42',46,0,6),
        ('44',46,0,6),
        ('46',46,0,6),
        ('48',46,1,6),
        
        ('45',47,1,5),
        ('50',47,0,5),
        ('55',47,0,5),
        ('60',47,0,5),
        
        ('460',48,0,5),
        ('620',48,0,5),
        ('720',48,1,5),
        ('860',48,0,5);
        
INSERT INTO `Exam` (`Code`, CategoryID, Creator)
VALUES  			('EXAM01',1,3),
					('EXAM02',2,2),
                    ('EXAM03',3,4);
                    
INSERT INTO ExamQuestion (ExamID, QuestionID)
VALUES 					(1,2),
						(2,3),
                        (3,5);
                        
INSERT INTO ExamSet(ExamSetName, Creator)
VALUES 				('ES01', 2),
					('ES02', 4),
                    ('ES03', 6),
                    ('ES04', 3),
					('ES05', 5),
                    ('ES06', 4);
                    
INSERT INTO Candidate (FullName, PhoneNumber, ExamSetID, Creator)
VALUES					('Nguyễn Văn A','0965777888',2,2),
						('Nguyễn Thị B','0125555777',1,6),
                        ('Phạm Mạnh C','1900196966',3,4),
                        ('Lê Văn D','0293657854',6,4),
                        ('Cao Văn Q','0123568458',6,3),
                        ('Trần Thị E','0972568748',5,5);
                        
INSERT INTO EESet (ExamSetID, ExamID)
VALUES 				(1,2),
					(2,1),
                    (5,3),
                    (4,2),
                    (6,3),
                    (3,3);