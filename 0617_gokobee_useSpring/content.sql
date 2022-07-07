
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
        
insert into contentCategory (cateName, cateCode) values ('����', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '101', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�λ�', '102', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�뱸', '103', '100');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('��õ', '104', '100');       
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '105', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '106', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('���', '107', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '108', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('���', '109', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '110', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('���', '111', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('���', '112', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�泲', '113', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '114', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '115', '100');        
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '116', '100');        

        
insert into contentCategory (cateName, cateCode) values ('ī�װ�', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('���̵�����', '201', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('��Ƽ��Ƽ', '202', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('���Ÿ�', '203', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('��������', '204', '200');


insert into contentCategory (cateName, cateCode) values ('��ǰ�±�', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�ڹ���/�̼���', '201', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('��������', '202', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����', '203', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('ķ�۽�/���ǽ�', '204', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�׸���ũ', '205', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('��Ƽ����', '206', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�Ⱦ�/����', '207', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('ķ��', '208', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�ٱ�', '209', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�̻�ü��', '210', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('����/ī��', '211', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('ũ����/��Ʈ', '212', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('Ŭ����', '213', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�뿪/����Ͻ�', '214', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('������', '215', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('�߰�', '216', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('��������', '217', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('��/������', '218', '200');
insert into contentCategory (cateName, cateCode, cateCodeRef) values ('������', '219', '200');

select * from contentCategory;
delete from contentCategory;

select level, cateName, cateCode, cateCodeRef from contentCategory
    start with cateCodeRef is null connect by prior cateCode = cateCodeRef;
    
alter table content add (contentThumbImg varchar(200));    
    
commit;