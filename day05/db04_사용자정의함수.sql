-- 사용자 정의 함수. 내장 함수 반대. 개발자가 직접 만드는 함수
-- 저장 프로시저와 유사. returns, return 키워드가 차이남
select char_length('hello world');

delimiter //
create function fnc_Interest(
	price integer
) returns integer
begin
	declare myInterest	integer;
    -- 가격이 3만원이상이면 10%, 아니면 5%
    if price <= 30000 then set myInterest = price * 0.1;
    else set myInterest = price * 0.05;
    end if;
    return myInterest;
end;

-- 실행
select custid, orderid, saleprice, fnc_Interest(saleprice)
  from Orders;