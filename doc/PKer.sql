/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/5/9 ÐÇÆÚÁù 22:21:37                        */
/*==============================================================*/


drop table if exists Question;

drop table if exists User;

drop table if exists User_role;

drop table if exists comment;

drop table if exists competition;

drop table if exists competition_user;

drop table if exists favorite;

drop table if exists follow;

drop table if exists message;

drop table if exists note;

drop table if exists choice;

drop table if exists paper;

drop table if exists record;

drop table if exists role;

drop table if exists tag;

/*==============================================================*/
/* Table: Question                                              */
/*==============================================================*/
create table Question
(
   questionid           int not null auto_increment,
   paperid              int,
   answerid             int,
   content              varchar(500) not null,
   category             national varchar(30),
   type                 varchar(30),
   options              varchar(20),
   explanation          national varchar(100),
   appendix             text,
   tag_id               int,
   creator              int,
   last_modify          datetime,
   right_times          int,
   expose_times         int,
   wrong_times          int,
   difficulty           varchar(20),
   primary key (questionid)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   Userid               int not null auto_increment,
   Username             varchar(50) not null,
   Truename             varchar(50),
   Password             varchar(30) not null,
   Email                varchar(50),
   Phone                varchar(20),
   Gender               varchar(2),
   Birthday             datetime,
   State                varchar(10),
   Registertime         datetime not null,
   integral             int,
   level                int,
   account_enabled      bool,
   addby                int,
   last_login_time      datetime,
   login_time           datetime,
   primary key (Userid)
);

/*==============================================================*/
/* Table: User_role                                             */
/*==============================================================*/
create table User_role
(
   urid                 int not null auto_increment,
   Userid               int,
   roleid               int,
   primary key (urid)
);

/*==============================================================*/
/* Table: comment                                               */
/*==============================================================*/
create table comment
(
   commentid            int not null auto_increment,
   questionid           int,
   quotecommentid       int,
   Userid               int,
   createtime           datetime,
   commentcontent       varchar(100),
   primary key (commentid)
);

/*==============================================================*/
/* Table: competition                                           */
/*==============================================================*/
create table competition
(
   competitionid        int not null auto_increment,
   Userid               int,
   paperid              int,
   PKtype               int,
   createtime           datetime,
   updatetime           datetime,
   primary key (competitionid)
);

/*==============================================================*/
/* Table: competition_user                                      */
/*==============================================================*/
create table competition_user
(
   cuid                 int not null auto_increment,
   competitionid        int,
   Userid               int,
   createtime           datetime,
   starttime            datetime,
   endtime              datetime,
   primary key (cuid)
);

/*==============================================================*/
/* Table: favorite                                              */
/*==============================================================*/
create table favorite
(
   favoriteid           int not null auto_increment,
   Userid               int,
   questionid           int,
   createtime           datetime,
   primary key (favoriteid)
);

/*==============================================================*/
/* Table: follow                                                */
/*==============================================================*/
create table follow
(
   followid             int not null auto_increment,
   followerid           int,
   followedid           int,
   createtime           datetime,
   primary key (followid)
);

/*==============================================================*/
/* Table: message                                               */
/*==============================================================*/
create table message
(
   msgid                int not null auto_increment,
   senderid             int,
   receiverid           int,
   createtime           datetime,
   isread               bool,
   receivetime          datetime,
   msgcontent           varchar(300),
   primary key (msgid)
);

/*==============================================================*/
/* Table: note                                                  */
/*==============================================================*/
create table note
(
   noteid               int not null auto_increment,
   questionid           int,
   Userid               int,
   notecontent          varchar(100),
   createtime           datetime,
   updatetime           datetime,
   primary key (noteid)
);

/*==============================================================*/
/* Table: "option"                                              */
/*==============================================================*/
create table choice
(
   optionid             int not null auto_increment,
   questionid           int,
   optionorder          varchar(10),
   optioncontent        varchar(100),
   primary key (optionid)
);

/*==============================================================*/
/* Table: paper                                                 */
/*==============================================================*/
create table paper
(
   paperid              int not null auto_increment,
   name                 varchar(20),
   time                 time,
   quantities           int,
   category             varchar(30),
   type                 varchar(30),
   isVisible            bool,
   status               varchar(30),
   summary              text,
   creator              int,
   primary key (paperid)
);

/*==============================================================*/
/* Table: record                                                */
/*==============================================================*/
create table record
(
   recordid             int not null auto_increment,
   Userid               int,
   questionid           int,
   paperid              int,
   useranswerid         int,
   mark                 bool,
   duration             time,
   remark               varchar(100),
   point_get            double,
   primary key (recordid)
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   roleid               int not null auto_increment,
   description          varchar(20),
   name                 varchar(20) not null,
   createtime           datetime not null,
   updatetime           datetime,
   primary key (roleid)
);

/*==============================================================*/
/* Table: tag                                                  */
/*==============================================================*/
create table tag
(
   tag_id                int not null auto_increment,
   content              text,
   primary key (tag_id)
);


alter table Question add constraint FK_answer_option foreign key (answerid)
      references choice (optionid) on delete restrict on update restrict;

alter table Question add constraint FK_paper_question foreign key (paperid)
      references paper (paperid) on delete restrict on update restrict;

alter table Question add constraint FK_tag_question foreign key (tag_id)
      references tag (tag_id) on delete restrict on update restrict;

alter table Question add constraint FK_user_creator foreign key (creator)
      references User (Userid) on delete restrict on update restrict;

alter table User_role add constraint FK_role_user foreign key (roleid)
      references role (roleid) on delete restrict on update restrict;

alter table User_role add constraint FK_user_role foreign key (Userid)
      references User (Userid) on delete restrict on update restrict;

alter table comment add constraint FK_question_comment foreign key (questionid)
      references Question (questionid) on delete restrict on update restrict;

alter table comment add constraint FK_quote foreign key (quotecommentid)
      references comment (commentid) on delete restrict on update restrict;

alter table comment add constraint FK_user_comment foreign key (Userid)
      references User (Userid) on delete restrict on update restrict;

alter table competition add constraint FK_paper_com foreign key (paperid)
      references paper (paperid) on delete restrict on update restrict;

alter table competition add constraint FK_user_com foreign key (Userid)
      references User (Userid) on delete restrict on update restrict;

alter table competition_user add constraint FK_competition_participant foreign key (competitionid)
      references competition (competitionid) on delete restrict on update restrict;

alter table competition_user add constraint FK_user_participant foreign key (Userid)
      references User (Userid) on delete restrict on update restrict;

alter table favorite add constraint FK_question_favorite foreign key (questionid)
      references Question (questionid) on delete restrict on update restrict;

alter table favorite add constraint FK_user_favorite foreign key (Userid)
      references User (Userid) on delete restrict on update restrict;

alter table follow add constraint FK_followed foreign key (followerid)
      references User (Userid) on delete restrict on update restrict;

alter table follow add constraint FK_follower foreign key (followedid)
      references User (Userid) on delete restrict on update restrict;

alter table message add constraint FK_receiver foreign key (senderid)
      references User (Userid) on delete restrict on update restrict;

alter table message add constraint FK_sender foreign key (receiverid)
      references User (Userid) on delete restrict on update restrict;

alter table note add constraint FK_note_question foreign key (questionid)
      references Question (questionid) on delete restrict on update restrict;

alter table note add constraint FK_user_note foreign key (Userid)
      references User (Userid) on delete restrict on update restrict;

alter table choice add constraint FK_question_option foreign key (questionid)
      references Question (questionid) on delete restrict on update restrict;

alter table paper add constraint FK_user_paper foreign key (creator)
      references User (Userid) on delete restrict on update restrict;

alter table record add constraint FK_answer_record foreign key (useranswerid)
      references choice (optionid) on delete restrict on update restrict;

alter table record add constraint FK_paper_record foreign key (paperid)
      references paper (paperid) on delete restrict on update restrict;

alter table record add constraint FK_question_record foreign key (questionid)
      references Question (questionid) on delete restrict on update restrict;

alter table record add constraint FK_user_record foreign key (Userid)
      references User (Userid) on delete restrict on update restrict;

