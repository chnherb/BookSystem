/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : librarysys

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2017-01-07 16:31:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `bookinfo`;
CREATE TABLE `bookinfo` (
  `id` varchar(50) NOT NULL,
  `bookname` varchar(50) DEFAULT NULL,
  `typeid` varchar(50) DEFAULT NULL,
  `isbn` varchar(50) DEFAULT NULL,
  `bookauthor` varchar(50) DEFAULT NULL,
  `bookprice` int(4) DEFAULT NULL,
  `totalbook` int(10) DEFAULT NULL,
  `caseid` varchar(50) DEFAULT NULL,
  `bookintime` varchar(50) DEFAULT NULL,
  `operatorid` varchar(50) DEFAULT NULL,
  `bookcomment` varchar(500) DEFAULT NULL,
  `bookaddress` varchar(100) DEFAULT NULL,
  `currbook` int(10) DEFAULT NULL,
  `bookcode` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK778603174965D5D7` (`typeid`),
  KEY `FK7786031742B9EA4D` (`operatorid`),
  KEY `FK778603172B0A8843` (`caseid`),
  CONSTRAINT `FK778603172B0A8843` FOREIGN KEY (`caseid`) REFERENCES `tb_bookcase` (`id`),
  CONSTRAINT `FK7786031742B9EA4D` FOREIGN KEY (`operatorid`) REFERENCES `manager` (`id`),
  CONSTRAINT `FK778603174965D5D7` FOREIGN KEY (`typeid`) REFERENCES `booktype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bookinfo
-- ----------------------------
INSERT INTO `bookinfo` VALUES ('1', 'Java Enterprise最佳实践', '402880204d2d1df4014d2d1e77920000', '9787508314136', 'The OReilly Java Authors', '38', '43', '402880204d2d36cf014d2d3d50780002', '2015-05-26', null, '《Java Enterprise最佳实践》内容简介：Java 2企业版（J2EE）API已经改变了我们对企业计算的思维方式。不过，许多程序员都发现仅仅学习J2EE API是不够的。要使用Servlet、JDBC、XML、EJB和JSP来编写高效、健壮的企业级代码，可能是一项非常艰巨的任务。实际上，若想在编写J2EE应用代码方面成为一个专家，惟一的方法就是经过数年尝试与错误的历练。毋庸讳言，《Java Enterprise最佳实践》将为你提供这些作者的一些经验之谈，从而为你答疑解惑。', '中国电力出版社', '42', '1');
INSERT INTO `bookinfo` VALUES ('402837815547a2f9015547a6963d0000', '我不知道该如何像正常人那样生活', '402837815924d0b501592508d2910000', '9787532161690', '徐晚晴', '29', '3', '1', '2016-06-13', null, '“我，大学毕业，没有工作。我无所事事，却又活得理直气壮、恬不知耻。我跟人处不好，跟世界处不好，甚至无法跟自己好好相处。我跟自己闹别扭，也让别人不痛快。这就是我的生活，没有任何故事，我不想让任何故事发生。理论上讲，我应该像个正常人一样生活，工作，结婚，抱怨，操持家务。可我始终不知道该如何像正常人那样生活。', '上海文艺出版社', '0', '16');
INSERT INTO `bookinfo` VALUES ('402837815915089c0159150a33bb0000', '夜色人生', '4028378159250f0a015925115f4a0000', '9787539992426', '[美] 丹尼斯·勒翰', '49', '10', '1', '2016-12-20', null, '人生无非就是，有些人失去了自我，有些人找到了自我。——————————波士顿，1926年。爵士乐在弥漫，酒在流动，子弹在飞，一个男人打算为这个世界打上自己的标记。-乔•考克林，身为高级警官的儿子，却加入了当地最有势力的黑帮。然而，他总说自己“不是黑帮分子，而是法外之徒”，不想过别人定义好的生活，想创造属于自己的规则。他的夜色人生徐徐展开，从华丽炫目的爵士时代波士顿，到欲望横流的佛罗里达州坦帕，再到古巴的酷热街道。', '江苏凤凰文艺出版社', '10', '12');
INSERT INTO `bookinfo` VALUES ('4028378159250f0a01592529e77e0001', '明朝那些事儿（壹）', '1', '9787505722460', '当年明月', '24', '20', '402880204d2d36cf014d2d3d50780002', '2016-12-22', null, '', '中国友谊出版公司', '20', '1002');
INSERT INTO `bookinfo` VALUES ('4028378159250f0a0159252d2cf60008', '如何看电影', '4028378159250f0a0159252a87b70005', '9787519219239', '[英] 大卫·汤姆森（David Thomson）', '46', '2', '8a9ee2985520c10e015520c230b50000', '2016-12-21', null, '看电影是一种怎样的体验？看的方式有许多种，就像电影的定义也有许多种；这本书的终极主题是关于看，或者说看这个动作本身；看电影是一个富有情感的过程，其动作本身就能激发情感。作为一位阅片无数的影评人，大卫•汤普森会告诉你看电影究竟在看什么，是一次艺术的爆炸？又或者是看个开心？ 这是一本研究电影的指南，能让作为观众的你看得更开心、更感动。', '世界图书出版公司北京公司', '2', '1003');
INSERT INTO `bookinfo` VALUES ('402880204d2c4a91014d2cc0867f0002', 'Spring 3.0就这么简单', '402880204d2d1df4014d2d1e77920000', '9787115298393', '陈雄华 / 林开雄', '59', '33', '1', '2015-05-25', null, 'Spring 3.0就这么简单，ISBN：9787115298393，作者：陈雄华 林开雄 著', '人民邮电出版社', '32', '2');
INSERT INTO `bookinfo` VALUES ('402880204d2cdca5014d2ce003a10000', '计算机网路', '402880204d2d1df4014d2d1e77920000', '9787302089773', 'Andrew S. Tanenbaum', '60', '111', '1', '2015-05-21', null, '《计算机网络（第4版）》全书按照网络协议模型（物理层、数据链路层、介质访问控制子层、网络层、传输层和应用层），自下而上系统地介绍了计算机网络的基本原理，并给出了大量实例。', '清华大学出版社', '109', '3');
INSERT INTO `bookinfo` VALUES ('402880f44d9308d8014d934c05fb0000', '数据结构', '402880204d2d1df4014d2d1e77920000', '9787302147510', '严蔚敏 / 吴伟民', '30', '40', '1', '2015-05-27', null, '数据结构》（C语言版）是为“数据结构”课程编写的教材，也可作为学习数据结构及其算法的C程序设计的参数教材。本书的前半部分从抽象数据类型的角度讨论各种基本类型的数据结构及其应用；后半部分主要讨论查找和排序的各种实现方法及其综合分析比较。', '清华大学出版社', '40', '4');
INSERT INTO `bookinfo` VALUES ('402880f44d9308d8014d934c83010001', '唐诗三百首', '8a90c6454d8f79a7014d8fb7c1350000', '9787101068238', '顾青 编注', '100', '2', '402880204d2d36cf014d2d3d50780002', '2015-05-27', null, '清朝无锡人孙洙（别号蘅塘退士）和夫人徐兰英编选的《唐诗三百首》是数以千计的唐诗选集中流传最广、影响最大的一个选本，至今仍是最受读者欢迎的学习唐诗的基础读物。《唐诗三百首》自编成以来，屡刻每有增补，此次以二十世纪五十年代中华书局刊印的光绪间日本四藤吟社刊本为底本，进行了重新注释整理。，有助于儿童健康的成长', '中华书局', '0', '5');
INSERT INTO `bookinfo` VALUES ('402880f44d9308d8014d934d309d0002', '暴走漫画', '8a90c6454d8f79a7014d8fb7c1350000', '9787541686078', '《暴走漫画》创作部', '10', '10', '402880204d2d36cf014d2d3d50780002', '2015-05-27', null, '《暴走漫画》全书分为四个板块，有暴走校园、暴走家庭、暴走感悟和暴走故事。从不同方位让你的节操碎了一地，一边拍着大腿说“哎呀原来我不是一个人”一边乖乖交出自己的膝盖，手握《暴走漫画》难以挪开视线，巴不得再看看谁跟你一样也经历过同样的糗事，有过同样的感悟。更，有助于儿童健康的成长', '云南科技出版社', '9', '6');
INSERT INTO `bookinfo` VALUES ('402880f44d9308d8014d934e78990004', '拼音学习卡', '8a90c6454d8f79a7014d8fb7c1350000', '9787806022962', '肖舟', '10', '30', '402880204d2d36cf014d2d3d50780002', '2015-05-27', null, '看图识字卡共64张，卡片以单个的字为对象，配以形象生动的画面，背面注有拼音和英语，并列举了常见的词。此卡适用于1—6岁的儿童，它集知识性、趣味性、科学性于一体，是幼儿教育的首选教材。，有助于儿童健康的成长', '珠海出版社', '29', '8');
INSERT INTO `bookinfo` VALUES ('402880f44d9308d8014d934f050b0005', '阿Q正传', '1', '9787806222850', '鲁迅 / 丰子恺 ', '20', '30', '402880204d2d36cf014d2d3d50780002', '2015-05-27', null, '《阿Q正传》讲述值此世纪末，衷心祈愿这里所议论的人物在下一世纪的中国现实生活中淡出；当然，作为光辉的典型人物，他将和哈姆雷特、唐·吉诃德等不朽的名字一样万古不朽。阿Q，是一个卑微渺小的人物，但却是一个巨大的名字。，有助于儿童健康的成长', '上海书店出版社', '29', '9');
INSERT INTO `bookinfo` VALUES ('8a9ee298551def8f01551df3a0f20000', '社会心理学', '402837815924d0b501592508d2910000', '9787501956395', 'E. Aronson ', '90', '5', '1', '2016-06-22', null, '《社会心理学》(第5版)(中文第2版)作者是美国杰出的社会心理学家，第一作者Elliot Aronson教授是美国心理学会(APA)成立110多年来唯一包揽杰出写作奖、教学奖和研究奖这三个主要奖项的心理学家，', '中国轻工业出版社', '5', '11');
INSERT INTO `bookinfo` VALUES ('ff8080814df062fc014df067c5170000', '应用商务统计分析', '1', '9787301128930', '王汉生', '35', '100', '1', '2015-06-14', null, '《北京大学光华管理学院教材•商务统计系列•应用商务统计分析》是以实际案例驱动的应用统计学教材，包括线性回归、方差分析、协方差分析、0-1变量回归、定序回归、泊松回归、生存模型和自回归等内容。', '北京大学', '100', '1001');

-- ----------------------------
-- Table structure for booktype
-- ----------------------------
DROP TABLE IF EXISTS `booktype`;
CREATE TABLE `booktype` (
  `id` varchar(50) NOT NULL,
  `typename` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of booktype
-- ----------------------------
INSERT INTO `booktype` VALUES ('1', '科学', null, '123');
INSERT INTO `booktype` VALUES ('402837815924d0b501592508d2910000', '心理学', null, '');
INSERT INTO `booktype` VALUES ('4028378159250f0a015925115f4a0000', '情感类', null, '');
INSERT INTO `booktype` VALUES ('4028378159250f0a0159252a06d00002', '历史', null, '');
INSERT INTO `booktype` VALUES ('4028378159250f0a0159252a41c70003', '文化', null, '');
INSERT INTO `booktype` VALUES ('4028378159250f0a0159252a67ff0004', '政治', null, '');
INSERT INTO `booktype` VALUES ('4028378159250f0a0159252a87b70005', '电影', null, '');
INSERT INTO `booktype` VALUES ('4028378159250f0a0159252aa12f0006', '小说', null, '');
INSERT INTO `booktype` VALUES ('402880204d2d1df4014d2d1e77920000', '计算机类', null, '12312');
INSERT INTO `booktype` VALUES ('8a90c6454d8f79a7014d8fb7c1350000', '儿童书籍', null, '');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` varchar(50) NOT NULL,
  `readerid` varchar(50) DEFAULT NULL,
  `bookid` varchar(50) DEFAULT NULL,
  `borrowtime` varchar(50) DEFAULT NULL,
  `backtime` varchar(50) DEFAULT NULL,
  `isback` varchar(50) DEFAULT NULL,
  `managerid` varchar(50) DEFAULT NULL,
  `money` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAD8CA9F52A2AB31A` (`bookid`),
  KEY `FKAD8CA9F5B6299BE0` (`readerid`),
  KEY `FKAD8CA9F5263B3316` (`managerid`),
  CONSTRAINT `FKAD8CA9F5263B3316` FOREIGN KEY (`managerid`) REFERENCES `manager` (`id`),
  CONSTRAINT `FKAD8CA9F52A2AB31A` FOREIGN KEY (`bookid`) REFERENCES `bookinfo` (`id`),
  CONSTRAINT `FKAD8CA9F5B6299BE0` FOREIGN KEY (`readerid`) REFERENCES `reader` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('297eeecc4da8c8f0014da8d31e180000', '402880014d6fe076014d6fe199cf0000', '402880204d2cdca5014d2ce003a10000', '2015-05-14', '2015-05-29', '已还', '2', '0');
INSERT INTO `borrow` VALUES ('297eeecc4da8c8f0014da8d3801b0001', '402880014d6fe076014d6fe199cf0000', '402880f44d9308d8014d934c83010001', '2015-05-30', '2015-06-11', '已还', '2', '1');
INSERT INTO `borrow` VALUES ('297eeecc4da8c8f0014da8d3ebcd0002', '402880014d6fe076014d6fe199cf0000', '402880f44d9308d8014d934f050b0005', '2015-05-30', '2015-06-30', '已还', '2', '1');
INSERT INTO `borrow` VALUES ('402837815547a2f9015547a752bf0001', '1', '402837815547a2f9015547a6963d0000', '2016-12-16', '2017-02-16', '未还', '2', '1');
INSERT INTO `borrow` VALUES ('402837815547a2f9015547a7a9450002', '402880014d6fe076014d6fe199cf0000', '402837815547a2f9015547a6963d0000', '2016-09-13', '2016-10-13', '未还', '2', '0');
INSERT INTO `borrow` VALUES ('402837815547a2f9015547a7f2370003', '402837815920ba13015920d773c70000', '402837815547a2f9015547a6963d0000', '2016-09-17', '2016-11-17', '未还', '2', '0');
INSERT INTO `borrow` VALUES ('402881e454b475f30154b47c5b330006', '402837815920ba13015920d773c70000', '402880f44d9308d8014d934e78990004', '2016-10-20', '2016-11-20', '未还', '2', '0');
INSERT INTO `borrow` VALUES ('402881e654b891300154b895f1660002', '1', '402880204d2cdca5014d2ce003a10000', '2016-05-02', '2017-01-09', '已还', '1', '1');
INSERT INTO `borrow` VALUES ('402881e654b891300154b8964aac0003', '1', '402880204d2c4a91014d2cc0867f0002', '2016-05-09', '2017-02-02', '已还', '2', '1');
INSERT INTO `borrow` VALUES ('402881e654b891300154b896a0a20004', '402880014d6fe076014d6fe199cf0000', '402880f44d9308d8014d934d309d0002', '2016-05-17', '2016-05-11', '已还', '2', '0');
INSERT INTO `borrow` VALUES ('8a90da544debff5c014dec1bfc5b0000', '1', '1', '2015-06-13', '2016-07-07', '未还', '2', '1');
INSERT INTO `borrow` VALUES ('8a90da544dec2c49014dec3bc9150000', '1', '402880f44d9308d8014d934c83010001', '2015-06-18', '2016-10-01', '未还', '2', '1');

-- ----------------------------
-- Table structure for houseinfo
-- ----------------------------
DROP TABLE IF EXISTS `houseinfo`;
CREATE TABLE `houseinfo` (
  `id` varchar(32) NOT NULL,
  `houseComment` varchar(255) DEFAULT NULL,
  `househao` varchar(255) DEFAULT NULL,
  `isblank` varchar(255) DEFAULT NULL,
  `housetypeid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE3BEABAE5D872910` (`housetypeid`),
  CONSTRAINT `FKE3BEABAE5D872910` FOREIGN KEY (`housetypeid`) REFERENCES `housetype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of houseinfo
-- ----------------------------

-- ----------------------------
-- Table structure for housetype
-- ----------------------------
DROP TABLE IF EXISTS `housetype`;
CREATE TABLE `housetype` (
  `id` varchar(32) NOT NULL,
  `money` varchar(255) DEFAULT NULL,
  `typecomment` varchar(255) DEFAULT NULL,
  `typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of housetype
-- ----------------------------

-- ----------------------------
-- Table structure for infopublish
-- ----------------------------
DROP TABLE IF EXISTS `infopublish`;
CREATE TABLE `infopublish` (
  `id` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `createtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infopublish
-- ----------------------------
INSERT INTO `infopublish` VALUES ('402880f44d9308d8014d9355f2480006', '闭馆通知', '  今天闭馆， 望大家谅解！！', '2016-11-18');
INSERT INTO `infopublish` VALUES ('402881e4542d333f01542d41898b0000', '2016级研究生硕士英语听说考试安排', '考试时间：2017年1月7日星期六上午：8:30-----9:30\r\n\r\n考试地点：第 I、III 教学楼', '2016-12-13');
INSERT INTO `infopublish` VALUES ('402881e454b4cf240154b4f225f90000', '201 7 年全国硕士研究生统一入学考试 南京理工大学考点（ 3204 ）公告', '1、考试时间：2016年12月24日-26日2、考试地点：南京理工大学第一、二、三、四教学楼，考生须提前一天查看考场（校区数字地图），具体考场分布表见下表《2017年硕士研究生入学考试考场安排》。因我考点校园面积较大，请提前查看考场。', '2016-12-17');
INSERT INTO `infopublish` VALUES ('402881e454b4cf240154b4f2c9b50001', '2016级研究生矩阵分析与计算考试安排', '考试时间：2017年1月5日星期四(晚)：19:00----21:00\r\n\r\n    考试地点：第  I  教学楼(第一教学楼)', '2016-12-19');
INSERT INTO `infopublish` VALUES ('402881e454b4cf240154b4f356530002', '2016级研究生硕士综合英语考试安排', '考试时间：2017年1月7日星期六上午：10:00-----12:00\r\n\r\n考试地点：第 I 教学楼', '2016-12-13');
INSERT INTO `infopublish` VALUES ('402881e454b4cf240154b4f4b43b0003', '关于学术月讲座的通知', '11月20号图书馆305将开展XX讲座，请同学们积极参与', '2016-10-26');
INSERT INTO `infopublish` VALUES ('8a90cfd94d900122014d900570650000', 'XX学术论文', '  软件工程的同学请于12月22日到软件工程系参见毕业设计开题报告会', '2016-11-24');
INSERT INTO `infopublish` VALUES ('8a9ee298552099f3015520a56a0e0000', '应用统计考试通知', '11月5日上午九点到十一点应用统计考试，各位选修该门课程的同学请按照附件中的信息参加考试', '2016-10-29');
INSERT INTO `infopublish` VALUES ('ff8080814df04cf3014df050e9550000', '校辩论赛通知', '11月15日校辩论赛将于图书馆一楼报告厅举行，欢迎广大同学前来', '2015-11-13');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'admin', '123', '123', 'root');
INSERT INTO `manager` VALUES ('2', 'root', '123', '123', 'root');

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader` (
  `id` varchar(50) NOT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `readerno` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `roleid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES ('1', '男', '黄波', '516106001827', '123', '1234', 'chnhuangbo@qq.com', '402881e454b30dfd0154b316be9d0001');
INSERT INTO `reader` VALUES ('402837815920ba13015920d773c70000', '男', '徐安孟', '516106001823', '', '', '', '402881e454b30dfd0154b316be9d0001');
INSERT INTO `reader` VALUES ('402837815920ba13015920d81a850001', '男', '唐军', '516106001764', '', '', '', '402881e454b30dfd0154b316be9d0001');
INSERT INTO `reader` VALUES ('402837815920ba13015920d8bd9d0002', '男', '汤云鹏', '516106001801', '', '', '', '402881e454b30dfd0154b316be9d0001');
INSERT INTO `reader` VALUES ('402880014d6fe076014d6fe199cf0000', '女', '刘平', '116106000725', '123', '', '', '402881e454b30dfd0154b316be9d0001');
INSERT INTO `reader` VALUES ('402881e454b475f30154b478ddd00000', '男', '姜殷伟', '516106001833', '123', '', '', '402881e454b30dfd0154b316be9d0001');
INSERT INTO `reader` VALUES ('402881e454b475f30154b479580a0001', '男', '张三', '116106001234', '123', '', '', null);
INSERT INTO `reader` VALUES ('402881e454b475f30154b47998f20002', '男', '李四', '116106001235', '123', '', '', null);
INSERT INTO `reader` VALUES ('402881e454b475f30154b479d32e0003', '男', '王五', '116106001236', '123', '', '', null);
INSERT INTO `reader` VALUES ('402881e454b475f30154b47a27e10004', '男', '赵六', '116106001237', '123', '', '', null);
INSERT INTO `reader` VALUES ('402881e454b475f30154b47aa73b0005', '男', '周七', '116106001238', '123', '', '', null);
INSERT INTO `reader` VALUES ('402881e454b4c9940154b4cdd0670000', '男', 'lisi', '116106001238', '123', '', '', null);

-- ----------------------------
-- Table structure for readertype
-- ----------------------------
DROP TABLE IF EXISTS `readertype`;
CREATE TABLE `readertype` (
  `id` varchar(50) DEFAULT NULL,
  `typeName` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of readertype
-- ----------------------------
INSERT INTO `readertype` VALUES ('1', '学生', null, '12312');
INSERT INTO `readertype` VALUES ('402880204d2d4ff8014d2d5210cf0001', '工人', null, '');
INSERT INTO `readertype` VALUES ('402881e454b30dfd0154b316a10b0000', '本科生', null, '');
INSERT INTO `readertype` VALUES ('402881e454b30dfd0154b316be9d0001', '研究生', null, '');
INSERT INTO `readertype` VALUES ('402881e454b30dfd0154b316daf90002', '教职工', null, '');

-- ----------------------------
-- Table structure for someone
-- ----------------------------
DROP TABLE IF EXISTS `someone`;
CREATE TABLE `someone` (
  `id` varchar(32) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `days` varchar(255) DEFAULT NULL,
  `endTime` varchar(255) DEFAULT NULL,
  `factmoney` varchar(255) DEFAULT NULL,
  `margin` varchar(255) DEFAULT NULL,
  `startTime` varchar(255) DEFAULT NULL,
  `houseid` varchar(32) DEFAULT NULL,
  `userid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB1D1B0D2CCBC957C` (`houseid`),
  KEY `FKB1D1B0D243A93B0` (`userid`),
  CONSTRAINT `FKB1D1B0D243A93B0` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `FKB1D1B0D2CCBC957C` FOREIGN KEY (`houseid`) REFERENCES `houseinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of someone
-- ----------------------------

-- ----------------------------
-- Table structure for tb_bookcase
-- ----------------------------
DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bookcase
-- ----------------------------
INSERT INTO `tb_bookcase` VALUES ('1', '1001', '12312');
INSERT INTO `tb_bookcase` VALUES ('402880204d2d36cf014d2d3d50780002', '1002', '');
INSERT INTO `tb_bookcase` VALUES ('8a9ee2985520c10e015520c230b50000', '1003', '');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL,
  `age` varchar(32) DEFAULT NULL,
  `userName` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '1', '1');
INSERT INTO `t_user` VALUES ('2', '2', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `age` varchar(32) DEFAULT NULL,
  `userName` varchar(32) DEFAULT NULL,
  `userCommtent` varchar(255) DEFAULT NULL,
  `userSex` varchar(255) DEFAULT NULL,
  `userTel` varchar(255) DEFAULT NULL,
  `useraAge` varchar(32) DEFAULT NULL,
  `userid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
