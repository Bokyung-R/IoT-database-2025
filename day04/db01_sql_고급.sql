-- 행번호
-- 4-11 고객목록에서 고객번호, 이름, 전화번호를 앞의 2명만 출력하시오.
SET @seq := 0; -- 변수 선언 set으로 시작하고 @를 붙임. 값 할당이 = 이 아니라 := 임 

SELECT (@seq := @seq +1) AS '행번호'
	 , custid
     , name
     , phone
  FROM Customer
 WHERE @seq < 2;
 
SELECT (@seq := @seq +1) AS '행번호' -- custid
	 , name
     , phone
  FROM Customer LIMIT 2; -- 순차적인 일부 데이터 추출에는 훨씬 탁원
  
-- 특정 범위 추출
SELECT custid
	 , name
     , phone
  FROM Customer LIMIT 2 OFFSET 3; -- 3번째 행부터 2개 추출하라.
  

  
