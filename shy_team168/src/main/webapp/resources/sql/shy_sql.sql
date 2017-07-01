-------------------------------------------
--파
select *
from
(select snsno,fk_idx
from tbl_shymemo
)A 
left join
;

insert into tbl_like(likeno,fk_likeidx,liketype,likedate,snsno)
values(seq_tbl_like.nextval,53,1,sysdate,76);
select *
from tbl_like;
commit;
select *
from tbl_shymemo;
delete from tbl_like ;
select *
from tbl_storeboard;

select *
from tbl_comment;

select snsno,nvl2(case when count(*)>0 then count(*) else 0 end,0,count(*))
from tbl_comment 
where status = 1 and snsno =71
group by snsno;

select case when nvl(snsno,0)<1 then 0 else 1 end
from
(select snsno,case when count(*)>0 then count(*) else 0 end
from tbl_comment 
where status = 1 and snsno =null
group by snsno)
V;

--내가 좋아요 누른 샤이
select V.*
from
(select A.snsno,A.fk_idx,B.likeno,B.fk_likeidx, B.likedate
from tbl_shymemo A join tbl_like B
on A.snsno = B.snsno)
V
where V.fk_likeidx=32;



--가게리뷰글좋아요
select A.storeboardno,A.fk_businessno,A.fk_idx,B.likeno,B.fk_likeidx, B.likedate
from tbl_storeboard A join tbl_like B
on A.storeboardno = B.storeboardno;

--그룹게시글좋아요
select A.grpboardseq,A.gpdetailno,B.likeno,B.fk_likeidx, B.likedate
from tbl_grpboard A join tbl_like B
on A.grpboardseq = B.grpboardseq;
=======
select A.groupno, A.fk_idx, B.myimg,B.name ,gname, A.description, A.gimg, A.status, A.groupdate, A.gcount,
				 rank() over (order by A.gcount desc) as rank
from
(select  groupno, fk_idx, gname, description, gimg, status, groupdate, gcount,
				 rank() over (order by gcount desc) as rank
		 from tbl_group
		 where status in(1,2)
		 order by rank) A
     left join tbl_shymember B
     on A.fk_idx = B.idx;
     select A.groupno, A.fk_idx, A.gname, A.description,A.groupdate, A.status, A.gimg, A.gcount,
				 rank() over (order by A.gcount desc) as rank, B.myimg, B.name
		 from
		 (select  groupno, fk_idx, gname, description, gimg, status, groupdate, gcount
		 from tbl_group
		 where status in(1,2)
		 order by groupdate desc) A
	     left join tbl_shymember B
	     on A.fk_idx = B.idx
	     order by groupdate desc;
     
     delete from tbl_group;
     delete from tbl_gmember;
     delete from tbl_grpboard;
 select  groupno, fk_idx, gname,to_char(groupdate,'yyyy-mm-dd hh:mi')
		 from tbl_group
		 where to_char(groupdate,'yyyy-mm-dd hh:mi') = to_char(sysdate,'yyyy-mm-dd hh:mi');
commit;
select *
from tbl_gmember;
select A.groupno, A.fk_idx, B.myimg,B.name ,gname, A.description, A.gimg, A.status, A.groupdate, A.gcount
from
(select  *
		 from tbl_group
		 where fk_idx=33 and status in(1,2,3))A
     left join tbl_shymember B
     on A.fk_idx = B.idx;

SELECT A.SNSNO , NVL(B.CNT , 0) as total , 
case when (SELECT count(snsno) FROM TBL_like WHERE fk_likeidx=32 and SNSNO IN (77 , 90,76))>0 then (SELECT count(snsno) FROM TBL_like WHERE fk_likeidx=32 and SNSNO IN (77 , 90,76)) else 1 end as status
FROM (SELECT * FROM TBL_SHYMEMO WHERE SNSNO IN (77 , 90,76)) A 

      LEFT OUTER JOIN  
      (SELECT SNSNO , COUNT(SNSNO) AS CNT FROM TBL_LIKE GROUP BY SNSNO) B
      
      ON A.SNSNO = B.SNSNO;

SELECT A.SNSNO , NVL(B.CNT , 0) AS TOTALCOUNT , case when NVL(C.snsno , 0) > 0 then 1 else 0 end AS MYLIKESTAT
FROM (SELECT * FROM TBL_SHYMEMO WHERE SNSNO IN (77 , 90, 76)) A 

      LEFT OUTER JOIN  
      (SELECT SNSNO , COUNT(SNSNO) AS CNT FROM TBL_LIKE GROUP BY SNSNO) B
      
      ON A.SNSNO = B.SNSNO LEFT OUTER join 
      (SELECT SNSNO FROM tbl_like WHERE FK_LIKEIDX=32 and liketype=1 GROUP BY SNSNO) c on b.snsno=c.snsno;
>>>>>>> branch 'master' of https://github.com/ottocazi/shy_team168.git

alter table tbl_grpboard
add imgyn NUMBER default 0;

select * from tbl_group;
delete from tbl_group where groupno=14;

commit;
delete from tbl_like;

alter table tbl_grpboard
drop column imgyn;

select *
from tbl_grpboard;

select *
from tbl_gmember
where fk_groupidx=33 and fk_groupno=1; 

select case( select count(*)
	                 from tbl_gmember
	                 where fk_groupidx=53 and fk_groupno=2 )
	           when 1 then 1
                   else 0
	           end as checkmember
from dual;

delete from tbl_gmember where gpdetailno=9;

select T.*
from
(
select C.name,C.email,C.myimg,V.*
from tbl_shymember C join
(
select A.fk_groupno,A.fk_groupidx,B.grpboardseq,B.gpdetailno,B.gcontent,B.uploadfile,B.writedate,B.likecnt,B.cmtcnt,B.imgyn,B.status
from tbl_gmember A join tbl_grpboard B
on A.gpdetailno = B.gpdetailno)V
on C.idx = V.fk_groupidx
)T
where T.fk_groupno=2;

select name,email,myimg,fk_groupno,fk_groupidx,grpboardseq,gpdetailno,gcontent,uploadfile,writedate,likecnt,cmtcnt,imgyn,status
		from
		(
		select C.name,C.email,C.myimg,V.*
		from tbl_shymember C join
		(
		select A.fk_groupno,A.fk_groupidx,B.grpboardseq,B.gpdetailno,B.gcontent,B.uploadfile,B.writedate,B.likecnt,B.cmtcnt,B.imgyn,B.status
		from tbl_gmember A join tbl_grpboard B
		on A.gpdetailno = B.gpdetailno)V
		on C.idx = V.fk_groupidx
		)T
		where T.fk_groupno=2;

update tbl_grpboard set imgyn = 1
where grpboardseq = 2;

select gpdetailno
from
(
select C.idx,V.*
from tbl_shymember C join
(
select A.groupno,B.gpdetailno ,B.fk_groupidx
from tbl_group A join  tbl_gmember B
on A.groupno = B.fk_groupno)V
on C.idx = V.fk_groupidx
)T
where T.idx = 33;

select *
from tbl_gmember
order by rank;

 select name,email,myimg, groupno , gpdetailno, fk_groupidx, gregisterdate, status
		 from
		  (select C.name,C.email,C.myimg, V.*
		  from tbl_shymember C join 
		  (
		   select A.groupno ,B.gpdetailno,B.fk_groupidx,B.gregisterdate,B.status
		   from tbl_group A join tbl_gmember B 
		   on A.groupno = B.fk_groupno
		  )V
		  on V.fk_groupidx=C.idx)T
		 where T.groupno = 2;

select *
from tbl_log;

delete from tbl_group where groupno=11;
delete from tbl_shymember where name='junotest';

select *
from tbl_gmember
order by gpdetailno;
--where fk_groupno=2
select T.*
from
(select C.name,C.email,C.myimg, V.*
from tbl_shymember C join 
(
select A.groupno ,B.gpdetailno,B.fk_groupidx,B.gregisterdate,B.status as Bstatus
from tbl_group A join tbl_gmember B 
on A.groupno = B.fk_groupno
)V
on V.fk_groupidx=C.idx)T
where T.groupno = 2;
select V.*
from
(
select A.groupno,A.fk_idx, A.gname,A.description,A.groupdate,A.status,A.gimg,A.gcount,C.name,C.email,C.myimg,C.myintro
from tbl_group A join tbl_shymember C
on A.fk_idx = C.idx)V
where V.groupno = 2;

create or replace view view_tbl_group
as
select V.*
from
(
select A.groupno,A.fk_idx, A.gname,A.description,A.groupdate,A.status,A.gimg,A.gcount,C.name,C.email,C.myimg,C.myintro
from tbl_group A join tbl_shymember C
on A.fk_idx = C.idx)V
;
commit;
--내가 만든 그룹
select groupno,fk_idx, gname, description,groupdate,status,gimg,gcount
from tbl_group 
where fk_idx = 1; -- 10,12,13,14

select groupno,fk_idx, gname, description,groupdate,status,gimg,gcount
from tbl_group 
where fk_idx = 33; -- 2

select groupno,fk_idx, gname, description,groupdate,status,gimg,gcount
from tbl_group 
where fk_idx = 32; -- 없음

--내가 가입한 그룹
select gpdetailno,fk_groupno,fk_groupidx,gregisterdate,status
from tbl_gmember
where fk_groupidx = 1; --10,12,13,14

select gpdetailno,fk_groupno,fk_groupidx,gregisterdate,status
from tbl_gmember
where fk_groupidx = 33; --2

select gpdetailno,fk_groupno,fk_groupidx,gregisterdate,status
from tbl_gmember
where fk_groupidx = 32; --2

select *
from tbl_group
where to_char(groupdate,'yyyy-mm-dd hh:mi') = to_char(sysdate,'yyyy-mm-dd hh:mi');

insert into tbl_gmember(gpdetailno,fk_groupno,fk_groupidx,gregisterdate,status) 
		values(seq_tbl_gmember.nextval,13,32,default,default);

commit;
update tbl_group set gimg='null'
where groupno=3;

insert into tbl_gmember(gpdetailno,fk_groupno,fk_groupidx,GREGISTERDATE,status) 
values(seq_tbl_gmember.nextval,2,32,default,1);

select *
from tbl_shymember;

select *
from tbl_shymemo;

select substr(gcontent, instr(gcontent, 'te', 1, 1), length('te') + 5 )
		           as searchdata    
		    from tbl_grpboard
		    where lower(gcontent) like '%' || lower('te') || '%';

select V.*
from
(
select A.groupno, A.gname, B.gpdetailno, B.gcontent
from tbl_group A join tbl_grpboard B
on A.groupno = B.grpboardseq
)V
where V.gcontent like '%'||'그'||'%';
--where V.gname like '%'||'그'||'%';
-------------------------------------------
--용명

-------------------------------------------------
--wsg


-------------------------------------------------
--준호

-------------------------------------------------
--성민

-------------------------------------------------
--뚱

-----------------------------------------------------




/* 그룹 */
CREATE TABLE tbl_group (
	groupno NUMBER NOT NULL, /* 그룹seq */
	fk_idx VARCHAR2(20), /* 그룹장 */
	gname VARCHAR2(20) NOT NULL, /* 그룹명 */
	description VARCHAR2(40), /* 그룹설명 */
	groupdate DATE DEFAULT sysdate NOT NULL, /* 그룹생성일자 */
	gcount NUMBER DEFAULT 1, /* 그룹회원수 */
	status NUMBER DEFAULT 1 NOT NULL /* 그룹상태 */
);

alter table tbl_group modify(gimg varchar2(2000) default null);

alter table tbl_group
add gimg varchar2(100);  /* 그룹대표이미지 추가 */

alter table tbl_group
add gcount number;

alter table tbl_group
drop column gcount;

alter table tbl_group
add gcount number default 1;

--drop sequence seq_tbl_group
create sequence seq_tbl_group
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_group IS '그룹';

COMMENT ON COLUMN tbl_group.groupno IS '그룹seq';

COMMENT ON COLUMN tbl_group.fk_idx IS '그룹장';

COMMENT ON COLUMN tbl_group.gname IS '그룹명';

COMMENT ON COLUMN tbl_group.description IS '그룹설명';

COMMENT ON COLUMN tbl_group.groupdate IS '그룹생성일자';

--COMMENT ON COLUMN tbl_group.gcount IS '그룹회원수 단, 그룹회원 수가 0이 되면 해당 그룹을 delete 시킨다';

COMMENT ON COLUMN tbl_group.gimg IS '그룹대표이미지';

COMMENT ON COLUMN tbl_group.status IS '그룹상태 1:전체공개 2:회원공개 3:비공개 0:삭제 그룹회원수가 select count(*) from tbl_group => 0이 되면 해당 그룹상태를 0으로 update 시킨다';

CREATE UNIQUE INDEX PK_tbl_group
	ON tbl_group (
		groupno ASC
	);

ALTER TABLE tbl_group
	ADD
		CONSTRAINT PK_tbl_group
		PRIMARY KEY (
			groupno
		);

------------------------------------------------------------------------

/* 그룹상세 */
--drop table tbl_gmember
CREATE TABLE tbl_gmember (
	gpdetailno NUMBER(30) NOT NULL, /* 그룹상세seq */
	fk_groupno NUMBER, /* FK_그룹seq */
	fk_groupidx VARCHAR2(20), /* FK_회원seq */
	gregisterdate DATE DEFAULT sysdate, /* 가입일자 */
	status NUMBER DEFAULT 1 /* 가입상태 */
);

--drop sequence seq_tbl_gmember
create sequence seq_tbl_gmember
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_gmember IS '그룹상세';

COMMENT ON COLUMN tbl_gmember.gpdetailno IS '그룹상세seq';

COMMENT ON COLUMN tbl_gmember.fk_groupno IS 'FK_그룹seq';

COMMENT ON COLUMN tbl_gmember.fk_groupidx IS 'FK_회원seq';

COMMENT ON COLUMN tbl_gmember.gregisterdate IS '가입일자';

COMMENT ON COLUMN tbl_gmember.status IS '가입상태 1: 가입 0: 탈퇴';

CREATE UNIQUE INDEX PK_tbl_gmember
	ON tbl_gmember (
		gpdetailno ASC
	);

ALTER TABLE tbl_gmember
	ADD
		CONSTRAINT PK_tbl_gmember
		PRIMARY KEY (
			gpdetailno
		);

------------------------------------------------------------------------

/* SNS기본(POST) */
CREATE TABLE tbl_shymemo (
	snsno VARCHAR2(20) NOT NULL, /* sns글seq */
	fk_idx VARCHAR2(20), /* FK_회원seq */
	scontent VARCHAR2(200), /* 게시글본문내용 */
	sdatedtime DATE DEFAULT sysdate NOT NULL, /* 최종수정일 */
	slikecnt NUMBER DEFAULT 0 NOT NULL, /* 좋아요수 */
	sblamecnt NUMBER DEFAULT 0 NOT NULL, /* 신고수 */
	publicyn NUMBER DEFAULT 0 NOT NULL, /* 공개여부 */
	simage NUMBER DEFAULT 0, /* 이미지여부 */
	stagfollow NUMBER DEFAULT 0, /* 친구태그여부 */
	staggeo NUMBER DEFAULT 0, /* 위치태그여부 */
	status NUMBER DEFAULT 0 NOT NULL /* 삭제여부 */
);

--drop sequence seq_tbl_shymemo
create sequence seq_tbl_shymemo
start with 0000001
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


COMMENT ON TABLE tbl_shymemo IS 'SNS기본(POST)';

COMMENT ON COLUMN tbl_shymemo.snsno IS 'seq.nextval PK shy_sns0000001';

COMMENT ON COLUMN tbl_shymemo.fk_idx IS 'FK_회원seq';

COMMENT ON COLUMN tbl_shymemo.scontent IS '게시글본문내용';

COMMENT ON COLUMN tbl_shymemo.sdatedtime IS '최종수정일';

COMMENT ON COLUMN tbl_shymemo.slikecnt IS '좋아요수';

COMMENT ON COLUMN tbl_shymemo.sblamecnt IS '신고수가 5 이상이면 blind 처리';

COMMENT ON COLUMN tbl_shymemo.publicyn IS '0 : 전체공개 1 : 친구만 공개 2 : 나만공개';

COMMENT ON COLUMN tbl_shymemo.simage IS '1: 존재 0: 없음';

COMMENT ON COLUMN tbl_shymemo.stagfollow IS '0 : 친구태그 없음 1:  친구태그 있음
';

COMMENT ON COLUMN tbl_shymemo.staggeo IS '0 : 위치태그 없음 1 : 위치태그 있음';

COMMENT ON COLUMN tbl_shymemo.status IS '0 : 게시 1 : 삭제';

CREATE UNIQUE INDEX tbl_post
	ON tbl_shymemo (
		snsno ASC
	);

ALTER TABLE tbl_shymemo
	ADD
		CONSTRAINT tbl_post
		PRIMARY KEY (
			snsno
		);

------------------------------------------------------------------------

/* 신고 */
CREATE TABLE tbl_blame (
	blameno VARCHAR2(20) NOT NULL, /* 신고글seq */
	snsno VARCHAR2(20), /* FK_sns글seq */
	storeboardno NUMBER, /* FK_가게리뷰게시판seq */
	grpboardseq NUMBER(20), /* FK_그룹게시물seq */
	messageno NUMBER(20), /* FK_메세지seq */
	fk_blameidx VARCHAR2(20), /* 신고한 회원 IDX */
	fk_blamedidx VARCHAR2(20), /* 신고받은회원 IDX */
	bladate DATE DEFAULT sysdate NOT NULL /* 신고일시 */
);

create sequence seq_tbl_blame
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_blame IS '신고';

COMMENT ON COLUMN tbl_blame.blameno IS '신고한 게시물 이나 댓글의 PK
';

COMMENT ON COLUMN tbl_blame.snsno IS 'FK_sns글seq';

COMMENT ON COLUMN tbl_blame.storeboardno IS 'FK_가게리뷰게시판seq';

COMMENT ON COLUMN tbl_blame.grpboardseq IS 'FK_그룹게시물seq';

COMMENT ON COLUMN tbl_blame.messageno IS 'FK_메세지seq';

COMMENT ON COLUMN tbl_blame.fk_blameidx IS '신고한 회원 IDX';

COMMENT ON COLUMN tbl_blame.fk_blamedidx IS '신고받은회원 IDX';

COMMENT ON COLUMN tbl_blame.bladate IS '신고일시';

------------------------------------------------------------------------

/* 회원 */
CREATE TABLE tbl_shymember (
	idx VARCHAR2(20) DEFAULT 1 NOT NULL, /* 회원seq */
	name VARCHAR2(20) NOT NULL, /* 성명 */
	email VARCHAR2(40) NOT NULL, /* 이메일 */
	pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
	registerdate DATE DEFAULT sysdate NOT NULL, /* 가입일자 */
	status NUMBER DEFAULT 1 NOT NULL, /* 회원상태 */
	myimg VARCHAR2(50), /* 프로필사진 */
	myintro VARCHAR2(100), /* 자기소개 */
	birthday VARCHAR2(10), /* 생일 */
	gender VARCHAR2(10), /* 성별 */
	phone VARCHAR2(20) /* 연락처 */
);
alter table tbl_shymember modify(myimg varchar2(2000) default null);

create sequence seq_tbl_shymember
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_shymember IS '회원';

COMMENT ON COLUMN tbl_shymember.idx IS '회원seq = idx 1부터 시작';

COMMENT ON COLUMN tbl_shymember.name IS '성명';

COMMENT ON COLUMN tbl_shymember.email IS '이메일(xx@xxx.com)';

COMMENT ON COLUMN tbl_shymember.pwd IS '비밀번호(8~15 사이의 영문자,특수문자 조합)';

COMMENT ON COLUMN tbl_shymember.registerdate IS '가입일자';

COMMENT ON COLUMN tbl_shymember.status IS '1:일반 2:사업자 168:운영자 0:탈퇴';

COMMENT ON COLUMN tbl_shymember.myimg IS '프로필사진';

COMMENT ON COLUMN tbl_shymember.myintro IS '자기소개';

COMMENT ON COLUMN tbl_shymember.birthday IS '생일';

COMMENT ON COLUMN tbl_shymember.gender IS '성별';

COMMENT ON COLUMN tbl_shymember.phone IS '연락처';

CREATE UNIQUE INDEX PK_tbl_shymember
	ON tbl_shymember (
		idx ASC
	);

ALTER TABLE tbl_shymember
	ADD
		CONSTRAINT PK_tbl_shymember
		PRIMARY KEY (
			idx
		);

------------------------------------------------------------------------
insert into tbl_comment(cmtno,snsno,grpboardseq,storeboardno,cmtcontent,updatetime,likecnt,blamecnt,status,fk_idx) 
		values(seq_tbl_comment.nextval,77,default,default,'뭐야이거',sysdate,0,0,1,53);
 select * from tbl_shymemo;
 select * from tbl_comment;
/* 댓글 */
CREATE TABLE tbl_comment (
	cmtno NUMBER NOT NULL, /* 댓글seq */
	snsno VARCHAR2(20) DEFAULT null, /* FK_sns글seq */
	grpboardseq NUMBER(20) DEFAULT null, /* FK_그룹게시물seq */
	storeboardno NUMBER DEFAULT null, /* FK_가게리뷰게시판seq */
	cmtcontent VARCHAR2(100), /* 댓글내용 */
	updatetime DATE DEFAULT sysdate, /* 댓글최근수정일시 */
	likecnt NUMBER DEFAULT 0, /* 좋아요회수 */
	blamecnt NUMBER DEFAULT 0, /* 신고회수 */
	status NUMBER DEFAULT 1 /* 댓글삭제여부 */
);
alter table tbl_comment modify(snsno VARCHAR2(20) DEFAULT null);
alter table tbl_comment modify(grpboardseq NUMBER(20) DEFAULT null);
alter table tbl_comment modify(storeboardno NUMBER DEFAULT null);
alter table tbl_comment modify(updatetime DATE DEFAULT sysdate);
alter table tbl_comment modify(likecnt NUMBER DEFAULT 0);
alter table tbl_comment modify(blamecnt NUMBER DEFAULT 0);
alter table tbl_comment modify(status NUMBER DEFAULT 1);
alter table tbl_comment add fk_idx varchar2(20); --컬럼추가
ALTER TABLE tbl_comment ADD CONSTRAINT FK_tbl_comment_idx foreign key(fk_idx) references tbl_shymember(idx); --제약조건 추가
commit;
--drop sequence seq_tbl_comment
create sequence seq_tbl_comment
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_comment IS '댓글';

COMMENT ON COLUMN tbl_comment.cmtno IS 'seq.nextval PK cmt_seq_000000001';

COMMENT ON COLUMN tbl_comment.snsno IS 'FK_sns글seq';

COMMENT ON COLUMN tbl_comment.grpboardseq IS 'FK_그룹게시물seq';

COMMENT ON COLUMN tbl_comment.storeboardno IS 'FK_가게리뷰게시판seq';

COMMENT ON COLUMN tbl_comment.cmtcontent IS '@ # 허용 엔터값에 <br/>';

COMMENT ON COLUMN tbl_comment.updatetime IS '댓글최근수정일시';

COMMENT ON COLUMN tbl_comment.likecnt IS '좋아요회수';

COMMENT ON COLUMN tbl_comment.blamecnt IS '신고회수';

COMMENT ON COLUMN tbl_comment.status IS '0 : 게시 1 : 삭제';

CREATE UNIQUE INDEX PK_tbl_comment
	ON tbl_comment (
		cmtno ASC
	);

ALTER TABLE tbl_comment
	ADD
		CONSTRAINT PK_tbl_comment
		PRIMARY KEY (
			cmtno
		);

------------------------------------------------------------------------

/* 팔로우 */
CREATE TABLE tbl_follow (
	followno NUMBER NOT NULL, /* 팔로우seq */
	fk_idxflw VARCHAR2(20), /* 팔로우 한 회원 IDX */
	fk_idxflwed VARCHAR2(20), /* 팔로우 받은 회원 IDX */
	followdate DATE DEFAULT sysdate, /* 팔로우일자 */
	status NUMBER DEFAULT 1 /* 팔로우상태 */
);

create sequence seq_tbl_follow
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_follow IS '팔로우';

COMMENT ON COLUMN tbl_follow.followno IS '팔로우seq';

COMMENT ON COLUMN tbl_follow.fk_idxflw IS 'fk_idxfollow 팔로우 한 회원';

COMMENT ON COLUMN tbl_follow.fk_idxflwed IS 'fk_idxfollowed 팔로우 받은 회원';

COMMENT ON COLUMN tbl_follow.followdate IS '팔로우일자';

COMMENT ON COLUMN tbl_follow.status IS '팔로우상태 1: follow 0: unfollow';

CREATE UNIQUE INDEX PK_tbl_follow
	ON tbl_follow (
		followno ASC
	);

ALTER TABLE tbl_follow
	ADD
		CONSTRAINT PK_tbl_follow
		PRIMARY KEY (
			followno
		);

------------------------------------------------------------------------

/* 그룹게시물 */
--drop table tbl_grpboard 
CREATE TABLE tbl_grpboard (
	grpboardseq NUMBER(20) NOT NULL, /* 그룹게시물seq */
	gpdetailno NUMBER(30), /* 그룹상세seq */
	gcontent CLOB, /* 내용 */
	uploadfile VARCHAR2(40), /* 첨부파일 */
	writedate DATE , /* 작성날짜 */
	likecnt NUMBER, /* 좋아요수 */
	cmtcnt NUMBER, /* 댓글수 */
	imgyn NUMBER, /* 이미지여부 */
	status NUMBER /* 삭제여부 */
);
alter table tbl_grpboard modify(uploadfile varchar2(2000));

--drop sequence seq_tbl_grpboard 
create sequence seq_tbl_grpboard
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_grpboard IS '그룹게시물';

COMMENT ON COLUMN tbl_grpboard.grpboardseq IS '게시물번호 ex)g_10000';

COMMENT ON COLUMN tbl_grpboard.gpdetailno IS '그룹상세seq';

COMMENT ON COLUMN tbl_grpboard.gcontent IS '내용';

COMMENT ON COLUMN tbl_grpboard.uploadfile IS '첨부파일';

COMMENT ON COLUMN tbl_grpboard.writedate IS '작성날짜';

COMMENT ON COLUMN tbl_grpboard.likecnt IS '좋아요수';

COMMENT ON COLUMN tbl_grpboard.cmtcnt IS '댓글수';

--COMMENT ON COLUMN tbl_grpboard.readcnt IS '조회수';

COMMENT ON COLUMN tbl_grpboard.imgyn IS '이미지여부 1: 존재 0: 없음';

COMMENT ON COLUMN tbl_grpboard.status IS '1: 존재 0: 삭제';

CREATE UNIQUE INDEX PK_tbl_grpboard
	ON tbl_grpboard (
		grpboardseq ASC
	);

ALTER TABLE tbl_grpboard
	ADD
		CONSTRAINT PK_tbl_grpboard
		PRIMARY KEY (
			grpboardseq
		);

------------------------------------------------------------------------

/* SNS뱅킹맵핑 */
CREATE TABLE tbl_bankmap (
	bmno NUMBER NOT NULL, /* 뱅킹맵핑seq */
	snsno VARCHAR2(20), /* FK_sns글seq */
	bm_content VARCHAR2(100), /* 결제내용요약 */
	bm_geotitle VARCHAR2(20) NOT NULL, /* 위치이름 */
	latitude NUMBER NOT NULL, /* 위도 */
	longditude NUMBER NOT NULL /* 경도 */
);

create sequence seq_tbl_bankmap
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_bankmap IS 'SNS뱅킹맵핑';

COMMENT ON COLUMN tbl_bankmap.bmno IS 'seq.nextval PK shy_sns0000001';

COMMENT ON COLUMN tbl_bankmap.snsno IS 'FK_sns글seq';

COMMENT ON COLUMN tbl_bankmap.bm_content IS '결제내용요약';

COMMENT ON COLUMN tbl_bankmap.bm_geotitle IS 'geotag 의 값이 1 일때';

COMMENT ON COLUMN tbl_bankmap.latitude IS '위도';

COMMENT ON COLUMN tbl_bankmap.longditude IS '경도';

CREATE UNIQUE INDEX PK_tbl_bankmap
	ON tbl_bankmap (
		bmno ASC
	);

ALTER TABLE tbl_bankmap
	ADD
		CONSTRAINT PK_tbl_bankmap
		PRIMARY KEY (
			bmno
		);

------------------------------------------------------------------------

/* 이미지 */
CREATE TABLE tbl_image (
	imageseq NUMBER(20) NOT NULL, /* 이미지seq */
	snsno VARCHAR2(20), /* FK_sns글번호 */
	storeboardno NUMBER, /* FK_가게리뷰게시판seq */
	grpboardseq NUMBER(20), /* FK_그룹게시물번호seq */
	filename VARCHAR2(100), /* 이미지 */
	uploadtime DATE DEFAULT sysdate /* 등록시간 */
);

create sequence seq_tbl_image
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_image IS '이미지';

COMMENT ON COLUMN tbl_image.imageseq IS '이미지seq';

COMMENT ON COLUMN tbl_image.snsno IS 'FK_sns글번호';

COMMENT ON COLUMN tbl_image.storeboardno IS 'FK_가게리뷰게시판seq';

COMMENT ON COLUMN tbl_image.grpboardseq IS 'FK_그룹게시물번호seq';

COMMENT ON COLUMN tbl_image.filename IS '이미지';

COMMENT ON COLUMN tbl_image.uploadtime IS '등록시간';

CREATE UNIQUE INDEX PK_tbl_image
	ON tbl_image (
		imageseq ASC
	);

ALTER TABLE tbl_image
	ADD
		CONSTRAINT PK_tbl_image
		PRIMARY KEY (
			imageseq
		);

------------------------------------------------------------------------

/* 업종테이블 */
CREATE TABLE tbl_category (
	categoryno NUMBER NOT NULL, /* 업종seq */
	code VARCHAR2(20), /* 업종코드 */
	cname VARCHAR2(100) /* 업종명 */
);

create sequence seq_tbl_category 
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_category IS '업종테이블';

COMMENT ON COLUMN tbl_category.categoryno IS '업종seq';

COMMENT ON COLUMN tbl_category.code IS '업종코드';

COMMENT ON COLUMN tbl_category.cname IS '업종명';

CREATE UNIQUE INDEX PK_tbl_category
	ON tbl_category (
		categoryno ASC
	);

ALTER TABLE tbl_category
	ADD
		CONSTRAINT PK_tbl_category
		PRIMARY KEY (
			categoryno
		);

------------------------------------------------------------------------

/* 사업자 */
CREATE TABLE tbl_business (
	businessno NUMBER NOT NULL, /* 사업자seq */
	fk_idx VARCHAR2(20), /* FK_회원seq */
	categoryno NUMBER, /* FK_업종seq */
	bname VARCHAR2(40), /* 사업자명 */
	status NUMBER /* 운영자 확인 여부 */
);

--drop sequence seq_tbl_business
create sequence seq_tbl_business
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_business IS '사업자';

COMMENT ON COLUMN tbl_business.businessno IS '사업자seq';

COMMENT ON COLUMN tbl_business.fk_idx IS 'FK_회원seq';

COMMENT ON COLUMN tbl_business.categoryno IS 'FK_업종seq';

COMMENT ON COLUMN tbl_business.bname IS '사업자명';

COMMENT ON COLUMN tbl_business.status IS '1: 허가 0: 불허';

CREATE UNIQUE INDEX PK_tbl_business
	ON tbl_business (
		businessno ASC
	);

ALTER TABLE tbl_business
	ADD
		CONSTRAINT PK_tbl_business
		PRIMARY KEY (
			businessno
		);

------------------------------------------------------------------------

/* 계좌 */
CREATE TABLE tbl_shybank (
	bankno NUMBER NOT NULL, /* 뱅크seq */
	fk_bankidx VARCHAR2(20), /* FK_회원seq */
	bankname VARCHAR2(20) NOT NULL, /* 은행명 */
	banknum VARCHAR2(40) NOT NULL, /* 계좌번호 */
	status NUMBER NOT NULL /* 계좌상태 */
);

create sequence seq_tbl_shybank
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_shybank IS '계좌';

COMMENT ON COLUMN tbl_shybank.bankno IS '뱅크seq';

COMMENT ON COLUMN tbl_shybank.fk_bankidx IS 'FK_회원seq';

COMMENT ON COLUMN tbl_shybank.bankname IS '은행명';

COMMENT ON COLUMN tbl_shybank.banknum IS '계좌번호';

COMMENT ON COLUMN tbl_shybank.status IS '계좌 1:대표 2:sub  0:삭제';

CREATE UNIQUE INDEX PK_tbl_shybank
	ON tbl_shybank (
		bankno ASC
	);

ALTER TABLE tbl_shybank
	ADD
		CONSTRAINT PK_tbl_shybank
		PRIMARY KEY (
			bankno
		);

------------------------------------------------------------------------

/* 메세지 */
CREATE TABLE tbl_message (
	messageno NUMBER(20) NOT NULL, /* 메세지seq */
	send_idx VARCHAR2(20), /* FK_보낸회원seq */
	recipient_idx VARCHAR2(20), /* FK_받는회원seq */
	mcontent VARCHAR2(1000), /* 내용 */
	senddate DATE DEFAULT sysdate /* 작성일자 */
);

create sequence seq_tbl_message
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_message IS '메세지';

COMMENT ON COLUMN tbl_message.messageno IS '메세지seq';

COMMENT ON COLUMN tbl_message.send_idx IS 'FK_보낸회원seq';

COMMENT ON COLUMN tbl_message.recipient_idx IS 'FK_받는회원seq';

COMMENT ON COLUMN tbl_message.mcontent IS '내용';

COMMENT ON COLUMN tbl_message.senddate IS '작성일자';

CREATE UNIQUE INDEX PK_tbl_message
	ON tbl_message (
		messageno ASC
	);

ALTER TABLE tbl_message
	ADD
		CONSTRAINT PK_tbl_message
		PRIMARY KEY (
			messageno
		);

------------------------------------------------------------------------

/* 접속로그 */
CREATE TABLE tbl_log (
	logno NUMBER NOT NULL, /* 접속순번seq */
	fk_idx VARCHAR2(20) NOT NULL, /* FK_회원seq */
	status NUMBER(2), /* 접속상태 */
	logtime DATE DEFAULT sysdate, /* 접속시간 */
	logip VARCHAR2(20) /* 접속IP */
);

create sequence seq_tbl_log
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_log IS '접속로그';

COMMENT ON COLUMN tbl_log.logno IS '접속순번seq';

COMMENT ON COLUMN tbl_log.fk_idx IS 'FK_회원seq';

COMMENT ON COLUMN tbl_log.status IS '1:conn (접속)
0:dis (종료)';

COMMENT ON COLUMN tbl_log.logtime IS '접속 conn,dis 시간';

COMMENT ON COLUMN tbl_log.logip IS 'ex)192.168.0.0.1';

CREATE UNIQUE INDEX PK_tbl_log
	ON tbl_log (
		logno ASC
	);

ALTER TABLE tbl_log
	ADD
		CONSTRAINT PK_tbl_log
		PRIMARY KEY (
			logno
		);
                
------------------------------------------------------------------------

/* 좋아요 */
CREATE TABLE tbl_like (
	likeno NUMBER NOT NULL, /* 좋아요seq */
	fk_likeidx VARCHAR2(20), /* FK_회원seq */
	liketype NUMBER NOT NULL, /* 게시물타입 */
	likedate DATE DEFAULT sysdate NOT NULL, /* 좋아요일시 */
	snsno VARCHAR2(20), /* FK_sns글seq */
	storeboardno NUMBER, /* FK_가게리뷰게시판seq */
	grpboardseq NUMBER(20) /* FK_그룹게시물seq */
);

create sequence seq_tbl_like
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_like IS '좋아요';

COMMENT ON COLUMN tbl_like.likeno IS 'seq.nextval';

COMMENT ON COLUMN tbl_like.fk_likeidx IS '좋아요를 누른 fk_회원seq';

COMMENT ON COLUMN tbl_like.liketype IS '1 : 게시물 (post) 2 : 댓글 (comment)';

COMMENT ON COLUMN tbl_like.likedate IS '좋아요일시';

COMMENT ON COLUMN tbl_like.snsno IS 'FK_sns글seq';

COMMENT ON COLUMN tbl_like.storeboardno IS 'FK_가게리뷰게시판seq';

COMMENT ON COLUMN tbl_like.grpboardseq IS 'FK_그룹게시물seq';

CREATE UNIQUE INDEX PK_tbl_like
	ON tbl_like (
		likeno ASC
	);

ALTER TABLE tbl_like
	ADD
		CONSTRAINT PK_tbl_like
		PRIMARY KEY (
			likeno
		);

------------------------------------------------------------------------

/* 팔로우태그 */
CREATE TABLE tbl_tagfollow (
	tagno NUMBER NOT NULL, /* 태그seq */
	snsno VARCHAR2(20), /* FK_sns글번호 */
	fk_tagidx VARCHAR2(20) /* FK_회원seq */
);

create sequence seq_tbl_tagfollow
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_tagfollow IS '팔로우태그';

COMMENT ON COLUMN tbl_tagfollow.tagno IS '태그seq';

COMMENT ON COLUMN tbl_tagfollow.snsno IS 'FK_sns글번호';

COMMENT ON COLUMN tbl_tagfollow.fk_tagidx IS 'FK_회원seq';

CREATE UNIQUE INDEX PK_tbl_tagfollow
	ON tbl_tagfollow (
		tagno ASC
	);

ALTER TABLE tbl_tagfollow
	ADD
		CONSTRAINT PK_tbl_tagfollow
		PRIMARY KEY (
			tagno
		);


------------------------------------------------------------------------

/* 가게리뷰게시판 */
CREATE TABLE tbl_storeboard (
	storeboardno NUMBER NOT NULL, /* 가게리뷰게시판seq */
	fk_businessno NUMBER NOT NULL, /* FK_사업자seq */
	fk_idx VARCHAR2(20) NOT NULL, /* FK_회원seq */
	point NUMBER, /* 평점 */
	scontent VARCHAR2(100), /* 내용 */
	imgyn NUMBER, /* 이미지여부 */
	status NUMBER DEFAULT 1, /* 글상태 */
	likecnt NUMBER, /* 좋아요 수 */
	blamecnt NUMBER /* 신고 수 */
);

create sequence seq_tbl_storeboard
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

COMMENT ON TABLE tbl_storeboard IS '가게리뷰게시판';

COMMENT ON COLUMN tbl_storeboard.storeboardno IS '가게리뷰게시판seq';

COMMENT ON COLUMN tbl_storeboard.fk_businessno IS 'FK_사업자seq';

COMMENT ON COLUMN tbl_storeboard.fk_idx IS 'FK_회원seq';

COMMENT ON COLUMN tbl_storeboard.point IS '평점';

COMMENT ON COLUMN tbl_storeboard.scontent IS '내용';

COMMENT ON COLUMN tbl_storeboard.imgyn IS '1: 존재 0: 없음';

COMMENT ON COLUMN tbl_storeboard.status IS '1: 존재 0: 삭제';

COMMENT ON COLUMN tbl_storeboard.likecnt IS '좋아요 수';

COMMENT ON COLUMN tbl_storeboard.blamecnt IS '신고 수';

CREATE UNIQUE INDEX PK_tbl_storeboard
	ON tbl_storeboard (
		storeboardno ASC
	);

ALTER TABLE tbl_storeboard
	ADD
		CONSTRAINT PK_tbl_storeboard
		PRIMARY KEY (
			storeboardno
		);


------------------------------------------------------------------------
 /* ********** 제약조건  **********  */
------------------------------------------------------------------------
ALTER TABLE tbl_group
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_group
		FOREIGN KEY (
			fk_idx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_shymemo
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_shm
		FOREIGN KEY (
			fk_idx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_blame
	ADD
		CONSTRAINT FK_tbl_shymemo_TO_tbl_blame
		FOREIGN KEY (
			snsno
		)
		REFERENCES tbl_shymemo (
			snsno
		);

ALTER TABLE tbl_blame
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_blame
		FOREIGN KEY (
			fk_blameidx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_blame
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_blame2
		FOREIGN KEY (
			fk_blamedidx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_blame
	ADD
		CONSTRAINT FK_tbl_storeboard_TO_tbl_blame
		FOREIGN KEY (
			storeboardno
		)
		REFERENCES tbl_storeboard (
			storeboardno
		);

ALTER TABLE tbl_blame
	ADD
		CONSTRAINT FK_tbl_grpboard_TO_tbl_blame
		FOREIGN KEY (
			grpboardseq
		)
		REFERENCES tbl_grpboard (
			grpboardseq
		);

ALTER TABLE tbl_blame
	ADD
		CONSTRAINT FK_tbl_message_TO_tbl_blame
		FOREIGN KEY (
			messageno
		)
		REFERENCES tbl_message (
			messageno
		);

ALTER TABLE tbl_comment
	ADD
		CONSTRAINT FK_tbl_shymemo_TO_tbl_comment
		FOREIGN KEY (
			snsno
		)
		REFERENCES tbl_shymemo (
			snsno
		);

ALTER TABLE tbl_comment
	ADD
		CONSTRAINT FK_tbl_grpboard_TO_tbl_comment
		FOREIGN KEY (
			grpboardseq
		)
		REFERENCES tbl_grpboard (
			grpboardseq
		);

ALTER TABLE tbl_comment
	ADD
		CONSTRAINT FK_tbl_strbrd_TO_tbl_cmnt
		FOREIGN KEY (
			storeboardno
		)
		REFERENCES tbl_storeboard (
			storeboardno
		);

ALTER TABLE tbl_follow
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_follow
		FOREIGN KEY (
			fk_idxflw
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_follow
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_flw
		FOREIGN KEY (
			fk_idxflwed
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_grpboard
	ADD
		CONSTRAINT FK_tbl_gmember_TO_tbl_grpboard
		FOREIGN KEY (
			gpdetailno
		)
		REFERENCES tbl_gmember (
			gpdetailno
		);

ALTER TABLE tbl_bankmap
	ADD
		CONSTRAINT FK_tbl_shymemo_TO_tbl_bankmap
		FOREIGN KEY (
			snsno
		)
		REFERENCES tbl_shymemo (
			snsno
		);

ALTER TABLE tbl_gmember
	ADD
		CONSTRAINT FK_tbl_group_TO_tbl_gmember
		FOREIGN KEY (
			fk_groupno
		)
		REFERENCES tbl_group (
			groupno
		);

ALTER TABLE tbl_gmember
	ADD
		CONSTRAINT FK_tbl_shmbr_TO_tbl_gmbr
		FOREIGN KEY (
			fk_groupidx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_image
	ADD
		CONSTRAINT FK_tbl_shymemo_TO_tbl_image
		FOREIGN KEY (
			snsno
		)
		REFERENCES tbl_shymemo (
			snsno
		);

ALTER TABLE tbl_image
	ADD
		CONSTRAINT FK_tbl_storeboard_TO_tbl_image
		FOREIGN KEY (
			storeboardno
		)
		REFERENCES tbl_storeboard (
			storeboardno
		);

ALTER TABLE tbl_image
	ADD
		CONSTRAINT FK_tbl_grpboard_TO_tbl_image
		FOREIGN KEY (
			grpboardseq
		)
		REFERENCES tbl_grpboard (
			grpboardseq
		);

ALTER TABLE tbl_business
	ADD
		CONSTRAINT FK_tbl_shmbr_TO_tbl_bsns
		FOREIGN KEY (
			fk_idx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_business
	ADD
		CONSTRAINT FK_tbl_category_TO_tbl_bsns
		FOREIGN KEY (
			categoryno
		)
		REFERENCES tbl_category (
			categoryno
		);

ALTER TABLE tbl_shybank
	ADD
		CONSTRAINT FK_tbl_shmbr_TO_tbl_shbnk
		FOREIGN KEY (
			fk_bankidx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_message
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_msg
		FOREIGN KEY (
			send_idx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_message
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_msg2
		FOREIGN KEY (
			recipient_idx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_log
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_log
		FOREIGN KEY (
			fk_idx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_like
	ADD
		CONSTRAINT FK_tbl_shymemo_TO_tbl_like
		FOREIGN KEY (
			snsno
		)
		REFERENCES tbl_shymemo (
			snsno
		);

ALTER TABLE tbl_like
	ADD
		CONSTRAINT FK_tbl_storeboard_TO_tbl_like
		FOREIGN KEY (
			storeboardno
		)
		REFERENCES tbl_storeboard (
			storeboardno
		);

ALTER TABLE tbl_like
	ADD
		CONSTRAINT FK_tbl_grpboard_TO_tbl_like
		FOREIGN KEY (
			grpboardseq
		)
		REFERENCES tbl_grpboard (
			grpboardseq
		);

ALTER TABLE tbl_like
	ADD
		CONSTRAINT FK_tbl_shymember_TO_tbl_like
		FOREIGN KEY (
			fk_likeidx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_tagfollow
	ADD
		CONSTRAINT FK_tbl_shymemo_TO_tbl_tgflw
		FOREIGN KEY (
			snsno
		)
		REFERENCES tbl_shymemo (
			snsno
		);

ALTER TABLE tbl_tagfollow
	ADD
		CONSTRAINT FK_tbl_shmbr_TO_tbl_tgflw
		FOREIGN KEY (
			fk_tagidx
		)
		REFERENCES tbl_shymember (
			idx
		);

ALTER TABLE tbl_storeboard
	ADD
		CONSTRAINT FK_tbl_bsns_TO_tbl_strbrd
		FOREIGN KEY (
			fk_businessno
		)
		REFERENCES tbl_business (
			businessno
		);

ALTER TABLE tbl_storeboard
	ADD
		CONSTRAINT FK_tbl_shmbr_TO_tbl_strbrd
		FOREIGN KEY (
			fk_idx
		)
		REFERENCES tbl_shymember (
			idx
		);

commit;

select *
from user_tables; -- 생성된 테이블 모두 보기

select *
from user_sequences;  -- 생성된 시퀀스 모두 보기

select *
from TBL_GROUP;

select *
from TBL_GMEMBER;