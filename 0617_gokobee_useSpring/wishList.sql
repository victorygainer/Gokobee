create table wishList (
    wlNum     number          not null,
    userID      varchar2(50)    not null,
    contentNum  number          not null,
    addDate     date            default sysdate,
    primary key(wlNum, userId) 
);

drop table wishList;

select * from content;
select * from wishlist;

create sequence wishList_seq;

alter table wishList
    add constraint wishList_userID foreign key(userID)
    references userInfo(userID);

alter table wishList
    add constraint wishList_contentNum foreign key(contentNum)
    references content(contentNum);

insert into wishList (wlNum, userID, contentNum) values (wishList_seq.nextval, 'jsg@jsg.com', 21);

 select
     row_number() over(order by w.contentNum desc) as num,
     w.wlNum, w.userID, w.contentNum, w.addDate,
     c.contentName, c.contentPrice, c.contentThumbImg,
     c.cityCode, c.cateCode, c.contentSum
 from wishList w
     inner join content c
         on w.contentNum = c.contentNum   
     where w.userID = 'jsg@jsg.com';

commit;