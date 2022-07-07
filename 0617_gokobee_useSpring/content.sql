
create table content (
    contentNum       number          not null,
    cityCode         varchar2(20)    not null,
    cateCode         varchar2(30)    not null,
    contentTag       varchar2(50)    not null,
    contentName      varchar2(50)    not null,
    contentOwner     varchar2(50)    not null,
    contentPrice     number          not null,
    contentSum       varchar(200)    not null,
    contentDes       varchar(500)    not null,
    contentImg       varchar(200)    not null,
    contentThumbImg  varchar(200)    not null,
    contentDate      date            default sysdate,
    primary key(contentNum)  
);

drop table content;

SELECT content_idx_seq.nextval + 1 from userComment;


create sequence content_idx_seq;
drop sequence content_idx_seq;

create table contentCategory (
    cateName     varchar2(20)    not null,
    cateCode     varchar2(30)    not null,
    cateCodeRef  varchar2(30)    null,
    primary key(cateCode),
    foreign key(cateCodeRef) references contentCategory(cateCode)
);

select * from contentCategory;

commit;

select * from content;
delete from content;

alter table content add
    constraint fk_contentCategory
    foreign key (cateCode)
        references contentCategory(cateCode);
        
insert into contentCategory (cateName, cateCode) values ('도시', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('서울', '101', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('부산', '102', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('대구', '103', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('인천', '104', '100');       
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('광주', '105', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('대전', '106', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('울산', '107', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('세종', '108', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('경기', '109', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('강원', '110', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('충북', '111', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('경북', '112', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('경남', '113', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('전북', '114', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('전남', '115', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('제주', '116', '100');        

        
insert into contentCategory (cateName, cateCode) values ('카테고리', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('가이드투어', '201', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('액티비티', '202', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('즐길거리', '203', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('여행편의', '204', '200');


insert into contentCategory (cateName, cateCode) values ('상품태그', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('박물관/미술관', '201', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('국립공원', '202', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('쇼핑', '203', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('캠퍼스/오피스', '204', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('테마파크', '205', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('시티투어', '206', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('픽업/샌딩', '207', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('캠핑', '208', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('근교', '209', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('이색체험', '210', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('맛집/카페', '211', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('크루즈/요트', '212', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('클래스', '213', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('통역/비즈니스', '214', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('스포츠', '215', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('야경', '216', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('로컬투어', '217', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('쇼/뮤지컬', '218', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('자전거', '219', '200');

select * from contentCategory;
delete from contentCategory;

select level, cateName, cateCode, cateCodeRef from contentCategory
    start with cateCodeRef is null connect by prior cateCode = cateCodeRef;
    
alter table content add (contentThumbImg varchar(200));    
    
commit;