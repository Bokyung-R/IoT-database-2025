-- 뷰
-- DDL CREATE로 뷰를 생성
create view v_orders
	as 
SELECT o.orderid
	 , c.custid
     , c.name
     , b.bookid
     , b.bookname
     , b.price
     , o.saleprice
     , o.orderdate
  FROM Customer as c, Book as b, Orders as o
 WHERE c.custid = o.custid
   AND b.bookid = o.bookid;
   
-- 뷰 실행 - 위의 조인쿼리 실행
-- SQL 테이블로 할 수 있는 쿼리는 다 실행가능
select *
  from v_orders
 where name = '장미란';
 
-- 4-20 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오
-- 뷰의 이름은 vw_Customer 설정합니다.
create or replace view vw_Customer
	as
select *
  from Customer
 where address like '%대한민국%';
 
select * from vw_Customer;

-- 추가. 뷰로 insert 할 수 있음 update, delete도 가능
-- 단, 뷰의 테이블이 하나여야함. 관계에서 자식테이블의 뷰는 insert 불가
-- 이렇게 넣으면 vw_Customer에 추가되는 것이 아닌, 원래 테이블 Custimer에 추가됨 
insert into vw_Customer
	 values (7,'손흥민', '영국',  '010-9999-9999');
     
-- 4-23 vw_Customer 를 삭제하라
drop view vw_Customer;