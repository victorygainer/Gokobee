create table userInfo (
    userID      varchar2(50)    not null,
    userPassword    varchar2(100)   not null,
    regiDate    date            default sysdate,
    verify      number          default 0,
    primary key(userID)
);

select * from userInfo;
delete from userInfo;

update userInfo set verify = 9 where userID = 'jsg@jsg.com';
update userInfo set verify = 9 where userID = 'jsg1@jsg.com';
commit;