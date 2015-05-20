-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.50-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema pker
--

CREATE DATABASE IF NOT EXISTS pker;
USE pker;

--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='学科';

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`,`name`,`description`) VALUES 
 (1,'GRE',NULL),
 (2,'TOEFL',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `choice`
--

DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_order` int(11) DEFAULT NULL,
  `option_content` text NOT NULL,
  PRIMARY KEY (`option_id`),
  KEY `fk_question_option` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `choice`
--

/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` (`option_id`,`question_id`,`option_order`,`option_content`) VALUES 
 (1,1,1,' function ... systematic'),
 (2,1,2,'method ... dutiful'),
 (3,1,3,'purpose ... diligent'),
 (4,1,4,' end ... rigid'),
 (5,1,5,'point ... perfunctory');
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;


--
-- Definition of table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `quote_comment_id` int(11) DEFAULT NULL COMMENT '回复的评论的id,null表示对问题的直接评论',
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `content_msg` text NOT NULL COMMENT '评论不能为空',
  PRIMARY KEY (`comment_id`),
  KEY `fk_question_comment` (`question_id`),
  KEY `fk_quote` (`quote_comment_id`),
  KEY `fk_user_comment` (`user_id`),
  CONSTRAINT `fk_question_comment` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `fk_quote` FOREIGN KEY (`quote_comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `fk_user_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`comment_id`,`question_id`,`quote_comment_id`,`user_id`,`create_time`,`content_msg`) VALUES 
 (1,1,NULL,1,'2015-05-05 00:00:00','为什么不能选 end ... rigid'),
 (2,1,1,2,'2015-05-06 00:00:00','不如point ... perfunctory合理');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


--
-- Definition of table `competition`
--

DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `competition_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `paper_id` int(11) NOT NULL,
  `pktype` int(11) DEFAULT NULL COMMENT 'pk类型：0-多人pk,1-双人pk,3-好友pk...',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`competition_id`),
  KEY `fk_paper_com` (`paper_id`),
  KEY `fk_user_com` (`user_id`),
  CONSTRAINT `fk_paper_com` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`),
  CONSTRAINT `fk_user_com` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `competition`
--

/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
INSERT INTO `competition` (`competition_id`,`user_id`,`paper_id`,`pktype`,`create_time`,`update_time`) VALUES 
 (1,1,1,0,'2015-05-11 00:00:00','2015-05-11 00:00:00');
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;


--
-- Definition of table `competition_user`
--

DROP TABLE IF EXISTS `competition_user`;
CREATE TABLE `competition_user` (
  `cuid` int(11) NOT NULL AUTO_INCREMENT,
  `competition_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '参加比赛的用户id',
  `create_time` datetime NOT NULL,
  `start_time` datetime NOT NULL COMMENT '开始答题时间',
  `submit_time` datetime NOT NULL COMMENT '提交时间',
  `answer_sheet` mediumtext COMMENT '用户的答案',
  `duration` int(10) NOT NULL COMMENT '用户总用时',
  `right_questions` int(11) DEFAULT NULL COMMENT '正确题数',
  `wrong_questions` int(11) DEFAULT NULL COMMENT '错误题数',
  `noanswer_questions` int(11) DEFAULT NULL COMMENT '未作答题数',
  `point_get` double DEFAULT NULL COMMENT '用户得分',
  PRIMARY KEY (`cuid`),
  KEY `fk_competition_participant` (`competition_id`),
  KEY `fk_user_participant` (`user_id`),
  CONSTRAINT `fk_competition_participant` FOREIGN KEY (`competition_id`) REFERENCES `competition` (`competition_id`),
  CONSTRAINT `fk_user_participant` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `competition_user`
--

/*!40000 ALTER TABLE `competition_user` DISABLE KEYS */;
INSERT INTO `competition_user` (`cuid`,`competition_id`,`user_id`,`create_time`,`start_time`,`submit_time`,`answer_sheet`,`duration`,`right_questions`,`wrong_questions`,`noanswer_questions`,`point_get`) VALUES 
 (1,1,2,'2015-05-11 08:00:00','2015-05-11 08:01:00','2015-05-11 08:29:10','5',1690,1,0,0,100);
/*!40000 ALTER TABLE `competition_user` ENABLE KEYS */;


--
-- Definition of table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `fk_question_favorite` (`question_id`),
  KEY `fk_user_favorite` (`user_id`),
  CONSTRAINT `fk_question_favorite` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `fk_user_favorite` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorite`
--

/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` (`favorite_id`,`user_id`,`question_id`,`create_time`) VALUES 
 (1,2,1,'2015-05-12 00:00:00');
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;


--
-- Definition of table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT,
  `follower_id` int(11) NOT NULL COMMENT '关注者id',
  `followed_id` int(11) NOT NULL COMMENT '被关注者id',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`follow_id`),
  KEY `fk_followed` (`follower_id`),
  KEY `fk_follower` (`followed_id`),
  CONSTRAINT `fk_followed` FOREIGN KEY (`follower_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_follower` FOREIGN KEY (`followed_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `follow`
--

/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` (`follow_id`,`follower_id`,`followed_id`,`create_time`) VALUES 
 (1,1,2,'2015-04-30 00:00:00'),
 (2,2,1,'2015-05-05 00:00:00');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;


--
-- Definition of table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `is_read` tinyint(1) DEFAULT NULL COMMENT '是否已读',
  `receive_time` datetime NOT NULL,
  `msgcontent` text NOT NULL,
  PRIMARY KEY (`msgid`),
  KEY `fk_receiver` (`sender_id`),
  KEY `fk_sender` (`receiver_id`),
  CONSTRAINT `fk_receiver` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_sender` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` (`msgid`,`sender_id`,`receiver_id`,`create_time`,`is_read`,`receive_time`,`msgcontent`) VALUES 
 (1,2,1,'2015-05-06 00:00:00',1,'2015-05-06 00:00:00','comment');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note_content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `fk_note_question` (`question_id`),
  KEY `fk_user_note` (`user_id`),
  CONSTRAINT `fk_note_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `fk_user_note` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `note`
--

/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` (`note_id`,`question_id`,`user_id`,`note_content`,`create_time`,`update_time`) VALUES 
 (1,1,1,'cannot choose  end ... rigid','2015-05-20 00:00:00','2015-05-20 00:00:00');
/*!40000 ALTER TABLE `note` ENABLE KEYS */;


--
-- Definition of table `paper`
--

DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '试卷名称',
  `duration` int(11) NOT NULL COMMENT '试卷考试时间',
  `quantity` int(11) DEFAULT NULL COMMENT '题目数量',
  `category_id` int(11) DEFAULT NULL COMMENT '题目所属学科,比如考研英语,gre,toefl等等',
  `type` varchar(50) DEFAULT NULL COMMENT '题目类型,包括选择题,填空题,简答题等等',
  `is_visible` tinyint(1) DEFAULT '0' COMMENT '是否所有用户可见,默认为0',
  `is_subjective` tinyint(1) DEFAULT '0' COMMENT '为1表示为包含主观题的试卷,需阅卷',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '试卷状态， 0未完成 -> 1已完成 -> 2已发布 -> 3通过审核 （已发布和通过审核的无法再修改）',
  `summary` text COMMENT '试卷概述',
  `creator` int(11) DEFAULT NULL COMMENT '创建人的账号',
  PRIMARY KEY (`paper_id`),
  KEY `fk_user_paper` (`creator`),
  CONSTRAINT `fk_user_paper` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paper`
--

/*!40000 ALTER TABLE `paper` DISABLE KEYS */;
INSERT INTO `paper` (`paper_id`,`name`,`duration`,`quantity`,`category_id`,`type`,`is_visible`,`is_subjective`,`status`,`summary`,`creator`) VALUES 
 (1,'simplePaper1',1800,1,1,NULL,1,0,0,NULL,1);
/*!40000 ALTER TABLE `paper` ENABLE KEYS */;


--
-- Definition of table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL COMMENT '问题名称/代号',
  `answer_id` int(11) DEFAULT NULL COMMENT '每个选项有一个id,answerid是正确选项的id',
  `content` varchar(500) NOT NULL COMMENT '题干',
  `reference` varchar(1000) DEFAULT NULL COMMENT '考虑带图片的题目',
  `category_id` int(11) DEFAULT NULL COMMENT '题目所属学科id,比如考研英语,gre,toefl等等',
  `type_id` int(11) DEFAULT NULL COMMENT '题目类型id,包括选择题,填空题,简答题等等',
  `options` varchar(300) DEFAULT NULL COMMENT '题目的选项,个数不定',
  `analysis` text COMMENT '题目分析',
  `appendix` text COMMENT '附加,备用',
  `creator` int(11) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `last_modify` datetime NOT NULL COMMENT '最后修改时间',
  `right_times` int(11) DEFAULT NULL COMMENT '正确次数',
  `expose_times` int(11) DEFAULT NULL COMMENT '被做次数',
  `wrong_times` int(11) DEFAULT NULL COMMENT '错误次数',
  `difficulty` int(5) DEFAULT NULL COMMENT '题目难度',
  PRIMARY KEY (`question_id`),
  KEY `fk_answer_option` (`answer_id`),
  KEY `fk_user_creator` (`creator`),
  KEY `fk_type_question` (`type_id`),
  KEY `fk_category_question` (`category_id`),
  CONSTRAINT `fk_answer_option` FOREIGN KEY (`answer_id`) REFERENCES `choice` (`option_id`),
  CONSTRAINT `fk_category_question` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_type_question` FOREIGN KEY (`type_id`) REFERENCES `question_type` (`id`),
  CONSTRAINT `fk_user_creator` FOREIGN KEY (`creator`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`question_id`,`name`,`answer_id`,`content`,`reference`,`category_id`,`type_id`,`options`,`analysis`,`appendix`,`creator`,`create_time`,`last_modify`,`right_times`,`expose_times`,`wrong_times`,`difficulty`) VALUES 
 (1,'filling',5,'Because he saw no_______ to the task assigned him, he worked at it in a very ________ way.',NULL,1,1,'1&2&3&4&5','选项中的D答案会对考生造成很大干扰，因为我们觉得see no end to实在是个天衣无缝的说法，舍之其谁?好，我们就暂且认为这个答案正确，代到句中去看个究竟，既然工作没完没了，他还要严格对待吗?\r\n\r\n　　这种逻辑关系显然并不理想，不符合平衡原则，那么就赶快舍弃这个答案，试着从第二个空白处入手，不难发现E中的perfunctory更适合一些，但是see no point to似乎很不常见，可是两个空白结合起来句子通顺合理，这就是我们到达到的平衡目的了。\r\n选项中的D答案会对考生造成很大干扰，因为我们觉得see no end to实在是个天衣无缝的说法，舍之其谁?好，我们就暂且认为这个答案正确，代到句中去看个究竟，既然工作没完没了，他还要严格对待吗?\r\n\r\n　　这种逻辑关系显然并不理想，不符合平衡原则，那么就赶快舍弃这个答案，试着从第二个空白处入手，不难发现E中的perfunctory更适合一些，但是see no point to似乎很不常见，可是两个空白结合起来句子通顺合理，这就是我们到达到的平衡目的了。\r\n选项中的D答案会对考生造成很大干扰，因为我们觉得see no end to实在是个天衣无缝的说法，舍之其谁?好，我们就暂且认为这个答案正确，代到句中去看个究竟，既然工作没完没了，他还要严格对待吗?\r\n\r\n　　这种逻辑关系显然并不理想，不符合平衡原则，那么就赶快舍弃这个答案，试着从第二个空白处入手，不难发现E中的perfunctory更适合一些，但是see no point to似乎很不常见，可是两个空白结合起来句子通顺合理，这就是我们到达到的平衡目的了。\r\n选项中的D答案会对考生造成很大干扰，因为我们觉得see no end to实在是个天衣无缝的说法，舍之其谁?好，我们就暂且认为这个答案正确，代到句中去看个究竟，既然工作没完没了，他还要严格对待吗?\r\n\r\n　　这种逻辑关系显然并不理想，不符合平衡原则，那么就赶快舍弃这个答案，试着从第二个空白处入手，不难发现E中的perfunctory更适合一些，但是see no point to似乎很不常见，可是两个空白结合起来句子通顺合理，这就是我们到达到的平衡目的了。\r\n这种逻辑关系显然并不理想，不符合平衡原则，那么就赶快舍弃这个答案，试着从第二个空白处入手，不难发现E中的perfunctory更适合一些，但是see no point to似乎很不常见，可是两个空白结合起来句子通顺合理，这就是我们到达到的平衡目的了。',NULL,1,'2015-05-20 00:00:00','2015-05-20 00:00:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;


--
-- Definition of table `question_tag`
--

DROP TABLE IF EXISTS `question_tag`;
CREATE TABLE `question_tag` (
  `question_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `creator` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`question_tag_id`),
  KEY `fk_question_tag_tid` (`tag_id`),
  KEY `fk_question_tag_qid` (`question_id`),
  CONSTRAINT `fk_question_tag_qid` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_question_tag_tid` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question_tag`
--

/*!40000 ALTER TABLE `question_tag` DISABLE KEYS */;
INSERT INTO `question_tag` (`question_tag_id`,`question_id`,`tag_id`,`create_time`,`creator`) VALUES 
 (1,1,1,'2015-05-20 00:00:00','1');
/*!40000 ALTER TABLE `question_tag` ENABLE KEYS */;


--
-- Definition of table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
CREATE TABLE `question_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `subjective` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='试题类型';

--
-- Dumping data for table `question_type`
--

/*!40000 ALTER TABLE `question_type` DISABLE KEYS */;
INSERT INTO `question_type` (`id`,`name`,`subjective`) VALUES 
 (1,'blanks filling',0);
/*!40000 ALTER TABLE `question_type` ENABLE KEYS */;


--
-- Definition of table `record`
--

DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `paper_id` int(11) DEFAULT NULL,
  `user_answer_id` int(11) DEFAULT NULL,
  `mark` tinyint(1) DEFAULT '0' COMMENT '是否标记',
  `duration` int(11) NOT NULL COMMENT '单道题目耗时',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  PRIMARY KEY (`record_id`),
  KEY `fk_answer_record` (`user_answer_id`),
  KEY `fk_paper_record` (`paper_id`),
  KEY `fk_question_record` (`question_id`),
  KEY `fk_user_record` (`user_id`),
  CONSTRAINT `fk_answer_record` FOREIGN KEY (`user_answer_id`) REFERENCES `choice` (`option_id`),
  CONSTRAINT `fk_paper_record` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`),
  CONSTRAINT `fk_question_record` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `fk_user_record` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `record`
--

/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` (`record_id`,`user_id`,`question_id`,`paper_id`,`user_answer_id`,`mark`,`duration`,`remark`) VALUES 
 (1,2,1,1,5,100,1690,NULL),
 (2,1,1,1,5,100,1500,NULL);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`role_id`,`name`,`description`,`create_time`,`update_time`) VALUES 
 (1,'admin','system administrator','2013-09-09 00:00:00','2014-09-09 00:00:00'),
 (2,'student','student','2013-09-09 00:00:00','2014-09-09 00:00:00');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL,
  `create_time` datetime NOT NULL,
  `creator` int(11) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `memo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`tag_id`,`tag_name`,`create_time`,`creator`,`is_private`,`memo`) VALUES 
 (1,'notes','2015-05-20 00:00:00',1,1,'this question is difficult');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `truename` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0' COMMENT '激活状态：0-未激活 1-激活',
  `state` tinyint(1) DEFAULT '0' COMMENT '在线状态：0-未在线 1-在线',
  `add_date` datetime DEFAULT NULL COMMENT '注册时间',
  `registertime` datetime DEFAULT NULL,
  `integral` int(11) DEFAULT NULL COMMENT '积分',
  `level` int(11) DEFAULT NULL COMMENT '等级',
  `addby` int(11) DEFAULT NULL COMMENT '某个用户添加的或者受某个用户邀请后注册的',
  `last_login_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`username`,`truename`,`password`,`email`,`phone`,`gender`,`birthday`,`enabled`,`state`,`add_date`,`registertime`,`integral`,`level`,`addby`,`last_login_time`,`login_time`) VALUES 
 (1,'song','songkehui','123456','songkehui_@126.com',NULL,'f','1994-12-10 00:00:00',0,0,'2015-04-09 00:00:00','2015-04-09 00:00:00',50,10,NULL,'2015-05-05 00:00:00','2015-05-06 00:00:00'),
 (2,'wang','wang','123456',NULL,NULL,NULL,NULL,0,0,'2015-03-09 00:00:00','2015-03-09 00:00:00',100,20,1,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `urid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`urid`),
  KEY `fk_role_user` (`role_id`),
  KEY `fk_user_role` (`user_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`urid`,`user_id`,`role_id`) VALUES 
 (1,1,1),
 (2,2,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
