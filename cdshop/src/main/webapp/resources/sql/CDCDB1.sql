drop database if exists cdcdb;
create database cdcdb default character set utf8 collate utf8_general_ci;
use cdcdb;
create table member
(
   m_num int not null auto_increment,
    m_email varchar(50) not null,
    m_name varchar(6) not null,
    m_pw varchar(20) not null,
    m_phone varchar(20) not null,
    m_post varchar(5) not null,
    m_addr1 varchar(100) not null,
    m_addr2 varchar(100) not null,
    m_level int default 1,
    primary key(m_num),
    unique key(m_name)
);

select * from member;
insert into member values(null, "admin@gmail.com", "관리자", "1234", "010-1111-1111", "11111", "창원시", "의창구", 2);
insert into member values(null, "seoh@naver.com", "서현", "1234", "010-3012-5225", "22222", "창원시", "의창구", 1);


create table product
(
    p_num int not null auto_increment,
    p_id varchar(10) not null,
    p_name varchar(30) not null,
    p_category varchar(10) not null,
    p_titlement varchar(30) not null,
    p_simpledescription varchar(100) not null,
    p_manufacturer varchar(10) not null,
    p_unitprice int not null,
    p_unitsinstock long not null,
    p_dfilename varchar(100) not null,
    p_tfilename varchar(100) not null,
    p_hit int not null default 1,
    primary key(p_num),
    unique key(p_id)
);

insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF001", "오리젠 오리지널 독", "dogfood", "이거는 개사료양", "이거 비슷하게하면 돼", "오리젠", 38000, 100, "orijendog1.png", "origendog.jpeg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF002", "나우", "dogfood", "이거는 개사료양", "이거 비슷하게하면 돼", "나우", 27000, 100, "nowdetail.jpg", "now.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DS001", "퓨어튜나스틱", "dogsnack", "이거는 개 간식이당", "이거 비슷하게하면 돼", "퍼스텝", 10000, 100, "stickdetail.jpg", "puretunastick.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DL001", "강아지 쿠션", "dogsup", "이거는 개쿠션이당", "이거 비슷하게하면 돼", "하이드앤울프", 30000, 100, "dogcushiondetail.jpg", "dogcushion.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DT001", "강아지 장난감", "dogtoy", "이건 강아지 장난감", "이거 비슷하게하면 돼", "바잇미", 20000, 100, "dogtoydetaile.jpg", "dogtoy.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("CF001", "오리젠 캣엔키튼", "catfood", "이거는 냥사료양", "이거 비슷하게하면 돼", "오리젠", 40000, 100, "origen1.jpg", "origen_catkitten.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("CS001", "고양이 트릿", "catsnack", "이거는 냥 간식이당", "이거 비슷하게하면 돼", "퍼스텝", 19000, 100, "catsnackdetail.jpg", "catsnack.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("CL001", "고양이 스크래쳐", "catsup", "이거는 냥이 스크래쳐", "이거 비슷하게하면 돼", "퍼스텝", 36000, 100, "catlivingdetail.jpg", "catliving.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("CT001", "고양이 낚시대", "cattoy", "이거는 고양이 장난감이양", "이거 비슷하게하면 돼", "벨버드", 10000, 100, "cattoydetail.jpg", "cattoy.jpg");

insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF003", "오리젠 오리지널 독", "dogfood", "강아지들이 좋아하는 맛", "✔ 완벽한 영양소 밸런스 <br>✔ 뛰어난 기호성<br>✔ 착한가격<br>✔ 착한 원재료 사용<br>", "오리젠", 38000, 100, "orijendog1.png", "origendog.jpeg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF004", "나우", "dogfood", "이거는 개사료양", "이거 비슷하게하면 돼", "나우", 27000, 100, "nowdetail.jpg", "now.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF005", "오리젠 오리지널 독", "dogfood", "강아지들이 좋아하는 맛", "✔ 완벽한 영양소 밸런스 <br>✔ 뛰어난 기호성<br>✔ 착한가격<br>✔ 착한 원재료 사용<br>", "오리젠", 38000, 100, "orijendog1.png", "origendog.jpeg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF006", "나우", "dogfood", "이거는 개사료양", "이거 비슷하게하면 돼", "나우", 27000, 100, "nowdetail.jpg", "now.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF007", "오리젠 오리지널 독", "dogfood", "강아지들이 좋아하는 맛", "✔ 완벽한 영양소 밸런스 <br>✔ 뛰어난 기호성<br>✔ 착한가격<br>✔ 착한 원재료 사용<br>", "오리젠", 38000, 100, "orijendog1.png", "origendog.jpeg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF008", "나우", "dogfood", "이거는 개사료양", "이거 비슷하게하면 돼", "나우", 27000, 100, "nowdetail.jpg", "now.jpg");
insert into product (p_id, p_name, p_category, p_titlement, p_simpledescription, p_manufacturer, 
p_unitprice, p_unitsinstock, p_dfilename, p_tfilename) values("DF009", "오리젠 오리지널 독", "dogfood", "강아지들이 좋아하는 맛", "✔ 완벽한 영양소 밸런스 <br>✔ 뛰어난 기호성<br>✔ 착한가격<br>✔ 착한 원재료 사용<br>", "오리젠", 38000, 100, "orijendog1.png", "origendog.jpeg");


drop table product;
select * from product;

create table buy
(
    b_num int not null auto_increment,
    o_num varchar(40) not null,
    p_id varchar(10) not null,
    p_name varchar(20) not null,
    m_name varchar(6) not null,
    b_qnt int not null,
    b_date varchar(20) not null,
    b_orderprice int not null,
    p_tfilename varchar(100) not null,
    p_price int not null,
    primary key(b_num),
    foreign key(m_name) references member(m_name)
);
drop table buy;

select * from buy;
select * from buy where m_name='서현' group by o_num;
create table buyproduct
(
   bp_num int not null auto_increment,
    o_num varchar(40) not null,
	m_name varchar(6) not null,
    p_id varchar(10) not null,
    p_price int not null,
    p_qnt int not null,
    p_tfilename varchar(100) not null,
    primary key(bp_num),
    foreign key(m_name) references member(m_name)
);
drop table buyproduct;

drop table buy;
select * from buy;
select b_date from buy where m_name="서현" group by b_date;
select o_num from buy where m_name="서현" group by o_num;


create table cart
(
    ca_id int not null auto_increment,
    m_name varchar(6) not null,
    p_id varchar(10) not null ,
    p_name varchar(30) not null,
    p_unitprice int not null,
    ca_qnt int not null,
    p_tfilename varchar(100) not null,
    primary key(ca_id),
    unique key(p_id),
    foreign key(m_name) references member(m_name)
);

select * from cart;
drop table cart;

create table commuboard
(
   cb_num int not null auto_increment,
    m_name varchar(6) not null,
    cb_board_type varchar(6) not null,
    cb_tagsrc varchar(12) not null,
    cb_tagvalue varchar(3) not null,
    cb_title varchar(100) not null,
    cb_content text not null,
    cb_regist_day varchar(30) not null,
    cb_hit int not null default 0,
    cb_recom int not null default 0,
    primary key(cb_num),
    foreign key(m_name) references member(m_name)
);
desc commuboard;
drop table commuboard;
select*from commuboard;
-- 테스트용 게시글 8개
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다1', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다2', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다3', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다4', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다5', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다6', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다7', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다8', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다9', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다10', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다11', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다12', 'test', '2023/03/14 12:12:12');
insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc', 'commu', 'cat', '테스트용입니다13', 'test', '2023/03/14 12:12:12');

update commuboard set cb_recom= cb_recom+1 where cb_title= '33333';

delete from commuboard where m_name='abc';
select*from commuboard order by cb_num desc;
select*from commuboard where cb_title like '%스트%' or cb_content like '%es%' order by cb_num desc;
select*from commuboard where cb_title like '%스트%' or cb_content like '%es%' order by cb_num desc limit 0,10;
select*from commuboard where cb_title like '%19%' or cb_content like '%19%' order by cb_num desc limit 10,10;
select*from commuboard order by cb_hit desc;
select*from commuboard where cb_recom >= 10 limit 5;


select count(*) from commuboard where cb_animal_type='cat';
select count(*) from commuboard where cb_title like '%스트%' or cb_content like '%스트%';


update commuboard 
   set cb_board_type='commu',
    cb_animal_type='cat',
    m_name='abc',
    cb_title='애옹',
    cb_content='431',
    cb_regist_day='2023/03/10 14:26:10',
    cb_filename='holong1.jpg',
    cb_hit=1
    where cb_num=1;
alter table commuboard add cb_tag varchar(10) not null;
alter table commuboard alter cb_filename set default null;
alter table commuboard alter cb_filename drop default;
alter table commuboard add cb_recom int not null default 0;

SELECT table_schema "Database", ROUND(SUM(data_length+index_length)/1024/1024,1) "used_MB" FROM information_schema.TABLES GROUP BY 1;

-- 더미데이터 생성을 위한 스토어드 프로시저
delimiter $$
drop procedure if exists insertloop;
create procedure insertloop()
begin
   declare i int default 1;
    while i <= 100 do
      insert into commuboard(m_name, cb_board_type, cb_animal_type, cb_title, cb_content, cb_regist_day) values('abc','자랑해요', 'cat', concat('테스트용입니다1',i), concat('test',i), '2023/03/14 12:12:12');
      set i = i+1;
   end while;
end $$
delimiter ;

call insertloop;

-- 아래 리콤은 추천테이블이다 해당 테이블에 대한 로직을 작성하려면 아직 이해도가 부족하기때문에 나중에 작성하다 해당 테이블과 관련된 모든 sql문은 현재 사용해서는 안된다
create table recom
(
   recom_num int auto_increment,
    m_name varchar(6) not null,
    cb_num int not null,
    recom_chk boolean default false,
    primary key(recom_num),
    foreign key (cb_num) references commuboard(cb_num),
   foreign key (m_name) references member(m_name) 
);

insert into recom(m_name, cb_num, recom_chk) values('admin',38,true);
update commuboard as cb
   set cb.cb_recom = 
      (
         select count(*)
         from recom as r
         where r.cb_num = cb.cb_num and r.recom_chk =true
      );

select*from recom;
drop table recom;
create table cb_comments
(
   c_num int not null auto_increment,
    m_name varchar(6) not null,
    cb_num int not null,
    c_comment text not null,
    c_date timestamp not null default current_timestamp,
    c_parent_num int default null,
    c_depth int not null default 0,
    c_order int not null default 1,
    primary key(c_num),
    foreign key(m_name) references member (m_name),
    foreign key(cb_num) references commuboard (cb_num)
);
select*from cb_comments;
select*from cb_comments where cb_num=14 order by c_order;
INSERT INTO cb_comments (m_name, cb_num, c_comment, c_order)
VALUES ('abc',14,'등록해요', (SELECT COALESCE(MAX(c_order), 0) + 1 FROM cb_comments WHERE cb_num = 14));
delete from cb_comments where c_num=1 and cb_num=109;

-- 댓글과 대댓글 테이블 따로 하려고 했는데 하나의 테이블로도 할 수 있을꺼 같아서 아래 테이블을 폐기
create table reply(
	r_num int not null auto_increment primary key,
    r_content text not null,
    m_name varchar(6) not null,
    c_num int not null,
    r_date timestamp not null default current_timestamp,
    foreign key(m_name) references member(m_name),
    foreign key(c_num) references comment(c_num)
);
drop table cb_comments;
drop table reply;

create table chat
(
   c_num int not null auto_increment,
    m_name varchar(6) not null,
    c_content text not null,
    c_date date not null,
    primary key(c_num),
    foreign key(m_name) references member(m_name)
);

create table qnaboard(
   qb_num int not null auto_increment,
    m_name varchar(6) not null,
    qb_board_type varchar(6) not null,
    qb_tagsrc varchar(12) not null,
    qb_tagvalue varchar(3) not null,
    qb_title varchar(100) not null,
    qb_content text not null,
    qb_regist_day varchar(30) not null,
    qb_hit int not null default 0,
    qb_recom int not null default 0,
    primary key(qb_num),
    foreign key(m_name) references member(m_name)
);
drop table qnaboard;
select*from qnaboard;
create table noticeboard(
   nb_num int not null auto_increment,
    m_name varchar(6) not null,
    nb_board_type varchar(6) not null,
    nb_title varchar(100) not null,
    nb_content text not null,
    nb_regist_day varchar(30) not null,
    nb_hit int not null default 0,
    primary key(nb_num),
    foreign key(m_name) references member(m_name)
);
select*from noticeboard;
drop table noticeboard;
create table eventboard(
   eb_num int not null auto_increment,
    m_name varchar(6) not null,
    eb_board_type varchar(6) not null,
    eb_title varchar(100) not null,
    eb_content text not null,
    eb_regist_day varchar(30) not null,
    eb_hit int not null default 0,
    eb_recom int not null default 0,
    primary key(eb_num),
    foreign key(m_name) references member(m_name)
);
insert into noticeboard(m_name, nb_board_type, nb_title, nb_content, nb_regist_day, nb_hit) values('admin','공지사항','첫번째','내용','2023/04/04 10:10:10',0);
select*from noticeboard;
select*from eventboard;
create table hosreviewboard(
   hvb_num int not null auto_increment,
    m_name varchar(6) not null,
    hvb_board_type varchar(6) not null,
    hvb_tagsrc varchar(12) not null,
    hvb_tagvalue varchar(3) not null,
    hvb_title varchar(100) not null,
    hvb_content text not null,
    hvb_regist_day varchar(30) not null,
    hvb_hit int not null default 0,
    hvb_recom int not null default 0,
    primary key(hvb_num),
    foreign key(m_name) references member(m_name)
);
drop table hosreviewboard;

CREATE TABLE boardfile (
  bf_num INT NOT NULL AUTO_INCREMENT,
  board_type VARCHAR(50) NOT NULL,
  cb_num INT DEFAULT NULL,
  qb_num INT DEFAULT NULL,
  nb_num INT DEFAULT NULL,
  eb_num INT DEFAULT NULL,
  hvb_num INT DEFAULT NULL,
  filename VARCHAR(255) NOT NULL,
  PRIMARY KEY (bf_num),
  FOREIGN KEY (cb_num) REFERENCES commuboard(cb_num) on delete cascade,
  FOREIGN KEY (qb_num) REFERENCES qnaboard(qb_num) on delete cascade,
  FOREIGN KEY (nb_num) REFERENCES noticeboard(nb_num) on delete cascade,
  FOREIGN KEY (eb_num) REFERENCES eventboard(eb_num) on delete cascade,
  FOREIGN KEY (hvb_num) REFERENCES hosreviewboard(hvb_num) on delete cascade
);
drop table boardfile;
select*from boardfile;
alter table boardfile change column file_name filename varchar(255) not null;

insert into boardfile(board_type, cb_num, file_name) values('자랑해요',302,'naver.jpg');

create table tc
(
	c_num int not null auto_increment primary key,
    m_name varchar(20) not null,
    c_bt varchar(10) not null,
    c_title varchar(100) not null
);
create table tq
(
	q_num int not null auto_increment primary key,
    m_name varchar(20) not null,
    q_bt varchar(10) not null,
    q_title varchar(100) not null
);
insert into tc(m_name, c_bt, c_title) values('abc','자랑해요','자랑테스트1');
insert into tc(m_name, c_bt, c_title) values('abc','자랑해요','자랑테스트2');
insert into tc(m_name, c_bt, c_title) values('abc','자랑해요','자랑테스트3');
insert into tq(m_name, q_bt, q_title) values('abc','Q&A','Q&A테스트1');
insert into tq(m_name, q_bt, q_title) values('abc','Q&A','Q&A테스트2');
insert into tq(m_name, q_bt, q_title) values('abc','Q&A','Q&A테스트3');

SELECT c_num, m_name, c_bt, c_title FROM tc
UNION ALL
SELECT q_num, m_name, q_bt, q_title FROM tq;

SELECT c_num AS id, m_name, c_bt AS boardtype, c_title AS title FROM tc
UNION ALL
SELECT q_num AS id, m_name, q_bt AS boardtype, q_title AS title FROM tq;

SELECT c_num AS 'c_num', NULL AS q_num, m_name, c_bt AS boardtype, c_title AS title FROM tc
UNION ALL
SELECT NULL AS c_num, q_num AS 'c_num or q_num', m_name, q_bt AS boardtype, q_title AS title FROM tq;

select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard
union all
select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard
order by regist_day desc limit 10;

 select * from boardfile where board_type=? and cb_num=?;

create table file(
	f_num int not null auto_increment primary key,
    c_num int null,
    q_num int null,
    boardtype varchar(5) not null,
    filename varchar(100) not null,
    foreign key(c_num) references tc(c_num),
    foreign key(q_num) references tq(q_num)
);

insert into file(c_num, boardtype, filename) values(1,'자랑해요','catface.png');
insert into file(q_num, boardtype, filename) values(3,'Q&A','catface.png');

SELECT f.*
FROM file f
INNER JOIN (
    SELECT c_num, c_bt as boardtype, c_title FROM tc
    UNION ALL
    SELECT q_num, q_bt as boardtype, q_title FROM tq
) t ON (f.c_num = t.c_num OR f.q_num = t.c_num)
    AND f.boardtype = t.boardtype;
    
select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard 
union all
select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard
order by regist_day desc limit 0,10;

select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard
where cb_title like '%우리%' or cb_content like '%우리%' 
union all
select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard
where qb_title like '%우리%' or qb_content like '%우리%' 
order by regist_day desc limit 0,10;

select cb_num, null as qb_num, m_name, cb_board_type as boardtype, cb_tagsrc as tagsrc, cb_tagvalue as tagvalue, cb_title as title, cb_content as content, cb_regist_day as regist_day, cb_hit as hit, cb_recom as recom from commuboard
where cb_recom >= 10 and cb_title like '%스트%' or cb_content like '%스트%' 
union all
select null as cb_num, qb_num, m_name, qb_board_type as boardtype, qb_tagsrc as tagsrc, qb_tagvalue as tagvalue, qb_title as title, qb_content as content, qb_regist_day as regist_day, qb_hit as hit, qb_recom as recom from qnaboard
where qb_recom >= 10 and qb_title like '%스트%' or qb_content like '%스트%' 
order by regist_day desc;

select count(*) from commuboard where cb_recom >= 10;

select*from qnaboard;