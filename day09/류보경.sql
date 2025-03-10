-- 1번
select Email as email
	 , Mobile as mobile
     , Names as names
     , Addr as addr
  from membertbl;
  
-- 2번
select Names as 도서명
	 , Author as 저자
     , ISBN
     , Price as 정가
  from bookstbl
order by ISBN;

-- 3번
select m.Names as '비대여자명'
	 , m.Levels as '등급'
     , m.Addr as '주소'
     , r.rentalDate as '대여일'
  from membertbl m left join rentaltbl r 
		on r.memberIdx = m.idx
 where r.memberIdx is null
order by m.Levels, m.Idx;

-- 4번
select ifnull(d.Names, '--합계--') as '장르'
	 , concat(format(sum(b.Price), 0), '원') as '총합계금액'
  from bookstbl b join divtbl d
			on b.Division = d.Division
group by d.Names with rollup;