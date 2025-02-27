-- 내장함수alter--
-- 4-1 : 78과 78의 절대값을 구하시오
select ABS(78), ABS(-78);

-- 4-2 : 4.875를 소수점 첫번째 자리까지 반올림 하시오
select round(4.875, 1) AS 결과;

-- 4-3 : 고객별 평균 주문 금액을 100원 단위로 반올림한 값을 구하시오.
select custid, ROUND(SUM(saleprice) / COUNT(*), -2 ) AS '평균금액  '
  from Orders
GROUP BY custid;

-- 문자열 내장함수
-- 4-4 : 도서 제목에서 야구가 포함된 도서명을 농구로 변경한 후 목록을 출력하시오
select bookid
	 , replace(bookname, '야구','농구') as bookname
     , publisher
     , price
  from Book;
  
-- 추가
select 'hello' 'MySQL';

select concat('hello','MySQL', 'Wow');

-- 4-5 : 굿스포츠에서 출판한 도서의 제목과 제목의 문자수, 바이트수를 구하시오
select bookname AS '제목'
	 , char_length(bookname) as '제목 문자수' -- 글자 길이를 구할 때
     , length(bookname) as '바이트수' -- utf8에서 한글 한글자의 바이트수는 3bytes
  from Book
 where publisher = '굿스포츠';
 
-- 4-6 : 고객 중 성이 같은 사람이 몇 명이나 되는지 성(姓)별 인원수를 구하시오.
-- substr(자를원본문자열, 시작 인덱스, 길이)
-- DB는 인덱스를 1부터 시작 !!! (프로그래밍 언어와 차이점)
select substr(name,1,1) as '성씨 분류'
	 , count(*)
  from Customer
group by substr(name,1,1);

-- 추가. trim
select concat('--',trim('    hello    '),'--');
select concat('--',ltrim('    hello    '),'--');
select concat('--',rtrim('    hello    '),'--');

-- 새롭게 추가된 trim() 함수
select trim('=' from '=== -hello- ===');

-- 날짜 시간 함수
select sysdate(); -- DOCKER 서버 시간을 따라서 GMT(그리니치 표준시)를 다름 + 9hours

select adddate(sysdate(), interval 0 hour) as '한국시간';

-- 4-5 : 마당서점은  주물일부터 10일 후에 매출을 확정합니다. 각 주문의 확정일자를 구하시오.
select orderid as '주문번호'
	 , orderdate as '주문일자'
     , adddate(orderdate, interval 10 day) as '확정일자'
  from Orders;
  
-- 추가
select sysdate() as '기본날짜/시간'
	 , date_format(sysdate(), '%M/%d/%Y %H:%m:%s');
     
-- 4-6 : 2014년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 나타내시오.
-- 단, 주문일은 %Y/%m/%d 형태로 표시한다
-- %Y : 년도전체, &y : 년도 뒤 2자리, %M : 월(July), %b : 월약어(Jul),%m : 월숫자(07)
-- %d : 일, %H : 24시체계(16시), %h : 12시체계(4시), %W : 요일(Monday), %m : 요일번호(1)[일요일이 0]
-- %p : AM/PM 
select orderid as '주문번호'
	 , date_format(orderdate,'%Y/%m/%d') as '주문일'
     , custid as '고객번호'
     , bookid as '도서번호'
  from Orders;
  
-- DATEDIFF : D-day
select datediff(sysdate(), '2025-02-03');

-- Formatting, 1000 단위마다 , 넣기
select bookid
	 , format(price, 0) as price
  from MyBook;

-- NULL = Python None과 동일 . 다른 모든 프로그래밍 언어에서는 전부 NULL, NUL
-- 추가. 금액이 NULL일때 발생되는 현상
select price - 5000
  from MyBook
 where bookid = 3;
 
-- 핵심. 집계함수가 다 꼬임
select SUM(price) as '합산은 문제없음'
	 , AVG(price) as '평균은 null이 빠져서 꼬임'
     , count(*) as '모든 행의 개수는 일치'
     , count(price) as 'null값은 갯수에서 빠짐'
  from MyBook;
  
-- NULL 값 확인. NULL은 비교연산자 (=, >, <, <>, ...) 사용불가
-- IS 키워드 사용
select *
  from MyBook
 where price is null; -- 반대는 is not null
 -- NULL != ''
 
 -- IFNULL 함수
 -- 보기에만 그렇게 보이고 실제로 값은 변경되지않음.
 select bookid
	  , bookname
      , ifnull(price, 0) as price
  from MyBook;