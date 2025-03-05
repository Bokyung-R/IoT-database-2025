-- 7-1 계절학기 테이블
DROP TABLE IF exists Summers; -- 기존 테이블이 존재하면 삭제

-- 계절학기 테이블 생성
create table Summer(
	sid 	integer,
    class	varchar(20),
    price 	integer
);

--
select * from Summer;

-- 기본 데이터 추가(MySQ에서는 한번에 다중데이터 insert 가능)
insert into Summer values(100,'JAVA',20000),(150,'PYTHON',15000),(200,'C',10000),(250,'JAVA',20000);

-- 계절학기듣는 학생의 학번과 수강과목
select sid
	 , class
  from Summer;
  
-- C 강좌 수강료는?
select price
  from Summer
 where class Like '%C%';
 
-- 수강료가 가장 비싼 과목은?
select distinct class
  from Summer
 where price = ( select max(price)
					from Summer
                    );
                    
-- 계절학기 학생수와 수강료 총액
select count(*) as '학생수'
	 , sum(price) as '수강료 총액'
  from Summer;
  
/* 이상현상(anormaly) */
 -- 삭제 이상
delete from Summer where sid = 200;

-- C 강좌 수강료를 찾을 수 없다
select price
  from Summer
 where class Like '%C%';
 
/* 삽입 이상 */
insert into Summer values(null,'C++', 25000);

select count(*) from Summer;

select count(sid) from Summer;

/* 수정이상 */
update Summer set
 price = 15000
 where sid = 100;
 
-- 
delete from Summer ;
 