-- INSERT
-- 3-44 Book테이블에 '스포츠 의학' 도서를 추가하세요. 한솔의학서적에서 출간했고, 90,000원입니다.
INSERT INTO Book (bookid, bookname, publisher, price)
VALUES (11, '스포츠 의학', '한솔의학서적', 90000);

SELECT * FROM Book;

-- 컬럼명생략
INSERT INTO Book VALUES (12, '스타워즈 아트북', '디즈니', 150000);

INSERT INTO Book VALUES (12, '어벤져스 스토리', '디즈니', 50000);	-- 기본키 12가 이미 있으므로 안됨

-- 다중 데이터 입력
INSERT INTO Book (bookid, bookname,publisher,price)
VALUES (13, '기타교본 1', '지미 핸드릭스', 12000),
	   (14, '기타교본 2', '지미 핸드릭스', 12000),
	   (15, '기타교본 3', '지미 핸드릭스', 15000);
       
-- 3-46 Imported_book 에 있는 데이터를 Book 테이블에 데이터를 모두 삽입하시오.
-- 한 테이블에 있는 많은 데이터를 다른 테이블로 복사하는 데 가장효과적인 방법
INSERT INTO Imported_Book VALUES (21, 'Zen Golf', 'Pearson', 12000), (22, 'Soccer Skills', 'Human Kinetics', 15000);

INSERT INTO Book (bookid, bookname,publisher,price)
SELECT bookid, bookname,publisher,price
  FROM Imported_Book;
  
-- 추가. 테이블의 수자형 타입으로 된 PK값이 자동으로 증가하도록 만들고 사용하려면...
CREATE TABLE NewBook (
	bookid 		integer		primary key auto_increment, -- auto_increment는 숫자 자동증가조건
    bookname 	varchar(50) not null,
    publisher 	varchar(50) not null,
    price 		int			null -- null은 생략가능
);

-- 자동증가에는 PK 컬럼을 사용하지 않음!
INSERT INTO NewBook (bookname, publisher, price)
VALUES ('알라딘 아트북4', '디즈니', 100000);

select * from NewBook;

delete from NewBook where bookid = 3;

-- PK 자동증가는 편리함. 단, 지워진 PK를 다시 쓸 수 없음. RDB의 규칙때문에
-- INSERT시 자동증가 컬럼은 코드에 기입하지 않음

-- UPDATE 
-- 3-47 Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산' 으로 변경하시오.
select * from Customer;

update Customer
   set 
	   address = '대한민국 부산'
 where custid = 5;
 
-- 3-48 Book 테이블의 14번 '스포츠 의학'의 출판사를 
-- imported_book 테이블에 있는 21번 책의 출판사와 동일하게 변경하시오.
select *
  from Book
 where bookid =14;

select *
  from Imported_Book
 where bookid = 21;
 
update Book
   set bookname = '스포츠 의학'
     , publisher = (select publisher
					  from Imported_Book
					 where bookid = 21)
 where bookid = 14;
 
-- 추가. 데이터 수정시 조심할 것!
select *
  from NewBook;

-- WHERE 절 없이 UPDATE 하지말 것(자살행위!)
update NewBook
   set bookname = 80000
 where bookid = 3;
 
-- DELETE 데이터 삭제
-- 3-49 Book 테이블에서 도서번호가 11번인 도서를 삭제하시오.
DELETE FROM Book
 WHERE bookid = 15;
 
-- 지우고나서 확인 필요
SELECT * FROM Book;

-- 3-50 NewBook의 모든 데이터를 삭제하시오
-- 하지마세요!! WHERE절로 필요한 데이터만 삭제하세요
DELETE FROM NewBook;