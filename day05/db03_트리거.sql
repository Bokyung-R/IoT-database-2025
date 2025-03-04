-- 트리거
-- 시작전 설정 변경
-- 다음버전 MySQL에서는 사라질 예정(Deprecated)
set global log_bin_trust_function_creators=ON;

-- Book_log 테이블을 생성
create table Book_log(
	bookid_l		integer,
    bookname_l		varchar(40),
    publisher_l		varchar(40),
    price_l			integer
);

-- 트리거 생성
-- update나 delete 시에는 old. 라고 사용 after update on 테이블명...
--
delimiter //
create trigger AfterInsertBook
	after insert on Book for each row	/* 트리거가 Book 테이블에 데이터가 추가되면 바로 발동! */
begin
	declare average integer;
    insert into Book_log
    values (new.bookid, new.bookname, new.publisher, new.price);
end;

-- Book테이블에 insert 실행
insert into Book
values (40,'안드로이드는 전기양의 꿈을 꾸는가', '이상미디어', 25000);