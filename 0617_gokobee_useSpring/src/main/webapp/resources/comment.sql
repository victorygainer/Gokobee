create table usercomment (
    contentNum      number          not null,
    userID          varchar2(50)    not null,
    commentNum      number          not null,   
    commentDes      varchar2(2000)  not null,
    commentDate     date            default sysdate,
    primary key(commentNum) 
);

create sequence comment_idx_seq;
drop sequence comment_idx_seq;

		SELECT comment_idx_seq.nextval from userComment;

drop table usercomment;

select * from usercomment;

SELECT comment_idx_seq.nextval from userComment;

commit;

select count(*) from content where contentNum = 21;

select COMMENT_IDX_SEQ.nextval from usercomment;

select * from userComment where contentNum = 1;