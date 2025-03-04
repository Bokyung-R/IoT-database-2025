-- 5-4 Orders 테이블의 판매 도서에 대한 이익금을 계산하는 프로시저
DELIMITER //
create procedure GetInterest(

)
begin
	-- 변수 선언
    declare myInterest float default 0.0;
    declare price integer;
    declare endOfRow boolean default false;
    declare InterestCursor cursor for
			select saleprice from Orders;
	declare continue handler 
			for not found set endOfRow = true;
            
	-- 커서 오픈
    open InterestCursor;
    cursor_loop: LOOP
		fetch InterestCursor into price; -- select saleprice from Orders의 테이블을 한 행씩 읽어서 값을 price에 집어넣는다.
        if endOfRow then leave cursor_loop; -- python break;
        end if;
        if price >= 30000 then -- 판매가가 3만원 이상이면 10% 이윤을 챙기고, 그 이하면 5% 이윤을 챙기자
			set myInterest = myInterest + price * 0.1;
        else
			set myInterest = myInterest + price * 0.05;
        end if;
    END LOOP cursor_loop;
    close InterestCursor; -- 커서 종료
    
    -- 결과 출력
    select concat('전체 이익 금액 = ', myInterest) as 'Interest';
end;

-- 저장프로시저 실행
call GetInterest();