/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/5/9 ÐÇÆÚÁù 22:21:37                        */
/*==============================================================*/
drop database pker;

create schema pker ;

use pker;

drop table if exists question;

drop table if exists user;

drop table if exists user_role;

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

drop table if exists category;

drop table if exists question_type;

/*==============================================================*/
/* table: question                                              */
/*==============================================================*/
CREATE TABLE question (
    question_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL COMMENT '问题名称/代号',
    answer_id INT COMMENT '每个选项有一个id,answerid是正确选项的id',
    content VARCHAR(500) NOT NULL COMMENT '题干',
    reference VARCHAR(1000) DEFAULT NULL COMMENT '考虑带图片的题目',
    category_id INT COMMENT '题目所属学科id,比如考研英语,gre,toefl等等',
    type_id INT COMMENT '题目类型id,包括选择题,填空题,简答题等等',
    options VARCHAR(300) COMMENT '题目的选项,个数不定',
    analysis TEXT COMMENT '题目分析',
    appendix TEXT COMMENT '附加,备用',
    tag_id INT,
    creator INT COMMENT '创建者id',
    create_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    last_modify DATETIME COMMENT '最后修改时间',
    right_times INT COMMENT '正确次数',
    expose_times INT COMMENT '被做次数',
    wrong_times INT COMMENT '错误次数',
    difficulty INT(5) COMMENT '题目难度',
    PRIMARY KEY (question_id)
);

/*==============================================================*/
CREATE TABLE user (
    user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    truename VARCHAR(50),
    password VARCHAR(30) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(20),
    gender VARCHAR(2),
    birthday DATETIME,
    enabled TINYINT(1) DEFAULT '0' COMMENT '激活状态：0-未激活 1-激活',
    state TINYINT(1) DEFAULT '0' COMMENT '在线状态：0-未在线 1-在线',
    add_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
    registertime DATETIME NOT NULL,
    integral INT COMMENT '积分',
    level INT COMMENT '等级',
    addby INT COMMENT '某个用户添加的或者受某个用户邀请后注册的',
    last_login_time TIMESTAMP NULL DEFAULT NULL,
    login_time TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (user_id)
);

/*==============================================================*/
CREATE TABLE user_role (
    urid INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    role_id INT,
    PRIMARY KEY (urid)
);

/*==============================================================*/
/* table: comment                                               */
/*==============================================================*/
CREATE TABLE comment (
    comment_id INT NOT NULL AUTO_INCREMENT,
    question_id INT NOT NULL,
    quote_comment_id INT DEFAULT NULL COMMENT '回复的评论的id,null表示对问题的直接评论',
    user_id INT,
    create_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    content_msg TEXT NOT NULL COMMENT '评论不能为空',
    PRIMARY KEY (comment_id)
);

/*==============================================================*/
CREATE TABLE competition (
    competition_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    paper_id INT NOT NULL,
    pktype INT COMMENT 'pk类型：0-多人pk,1-双人pk,3-好友pk...',
    create_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (competition_id)
);

/*==============================================================*/
/* table: competition_user                                      */
/*==============================================================*/
CREATE TABLE competition_user (
    cuid INT NOT NULL AUTO_INCREMENT,
    competition_id INT NOT NULL,
    user_id INT NOT NULL COMMENT '参加比赛的用户id',
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    start_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开始答题时间',
    submit_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
    answer_sheet MEDIUMTEXT COMMENT '用户的答案',
    duration INT(10) NOT NULL COMMENT '用户总用时',
    right_questions INT COMMENT '正确题数',
    wrong_questions INT COMMENT '错误题数',
    noanswer_questions INT COMMENT '未作答题数',
    point_get DOUBLE COMMENT '用户得分',
    PRIMARY KEY (cuid)
);

/*==============================================================*/
CREATE TABLE favorite (
    favorite_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (favorite_id)
);

/*==============================================================*/
CREATE TABLE follow (
    follow_id INT NOT NULL AUTO_INCREMENT,
    follower_id INT NOT NULL COMMENT '关注者id',
    followed_id INT NOT NULL COMMENT '被关注者id',
    create_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (follow_id)
);

/*==============================================================*/
CREATE TABLE message (
    msgid INT NOT NULL AUTO_INCREMENT,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    create_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    is_read BOOL COMMENT '是否已读',
    receive_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    msgcontent TEXT NOT NULL,
    PRIMARY KEY (msgid)
);

/*==============================================================*/
CREATE TABLE note (
    note_id INT NOT NULL AUTO_INCREMENT,
    question_id INT NOT NULL,
    user_id INT NOT NULL,
    note_content TEXT NOT NULL,
    create_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (note_id)
);

/*==============================================================*/
CREATE TABLE choice (
    option_id INT NOT NULL AUTO_INCREMENT,
    question_id INT NOT NULL,
    option_order INT,
    option_content TEXT NOT NULL,
    PRIMARY KEY (option_id)
);

/*==============================================================*/
CREATE TABLE paper (
    paper_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) COMMENT '试卷名称',
    duration INT(11) NOT NULL COMMENT '试卷考试时间',
    quantity INT COMMENT '题目数量',
    category_id INT COMMENT '题目所属学科,比如考研英语,gre,toefl等等',
    type VARCHAR(50) COMMENT '题目类型,包括选择题,填空题,简答题等等',
    is_visible TINYINT(1) DEFAULT '0' COMMENT '是否所有用户可见,默认为0',
    is_subjective TINYINT(1) DEFAULT '0' COMMENT '为1表示为包含主观题的试卷,需阅卷',
    status TINYINT(1) NOT NULL DEFAULT '0' COMMENT '试卷状态， 0未完成 -> 1已完成 -> 2已发布 -> 3通过审核 （已发布和通过审核的无法再修改）',
    summary TEXT COMMENT '试卷概述',
    creator INT DEFAULT NULL COMMENT '创建人的账号',
    PRIMARY KEY (paper_id)
);

/*==============================================================*/
CREATE TABLE record (
    record_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    paper_id INT,
    user_answer_id INT,
    mark BOOL DEFAULT '0' COMMENT '是否标记',
    duration TIME COMMENT '单道题目耗时',
    remark VARCHAR(100) COMMENT '用户备注',
    PRIMARY KEY (record_id)
);

/*==============================================================*/
CREATE TABLE role (
    role_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(20),
    create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (role_id)
);

/*==============================================================*/
CREATE TABLE tag (
    tag_id INT NOT NULL AUTO_INCREMENT,
    content TEXT,
    PRIMARY KEY (tag_id)
);


/*==============================================================*/
CREATE TABLE category (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    description TEXT,
    PRIMARY KEY (id)
)  COMMENT='学科';

/*==============================================================*/
CREATE TABLE question_type (
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    subjective TINYINT(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
)  COMMENT='试题类型';


alter table question add constraint fk_answer_option foreign key (answer_id)
      references choice (option_id) on delete restrict on update restrict;

/*alter table question add constraint fk_paper_question foreign key (paper_id)
      references paper (paper_id) on delete restrict on update restrict;*/

alter table question add constraint fk_tag_question foreign key (tag_id)
      references tag (tag_id) on delete restrict on update restrict;

alter table question add constraint fk_user_creator foreign key (creator)
      references user (user_id) on delete restrict on update restrict;

alter table question add constraint fk_type_question foreign key (type_id)
      references question_type (id) on delete restrict on update restrict;

alter table question add constraint fk_category_question foreign key (category_id)
      references category (id) on delete restrict on update restrict;

alter table user_role add constraint fk_role_user foreign key (role_id)
      references role (role_id) on delete restrict on update restrict;

alter table user_role add constraint fk_user_role foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table comment add constraint fk_question_comment foreign key (question_id)
      references question (question_id) on delete restrict on update restrict;

alter table comment add constraint fk_quote foreign key (quote_comment_id)
      references comment (comment_id) on delete restrict on update restrict;

alter table comment add constraint fk_user_comment foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table competition add constraint fk_paper_com foreign key (paper_id)
      references paper (paper_id) on delete restrict on update restrict;

alter table competition add constraint fk_user_com foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table competition_user add constraint fk_competition_participant foreign key (competition_id)
      references competition (competition_id) on delete restrict on update restrict;

alter table competition_user add constraint fk_user_participant foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table favorite add constraint fk_question_favorite foreign key (question_id)
      references question (question_id) on delete restrict on update restrict;

alter table favorite add constraint fk_user_favorite foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table follow add constraint fk_followed foreign key (follower_id)
      references user (user_id) on delete restrict on update restrict;

alter table follow add constraint fk_follower foreign key (followed_id)
      references user (user_id) on delete restrict on update restrict;

alter table message add constraint fk_receiver foreign key (sender_id)
      references user (user_id) on delete restrict on update restrict;

alter table message add constraint fk_sender foreign key (receiver_id)
      references user (user_id) on delete restrict on update restrict;

alter table note add constraint fk_note_question foreign key (question_id)
      references question (question_id) on delete restrict on update restrict;

alter table note add constraint fk_user_note foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

alter table choice add constraint fk_question_option foreign key (question_id)
      references question (question_id) on delete restrict on update restrict;

alter table paper add constraint fk_user_paper foreign key (creator)
      references user (user_id) on delete restrict on update restrict;

alter table record add constraint fk_answer_record foreign key (user_answer_id)
      references choice (option_id) on delete restrict on update restrict;

alter table record add constraint fk_paper_record foreign key (paper_id)
      references paper (paper_id) on delete restrict on update restrict;

alter table record add constraint fk_question_record foreign key (question_id)
      references question (question_id) on delete restrict on update restrict;

alter table record add constraint fk_user_record foreign key (user_id)
      references user (user_id) on delete restrict on update restrict;

