/* 1.회원 테이블에서 이메일, 모바일, 이름, 주소 순으로 나오도록 검색하시오.
     (결과는 아래와 동일하게 나와야 하며, 전체 행의 개수는 31개입니다)
*/
SELECT Email
	 , Mobile
	 , Names
	 , addr
  FROM membertbl;
  
/* 2. 함수를 사용하여 아래와 같은 결과가 나오도록 쿼리를 작성하시오.
	  (전채 행의 개수는 59개입니다)
*/
SELECT Names AS '도서명'
	 , Author AS '저자'
     , ISBN
     , Price AS '정가'
  FROM bookstbl
 ORDER BY ISBN;
  
/* 3. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.
      (책을 한번도 빌린적이 없는 회원을 뜻합니다. 18명이 나옵니다.)
*/
SELECT m.Names AS '비대여자명'
	 , m.levels AS '등급'
     , m.addr AS '주소'
     , r.rentalDate AS '대여일'
  FROM membertbl m
  LEFT JOIN rentaltbl r ON m.Idx = r.memberIdx
 WHERE r.rentalDate IS NULL
 ORDER BY m.levels, m.Names;

/* 4. 다음과 같은 결과가 나오도록 SQL 문을 작성하시오.
*/
SELECT IFNULL(d.Names, '--합계--') AS '장르'
	 , CONCAT(FORMAT(SUM(b.price), 0), '원') AS '총합계금액'
  FROM divtbl d
  JOIN bookstbl b ON d.Division = b.Division
 GROUP BY d.Names
  WITH ROLLUP;