create table reservation (
    reservationNum  number          not null,
    userID          varchar2(50)    not null,
    contentNum      number          not null,
    contentOwner     varchar2(50)    not null,   
    dateChoose      varchar2(20)    not null,
    memberChoose    number          not null,
    totalPrice      number          not null,
    reservationDate   date          default sysdate,
    primary key(reservationNum) 
);

drop table reservation;

create sequence reservation_seq;
drop sequence reservation_seq;

commit;
select * from reservation;


 insert into reservation (reservationNum, userID, contentNum,
  contentOwner, dateChoose, memberChoose, totalPrice)
     values (reservation_seq.nextval, 'jsg@jsg.com',
      21, 'jsg@jsg.com', '2022.2.22', 3, 200000);
   
 select * from content;
      
 select 
    r.reservationNum, r.userID, r.contentNum,
    r.contentOwner, r.dateChoose, r.memberChoose, r.totalPrice,
    c.contentName, c.contentThumbImg, c.contentSum
  from reservation r
    inner join content c
        on r.contentNum = c.contentNum
  where r.contentOwner = 'jsg@jsg.com'
        and c.contentOwner = 'jsg@jsg.com';
         
select 
    r.reservationNum, r.reservationDate, r.userID,
    r.dateChoose, r.memberChoose, r.totalPrice,
    c.contentName, c.contentThumbImg, c.contentSum,
    c.contentNum, c.contentOwner
  from reservation r
    inner join content c
        on r.contentNum = c.contentNum
  where r.userId = 'jsg@jsg.com';