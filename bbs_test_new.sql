/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50558
 Source Host           : localhost:3306
 Source Schema         : bbs_test_new

 Target Server Type    : MySQL
 Target Server Version : 50558
 File Encoding         : 65001

 Date: 06/07/2020 22:12:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `apassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `atime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '2018-04-12 01:33:06');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  `titles` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '帖子标题',
  `fcontent` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '帖子内容',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子图片',
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属板块名字',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '发帖时间',
  `userid` int(11) NOT NULL COMMENT '发帖人id',
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '发帖人姓名',
  `status` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '帖子审核状态(0为待审核，1为通过审核，2为未通过审核，默认为0)',
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发帖表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (40, 'java中的Map说明', 'Map\r\n映射表（也称为关联数组）的基本思想是它维护的是键-值（对）关联，因此你可以使用键来查找值。标准的java类库中包含了Map的几种基本实现。\r\nHashMap\r\nMap基于散列表的实现（它实现了HashTable）。插入和查询“键值对”的开销是固定的。可以通过构造器设置容量和负载因子。以调整容器的性能。\r\nTreeMap\r\n基于红黑树的实现。查看“键”或者“键值对”时，它们会被排序（次序由Comparable或Comparator决定）。TreeMap的特点在于，所得到的结果是经过排序的。TreeMap是唯一的带有subMap()方法的Map，它可以返回一个子树。', '387c3a86-fd76-48ec-b16a-91a2adc127f54be57d50d7eb0ef7bac518d2e417c5b0.jpg', 'java', '2019-07-08 12:12:15', 26, 'swift', 00000000001);
INSERT INTO `article` VALUES (69, '“97年少女被继父虐待？”浙江大叔发现，她没那么清纯！', '亲生父亲去世，又被继父虐待，这样的身世，谁看了都觉得可怜。去年，绍兴的杨先生就遇上了 这么个女网友，一来二去，还对女孩儿倍加怜惜。只是让杨先生万万没想到的是，女孩并非他想得那么清纯简单。杨先生今年49岁了，着急脱单的他抱着试试看的心态，注册了相亲交友软件。没过多久，一个用户名为“只愿一人心“的女孩，主动添加他为好友。看着对方清纯可人的头像，杨先生同意了。一来二去，两人聊得越来越投机，而女孩儿也开始向杨先生吐露自己的身世。受害人杨先生：“她说她离家出走，说她被她爸爸赶出来了，她说她没吃饭 ，饿，老是这样说。” 女孩自称“王芯巧”，97年出生，亲生父亲很早就去世了，继父有事没事就会虐待她。说得杨先生十分心疼。所以他经常会给女孩打点饭钱、住宿费，前前后后也有一万多。但奇怪的是，当杨先生每次提出见面时，女孩却总是不见踪影，最后还被拉黑了。受害人杨先生：“她到一个地方，把车票、地址准确位置发给我，但我就是见不到她的人，她每次都把手机关机，只有要钱的时候手机才开机。”杨先生越想越不对劲，觉得自己是不是遭遇诈骗了，于是到派出所报警求助。经调查，民警发现这个自称王芯巧的女孩，实际上是一个叫沈某的男性。民警：“他交代自己在一个交友软件上，认识其他单身男性，聊的好的就加微信，开始虚构自己的身世，虚构生活，说自己的身世怎么可怜，跟所有网络相亲诈骗一样套路，诈骗杨先生这一切都是沈某自导自演的，只是深陷情网的杨先生被打动 ，一直没发现其中的猫腻。”而类似杨先生遭遇的，另外还有15人。2月20日，绍兴警方远赴云南，在当地 警方的配合下，将犯罪嫌疑人沈某抓获归案。目前，沈某已经被刑事拘留，其余受害人警方正在逐一进行通知。网络交友请提高警惕，也许和你聊天的就是个抠脚大汉', 'fec663df-b47e-4428-909d-ea28d51e88039a3c3b51fc9c38a8f7584a1910f04bd5.jpg', 'java', '2019-07-08 09:55:34', 26, 'swift', 00000000001);
INSERT INTO `article` VALUES (83, '30句最值得收藏的一句话心情签名', '1.万般皆苦，唯有自渡。2.小舟从此逝，江海寄余生。3.我还是很喜欢你，像风走了八千里，不问归期。我还是很喜欢你，像鲸沉于海底温柔呼吸，痴极嗔极。我还是很喜欢你，柳动蝉鸣，日落潮汐，不能自己。4.白茶清欢无别事，我在等风也等你。5.知世故而不世故，处江湖而远江湖。人情冷暖已看透，赤子之心远不丢。世事洞穿，天真不泯。6.可以一落千丈却偏要一鸣惊人。7.雪泥鸿爪，细雨梅花。8.归去，也无风雨也无晴。9.一蓑烟雨任平生。10.我喜欢春天的樱花，夏天的矢车菊，秋天的百里香，冬天的腊梅，还有每天的你。11.你所在之处，是我不得不思念的天涯海角。12.玲珑骰子安红豆，入骨相思知不知。13.未闻花喜，但见己悲。14.千钟美酒，三万六千场，一曲满庭芳。15.但见白驹过，岂有丹心同。16.桓伊去后，知孤负，秋多少。17.人生如逆旅，我亦是行人。18.无人与我立黄昏，无人问我粥可温。无人与我捻熄灯，无人共我书半生。19.终有一日，你我各自结亲。一妻二妾，三四儿女。五六年间，沧海桑田，历历过往七八皆成旧梦。剩余二三不过年少轻狂，老来相忆 只余一声轻叹。20.吾妹霓凰，见字如面。兄有三愿，一愿长安康，二愿常喜乐，三愿莫痴候。戎马倥偬，逝水如斯，不可彷徨独宿。今生奈何，情深缘浅。偷得朝夕已是奢，苍天怜我。承君一诺，来生必践。青青河畔，寻常人家，粗衣淡茶，共白头，长相守。21.人非木石皆有情，不如不遇倾城色。22.心有猛虎,细嗅蔷薇;盛宴之后,泪流满面。23.纵有万般非吾属，伴得白马啸西风。24.鸟儿愿为一朵云，云儿愿为一只鸟。25.热闹中着一冷眼，便省许多苦心思；冷落处存一热心，便得许多真趣味。26.一叶浮萍归大海，人生何处不相逢？27.世间事，除了生死，哪一件不是闲事。28.人生一世，草生一春。来如风雨，去似微尘。29.山一程，水一程，身向榆关那畔行，夜深千帐灯。风一更，雪一更，聒碎乡心梦不成，故园无此声。30.曾因酒醉鞭名马，生怕情多累美人。', '2.jpg', '架构', '2019-07-02 19:33:07', 28, '陈意涵', 00000000001);
INSERT INTO `article` VALUES (84, '大清亡了，满族也亡了', '“你姓关，你是满族人么？”\n“嗯嗯。”\n“那你高考加分吧？”\n“本省加5分，省外不加分。”\n“那你会说满语么？”\n“......”从来没人问过我，“你会说满语么？” ，可能他们潜意识里觉得满、汉只是字上的区别罢，可能大部分中国人都是这么觉得罢，可能这都是我自己的胡思乱想罢。然而，一个没有语言的民族还算什么民族呢，尽管不愿承认，可我还是想说满族早已是名存实亡，清朝没了，满族也跟着没了......满族也不是一下子就消亡的，如果非要把消亡归咎到一个原因，那就是最初初的时候不该入主关内。说来清朝得以入主中原也是得了天时的便宜，崇祯同志本来都撸起袖子准备好好整治一下这杂乱的江山的，无奈还没等操作呢，那边李自成就勃起了，大明朝第一勇士吴三桂同志还不在，当他得知李自成进京的时候，崇祯同志都已经带着屈辱愤恨不甘自挂东南枝好几天了，又不想投降起义的李自成军，不知道这傻子咋想的就引清兵入关了，感觉以吴三桂的英勇和李自成的杂牌军大战一场说不定会赢啊。于是乎我建州女真族可以说毫不费力的就进京了啊，简直不要太容易。当然其实也不是很容易，因为大明朝戍边的将士都称得上是条汉子，吴三桂就不说了。没入关前努尔哈赤还和袁崇焕在宁远大干了一场，被红衣大炮轰的晕头转向的，有的人为了夸大袁崇焕的功绩，甚至说努尔哈赤被轰死了，不管努尔哈赤是否因这场战役而死，袁崇焕都够吹一辈子的了，可惜崇祯同志脑子瓦特把他干死了。说来让少数民族去统治文化、思想都比较先进的汉族实际上是不太容易的。在汉民族早就吟诗作赋的时候，其他少数民族还在想着明天去哪猎点野味让我的族人不忍饥挨饿。清朝最最令汉人反感的制度就是薙(通 剃)发了吧，那个时代“身体发肤，受之父母”的思想太深入骨血，另一方面也有碍观瞻呐，以现在的审美头顶没头发也是不好看的吧，可能多尔衮想的是头顶没头发骑马时跑的快之类的优势，毕竟骑射是我大清第一武功。感觉好像说跑偏了，反正少数民族去统治汉族是不太容易的，以至于从顺治到康熙一直都是在为了维护国内的治安而操心，四处征战，那时候的清朝还保留着满族的骁勇善战，几乎每次的收复失地都写进了历史课本。窃以为清朝到了乾隆时期就开始走下坡路了，前几代帝王苦心操持攒了一大笔家业，子孙一瞅，欸呦喂，我这大好河山，我这国库还有不少钱呢，嗨起来~~完蛋了。。。到了清朝末期，慈禧老太太还是个脑残，所以说娶媳妇一定要找学识见识都有些层次的，那些听话还笨的虽然看起来可爱，然而过日子不是养宠物啊。又整跑偏了，3、2、1，收。历史大都是相似的，每个朝代到不行的时候，都会有各方势力反抗。清末到近代的表现真的是有够垃圾，不然也不会让革命党人钻了空子，辛亥革命早期的时候喊着“驱除鞑虏，恢复中华”，为了革命忽悠一些没啥文化的老实人，鼓吹满汉是不同的人种，其中有个叫邹容的，就是下图这个人文笔不咋地还挺能白话，我写这篇文章的时候看过《革命军》全文了，其论述意在界定满族和汉族敌我分明的界限，只能说当时的邹容还太年轻，当时的革命党人也大都是些跟他年纪相仿的愤青，就像当下的网友，总是站在道德的制高点想着制裁别人，在这《革命军》的鼓动下，大家都有了“满族满洲非我族类”的共识，据说汪精卫等人还表达过满族在明末就已经是敌国、甚至说东北不是我国领土之类云云。（汪精卫身为民国十大美男之一难道这么sb么，怪不得后来填海了，留下了精卫填海的典故）\n孙文也跟着给满族人和它们建立的政府取了近20种绰号。什么“满胡”、“满洲靴子”、“满奴”、“满贼”、“异种”、“外国人”，而汉族则是“皇汉”，太平天国是继承大明朝谋恢复的汉家人。倘使当初清军不入关是否清朝就不用背负那么多骂名？是否满族以及这个国家都是另一番景象？是否现在的我不是在这里码字，而是纵马驰骋在松嫩平原？算了，都过去了~一个民族连语言都没了还算什么民族，大清亡了，满族也跟着亡了其实我写的都是冰山一角，思绪也比较凌乱，虽然和杜甫一样穷困潦倒，却少了杜甫的才情，还是好好学习吧，就酱参考资料：', 'ef4a423f-6e1a-4ea8-895d-5a441676bde3c41cf21c496393eeed52561cb3f24103.jpg', 'C++', '2020-06-11 11:19:50', 26, 'swift', 00000000001);
INSERT INTO `article` VALUES (85, '此僧仅一首《绝句》，就被载入宋代诗史，朱熹和朱自清都称赞不已', '自佛教传入中国，受中国传统文化影响，诞生了一个新的文化群体——诗僧。而且在中国历史上，许多诗人、词人都喜欢与诗僧交往、游乐。作为一个新兴的诗人群体，他们对中国传统诗歌文化产生了重大影响。历史上也诞生了一大批代表人物，如王梵志、寒山、皎然、贯休、齐己、佛印、志南等都是著名的诗僧。众多诗僧中，我们最熟悉的可能就是志南了。志南是南宋诗僧，志南是他的法号，生平不详。志南的生活状态已不可考，只知道他在当时的文坛上也没有“中兴四大诗人”（尤袤、杨万里、范成大、陆游）以及“二泉先生”（上饶二泉：赵蕃与韩淲）诸人的风头那么盛。但凭借短短的一首诗，也是其流传最广的一首诗，就让自己的名字载入了宋代诗史。这首诗就是《绝句·古木阴中系短篷》，我们一起来读：《绝句》宋·志南古木阴中系短篷，杖藜扶我过桥东。沾衣欲湿杏花雨，吹面不寒杨柳风。这首小诗，写诗人在微风细雨中拄杖春游的乐趣。诗前两句叙事。写年老的诗人，驾着一叶小舟，停泊到古木阴下，他上了岸，拄着拐杖，走过了一座小桥，去欣赏眼前无边的春色。诗人拄杖春游，却说“杖藜扶我”，是将藜杖人格化了，仿佛它是一位可以依赖的游伴，默默无言地扶人前行，给人以亲切感，安全感，使这位老和尚游兴大涨，欣欣然通过小桥，一路向东。桥东和桥西，风景未必有很大差别，但对春游的诗人来说，向东向西，意境和情趣却颇不相同。 “东”，有些时候便是“春”的同义词，譬如春神称作东君，东风专指春风。诗人过桥东行，正好有东风迎面吹来，无论西行、北行、南行， 都没有这样的诗意。杏花盛开，细雨绵绵，杨柳婀娜，微风拂面。诗人不从正面写花草树木，而是把春雨春风与杏花、杨柳结合，展示神态，重点放在“欲湿”、“不寒”二词上。“欲湿”，表现了濛濛细雨似有若无的情景，又暗表细雨滋润了云蒸霞蔚般的杏花，花显得更加娇妍红晕。尽管在此之前，“杏花雨”、“杨柳风”这样的诗境已广泛为人们所用，但真正成为熟词，不得不归功于志南这两句诗。试想诗人扶杖东行，一路红杏灼灼，绿柳翩翩， 细雨沾衣，似湿而不见湿，和风迎面吹来，不觉有一丝儿寒意， 这是怎样一番耐心惬意的春日远足啊！不禁让人心向往之。宋人赵与《娱书堂诗话》卷上曾载：“僧志南能诗，朱文公尝跋其卷云：‘南诗清丽有余，格力闲暇，无蔬笋气。如云：“沾衣欲湿杏花雨，吹面不寒杨柳风。予深爱之。’时人评价诗僧之诗除了诗本身的意境，还需要考量这首诗有没有书生气，苏轼谓之酸焰气也。志南这首《绝句》可以说是彻底摆脱了书生气。但其实有无书生气并不重要，只要能写出好诗就行，苏轼诸多作品也不乏有书生气者。除了朱熹特别喜欢这首诗，近代著名诗人、学者朱自清也对这首诗称赞不已，而且引用在其散文《春》中，进入中学课本，被更多人读到。虽然诗僧志南留给我们的作品仅有这一首诗，但当我们看到“杏花微雨，杨柳清风”的大好春光时，心里头会不自觉吟到：沾衣欲湿杏花雨，吹面不寒杨柳风。这一刻，就够了！', '5.jpg', '架构', '2019-07-02 19:33:13', 28, '陈意涵', 00000000001);
INSERT INTO `article` VALUES (86, '你天天发圈，为什么没人买你的东西？', '不用问，一看朋友圈就像一座死城！死气沉沉，自己都不想看，也让别人没有想看下去的欲望。从源头找原因，是不是复制粘贴来的，或者是一些心灵鸡汤，没有原创，没有内涵，没有深度，没有互动？要是转发就能卖出去，大家岂不是都来做微商了！？朋友圈就是你的店铺，你要把你的店铺装修的让大家去喜欢它！如何经营你的朋友圈，今天就跟着我，一步一步去装修你的朋友圈吧！微营销的第一要素就是定位，其实就是做微营销。所以大家必须清楚自己的定位，你是卖什么产品，提供哪些服务。只有明确自己的定位，你才能准确找到你的目标客户，从而提高转化率，有句话说的好“粉丝不在于多，而是在于精准”！在朋友圈每发一条内容可以提醒10个好友查看，这个功能的核心价值在于精准送达，对于微商成交非常有帮助，好友越来越多，根本无暇顾忌。在你发朋友圈的时候，你的目标客户也许并没有在看，等他想看的时候，你的朋友圈早已淹没在汪洋大海，但是如果你使用这个“提醒谁看”的功能，最起码你的这条朋友圈会有10个精准客户看到。为什么要关注你？你能给我提供什么价值？你是我的朋友可以，你长的好看是一种价值，让我看的舒服；你会写好的文案也是一种价值，让我欣赏到好的文章。总之，你要对客户产生价值，你能给到他们什么，我们必须要挖掘自身的优势，分享各种技巧、经验，总之你要不断的输出，她才会持续的关注你。朋友圈每天更新一大堆广告，我不知道这些人是不懂营销，还是不懂得分享还是不懂生活。微商是一个生活化的营销，一个情感营销，如果你全是广告，那又怎么谈生活，怎么谈感情？什么都不了解，也什么都不懂，怎么卖产品，分享顾客反馈，团队风采等。朋友圈中分享生活的内容，可以增强与客户之间的情感，拉近彼此之间的感情，学会分享生活，学会包装自己，学会营销，学会借力。很多做不好的微商，基本都是在复制，扮演一个搬运工的角色，因为你的习惯复制，自己就不会思考。微商看似简单，其实很难。做的好的微商发完这一条朋友圈，他就会思考下一条朋友圈该如何发，怎么写才能引起粉丝的注意，引起客户的关注，才能经营好朋友圈。原创，可以让别人知道你的性格，知道你在用心做事，欣赏你的态度。朋友圈的粉丝没有转化，和你的活动频率有很大的关系，因为互动可以增强彼此之间的情感，通过进一步的互动，大家可以相互了解，为下一步的营销做准备。我们除了主动互动，也可以引导你的朋友互动，这也是一种智慧。微商内刊也为大家每日提供一个互动素材，遇上自己喜欢的素材一定要用起来，分享到朋友圈，活跃气氛。最后一点才是微商成功的关键！微商拼的就是执行力，谁愿意分享，谁愿意去互动，谁愿意去社交，谁愿意去推广自己，有付出自然就有回报。你做不好，想想有多少次就是因为你懒惰，懒惰不思考，复制人家的朋友圈，参加培训完，不整理笔记等。学再多的东西但是你不去实操，不去执行，都是徒劳。', '6.jpg', '程序人生', '2019-07-03 17:19:43', 28, '陈意涵', 00000000001);
INSERT INTO `article` VALUES (88, '如果你的男人不攒劲，二胎不生也罢', '今天下午下班后和几位同事一块去看一位生了二胎刚出月子的女同事。这位女同事今年41岁，她的老公今年47岁，女儿上高一。这个年龄生二胎是一件极需要勇气的事，四十多岁的女人精力不比二十几岁的小媳妇，公婆和父母足以老，很难再有充分的精力帮忙带孩子，一个小生命的诞生可能会让整个家庭处于鸡飞狗跳、人仰马翻的状态当中。还好，当我们敲门时，是女同事来开的门，她面色红润，看上去精神状态不错，她家的房子釆光好，阳光撒满一地，阳面的落地窗前摆着几盆花，长得很旺盛，比较显眼的是晾衣架上各色的尿布，说明了她家刚刚迎接了一个小生命。女同事招呼我们坐下，并忙着给我们倒水，她的老公则从卧室捧出了一个粉嘟嘟的小人儿，我们从沙发起身站起来，围上去看这个生命的奇迹，小人儿在他爸爸的掌心里睡得很安详，两只小手蜷缩在胸前，同事老公的眼里满是怜爱，我猜他在为自己和妻子共同创造的这个小生命自豪。我们问女同事，是谁伺候她坐月子的，她朝丈夫的方向努努嘴，我们明白了，从孩子出生到现在，一直是她们俩口子自己来带的。女同事的情况我们也略知一二，她的公婆都已是七十多岁的老人，她的父母年龄比公婆稍小点，但在帮她的弟弟带孩子，她真的是无人可依靠。还好，她有一个好丈夫，一个很“攒劲”的丈夫，女同事告诉我们，她老公随她休了一个月的产假，天天煲各种不同的汤给她喝，她的奶水很足，小家伙长得很快，出生时七斤左右，出月子时已长到了十斤多。就是小家伙晚上爱闹腾，不好好睡觉，她们夫妻俩只能轮流抱着，换着睡觉。我看到沙发上放着一本翻开的医学类的专业书籍，一看就是同事老公的书，看来他“休产假”在家，在照顾妻子和孩子的同时也没忘了自身的学习。同事和她的老公本来就是模范夫妻，她们的大女儿在夫妻俩的共同培育下，性格阳光、学习特别好，在我们市的重点高中就读，成绩名列前矛。二胎政策放开后，同事开始调理身体、积极备孕，我想正是因为信任丈夫能和自己共同承担孩子诞生后的种种麻烦和困难，同事才能下定生二胎的决心，如果没有一个各方面都“攒劲”的男人，谁会选择在这个年龄受这份苦？我有个朋友，今年也已40岁，去年年底她的二胎出生了，这段日子，她在朋友圈里天天发的都是郁闷的心情，什么带孩子太累、什么付出不被理解了之类的怨言。朋友的二胎生下时，我也去看过。我到她家的时候，还在坐月子的她只有六十多岁的婆婆陪在身旁。问她的丈夫，她说出去和朋友玩了。和朋友聊了一会儿，得知她晚上和婆婆共同带孩子，丈夫则在另外的卧室独睡。我坐了一会儿，她的丈夫回来了，回来后和我打了声招呼，便坐在沙发上捣鼓手机，没过十分钟，他的手机响起，他接了个电话就又出去了。回来的这十几分钟，他都没有想起来看看他刚刚出生的小宝贝。我暗暗观察着这一切，默默为朋友叫屈，为这么个男人生二胎，有的她受了。即使有婆婆陪在身旁，即使时时有人端茶递水，我想朋友的心里也还是窝火和委屈的。婆婆再好，对于过日子的俩口子来说也是外人，得不到另一半的心疼和尊重，这个二胎生得真很没意思。有了丈夫的陪伴和心疼，吃再多的苦也是甜的，丈夫如果不“攒劲”，生下二胎，除了生活越来越忙乱、心情越来越郁闷，对于一个年过四十的中年妇女来说真的是没有一点点好处。所以，姐妹们，如果你的男人不“攒劲”，没有足够的责任心撑起这个家，那么这个二胎不生也罢。', '2.jpg', '人工智能', '2019-07-04 10:48:40', 28, '陈意涵', 00000000000);
INSERT INTO `article` VALUES (92, '为什么说 JSON 不适合做配置文件？', '但是，JSON 实际上是一种非常糟糕的配置语言。别误会我的意思，我其实是喜欢 JSON 的。它是一种相对灵活的文本格式，对于机器和人类来说都很容易阅读，而且是一种非常好的数据交换和存储格式。但作为一种配置语言，它有它的不足。\r\n为什么流行使用 JSON 作为配置语言？\r\n将 JSON 用作配置文件有几个方面的原因，其中最大的原因可能是它很容易实现。很多编程语言的标准库都支持 JSON，开发人员或用户可能已经很熟悉 JSON，所以不需要学习新的配置格式就可以使用那些产品。现在几乎所有的工具都提供 JSON 支持，包括语法突出显示、自动格式化、验证工具等。\r\n这些都是很好的理由，但这种无处不在的格式其实不适合用作配置。\r\nJSON 的问题\r\n缺乏注释\r\n注释对于配置语言而言绝对是一个重要的功能。注释可用于标注不同的配置选项、解释为什么要配置成特定的值，更重要的是，在使用不同的配置进行测试和调试时需要临时注释掉部分配置。当然，如果只是把 JSON 当作是一种数据交换格式，那么就不需要用到注释。\r\n我们可以通过一些方法给 JSON 添加注释。一种常见的方法是在对象中使用特殊的键作为注释，例如“//”或“__comment”。但是，这种语法的可读性不高，并且为了在单个对象中包含多个注释，需要为每个注释使用唯一的键。David Crockford（JSON 的发明者）建议使用预处理器来删除注释。如果你的应用程序需要使用 JSON 作为配置，那么完全没问题，不过这确实带来了一些额外的工作量。\r\n一些 JSON 库允许将注释作为输入。例如，Ruby 的 JSON 模块和启用了 JsonParser.Feature.ALLOW_COMMENTS 功能的 Java Jackson 库可以处理 JavaScript 风格的注释。但是，这不是标准的方式，而且很多编辑器无法正确处理 JSON 文件中的注释，这让编辑它们变得更加困难。\r\n过于严格\r\nJSON 规范非常严格，这也是为什么实现 JSON 解析器会这么简单，但在我看来，它还会影响可读性，并且在较小程度上会影响可写性。\r\n低信噪比\r\n与其他配置语言相比，JSON 显得非常嘈杂。JSON 的很多标点符号对可读性毫无帮助，况且，对象中的键几乎都是标识符，所以键的引号其实是多余的。\r\n此外，JSON 需要使用花括号将整个文档包围起来，所以 JSON 是 JavaScript 的子集，并在流中发送多个对象时用于界定不同的对象。但是，对于配置文件来说，最外面的大括号其实没有任何用处。在配置文件中，键值对之间的逗号也是没有必要的。通常情况下，每行只有一个键值对，所以使用换行作为分隔符更有意义。\r\n说到逗号，JSON 居然不允许在结尾出现逗号。如果你需要在每个键值对之后使用逗号，那么至少应该接受结尾的逗号，因为有了结尾的逗号，在添加新条目时会更容易，而且在进行 commit diff 时也更清晰。\r\n长字符串\r\nJSON 作为配置格式的另一个问题是，它不支持多行字符串。如果你想在字符串中换行，必须使用 “\\n” 进行转义，更糟糕的是，如果你想要一个字符串在文件中另起一行显示，那就彻底没办法了。如果你的配置项里没有很长的字符串，那就不是问题。但是，如果你的配置项里包括了长字符串，例如项目描述或 GPG 密钥，你可能不希望只是使用 “\\n” 来转义而不是使用真实的换行符。\r\n数字\r\n此外，在某些情况下，JSON 对数字的定义可能会有问题。JSON 规范中将数字定义成使用十进制表示的任意精度有限浮点数。对于大多数应用程序来说，这没有问题。但是，如果你需要使用十六进制表示法或表示无穷大或 NaN 等值时，那么 TOML 或 YAML 将能够更好地处理它们。dede3wfr34', '6.jpg', 'java', '2020-05-28 15:11:11', 26, 'swift', 00000000001);

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT COMMENT '关注表id',
  `userid` int(11) NOT NULL COMMENT '主动关注者的id',
  `beuserid` int(11) NOT NULL COMMENT '被动关注者的id',
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `beuserid`(`beuserid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关注表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of attention
-- ----------------------------
INSERT INTO `attention` VALUES (126, 26, 28);

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏表id',
  `userid` int(11) NOT NULL COMMENT '收藏者id',
  `fid` int(11) NOT NULL COMMENT '被收藏帖子id',
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (85, 26, 45);
INSERT INTO `collect` VALUES (87, 26, 40);
INSERT INTO `collect` VALUES (88, 26, 83);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `pcontent` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `userid` int(11) NOT NULL COMMENT '评论者',
  `fid` int(11) NOT NULL COMMENT '被评论帖子id',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `fid`(`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (32, '非常感谢！写的很好呢，收藏了！', 26, 40, '2018-04-17 21:37:31');
INSERT INTO `comment` VALUES (54, '我也是程序猿，每天整得脑壳疼，出了这碗饭感觉其他的都莫法???', 26, 40, '2019-07-06 09:17:41');
INSERT INTO `comment` VALUES (160, '个地方郭德纲的', 28, 40, '2019-04-21 14:30:52');
INSERT INTO `comment` VALUES (164, '来了类似', 28, 45, '2019-04-24 00:23:23');
INSERT INTO `comment` VALUES (172, '啦啦啦', 28, 45, '2019-04-30 00:22:26');
INSERT INTO `comment` VALUES (174, '熱熱', 28, 84, '2019-07-06 09:18:49');
INSERT INTO `comment` VALUES (175, '撒旦画嘎哈说过的话管哈', 26, 83, '2019-07-06 09:18:33');
INSERT INTO `comment` VALUES (176, '写的真好', 26, 83, '2019-07-06 09:18:26');
INSERT INTO `comment` VALUES (177, '很美的句子，很喜欢', 28, 83, '2019-07-07 01:57:33');
INSERT INTO `comment` VALUES (178, '学到了', 26, 45, '2019-07-07 02:46:42');
INSERT INTO `comment` VALUES (179, '要坚持哦', 26, 75, '2019-07-07 02:48:40');
INSERT INTO `comment` VALUES (180, '厉害', 26, 45, '2019-07-07 08:33:58');
INSERT INTO `comment` VALUES (181, '评论测试2', 26, 40, '2019-07-08 14:12:23');

-- ----------------------------
-- Table structure for plate
-- ----------------------------
DROP TABLE IF EXISTS `plate`;
CREATE TABLE `plate`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `bname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '板块名字',
  `btime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '板块创建时间',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '板块表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plate
-- ----------------------------
INSERT INTO `plate` VALUES (1, 'java', '2018-03-30 18:08:51');
INSERT INTO `plate` VALUES (2, 'C++', '2018-03-30 18:55:29');
INSERT INTO `plate` VALUES (3, 'Python', '2018-04-17 20:00:42');
INSERT INTO `plate` VALUES (19, '人工智能', '2018-04-17 20:01:55');
INSERT INTO `plate` VALUES (20, '移动开发', '2018-04-17 20:03:56');
INSERT INTO `plate` VALUES (21, '程序人生', '2018-04-17 20:04:25');
INSERT INTO `plate` VALUES (22, '前端', '2018-04-17 20:05:00');
INSERT INTO `plate` VALUES (23, '运维', '2018-04-17 20:05:05');
INSERT INTO `plate` VALUES (24, '架构', '2018-04-17 20:05:10');
INSERT INTO `plate` VALUES (26, 'github', '2018-06-04 10:09:34');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `age` int(11) NULL DEFAULT NULL COMMENT '年龄',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户email',
  `family` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户住址',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '个人简介',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (26, 'swift', 23, '男', '123', 'maliang@qq.com', '四川省广元市青川县', '@@myself-changed', '2019-07-08 14:08:19');
INSERT INTO `user` VALUES (28, '陈意涵', 25, '女', '123', 'chenyihan@163.com', '中国台湾', '元气女神', '2019-07-06 15:27:25');

-- ----------------------------
-- Table structure for via
-- ----------------------------
DROP TABLE IF EXISTS `via`;
CREATE TABLE `via`  (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户头像',
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '头像表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of via
-- ----------------------------
INSERT INTO `via` VALUES (26, 'gtl.jpg');
INSERT INTO `via` VALUES (28, 'cyh.jpg');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit`  (
  `VisitID` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问记录编号',
  `VisitURL` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问页地址',
  `VisitIP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者ip',
  `VisitCountry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者所在国家',
  `VisitProvince` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者省份',
  `VisitCity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者城市',
  `VisitHostName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主机名',
  `VisitOS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问者操作系统',
  `VisitTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  PRIMARY KEY (`VisitID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1498 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES (139, '', '104.194.83.112', '加拿大', '', '', 'instance-sznooi4f', 'Linux', '2018-11-08 14:02:31');
INSERT INTO `visit` VALUES (144, '', '104.194.83.112', '加拿大', '', '', 'instance-sznooi4f', 'Linux', '2018-11-11 11:01:32');
INSERT INTO `visit` VALUES (145, '', '104.194.83.112', '加拿大', '', '', 'instance-sznooi4f', 'Linux', '2018-11-12 09:42:36');
INSERT INTO `visit` VALUES (146, '', '104.194.83.112', '加拿大', '', '', 'instance-sznooi4f', 'Linux', '2018-11-12 14:24:57');
INSERT INTO `visit` VALUES (176, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2018-11-18 02:15:06');
INSERT INTO `visit` VALUES (197, '', '66.249.80.52', '美国', '', '', 'instance-sznooi4f', 'Linux', '2018-11-26 17:41:30');
INSERT INTO `visit` VALUES (273, '', '143.248.90.63', '韩国', '', '', 'instance-sznooi4f', 'Linux', '2018-12-21 13:45:56');
INSERT INTO `visit` VALUES (302, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2018-12-25 18:45:51');
INSERT INTO `visit` VALUES (334, '', '176.193.84.65', '俄罗斯', '', '', 'instance-sznooi4f', 'Linux', '2018-12-29 03:58:08');
INSERT INTO `visit` VALUES (349, '', '37.145.186.209', '俄罗斯', '', '', 'instance-sznooi4f', 'Linux', '2019-01-02 05:57:27');
INSERT INTO `visit` VALUES (444, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-01-17 16:45:18');
INSERT INTO `visit` VALUES (467, '', '128.69.160.92', '俄罗斯', '', '', 'instance-sznooi4f', 'Linux', '2019-01-18 21:29:40');
INSERT INTO `visit` VALUES (526, '', '46.242.75.66', '俄罗斯', '', '', 'instance-sznooi4f', 'Linux', '2019-02-02 20:06:44');
INSERT INTO `visit` VALUES (528, '', '128.69.166.41', '俄罗斯', '', '', 'instance-sznooi4f', 'Linux', '2019-02-03 18:30:35');
INSERT INTO `visit` VALUES (529, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-04 07:23:28');
INSERT INTO `visit` VALUES (531, '', '128.69.166.41', '俄罗斯', '', '', 'instance-sznooi4f', 'Linux', '2019-02-06 19:27:13');
INSERT INTO `visit` VALUES (534, '', '194.66.246.28', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-08 02:12:53');
INSERT INTO `visit` VALUES (535, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-08 07:12:09');
INSERT INTO `visit` VALUES (536, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-08 09:18:53');
INSERT INTO `visit` VALUES (540, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-10 00:54:31');
INSERT INTO `visit` VALUES (542, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-10 05:28:59');
INSERT INTO `visit` VALUES (543, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-10 06:19:14');
INSERT INTO `visit` VALUES (544, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-10 07:40:42');
INSERT INTO `visit` VALUES (545, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-10 09:46:00');
INSERT INTO `visit` VALUES (546, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-10 10:48:51');
INSERT INTO `visit` VALUES (548, '', '194.66.246.1', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-10 23:12:59');
INSERT INTO `visit` VALUES (549, '', '194.66.243.28', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-11 02:20:54');
INSERT INTO `visit` VALUES (550, '', '194.66.243.30', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-11 19:05:15');
INSERT INTO `visit` VALUES (551, '', '194.66.243.24', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-11 19:36:26');
INSERT INTO `visit` VALUES (552, '', '194.66.243.31', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-11 22:22:42');
INSERT INTO `visit` VALUES (554, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-12 07:57:25');
INSERT INTO `visit` VALUES (562, '', '194.66.243.29', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-12 18:40:09');
INSERT INTO `visit` VALUES (563, '', '194.66.243.21', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-12 20:17:44');
INSERT INTO `visit` VALUES (569, '', '37.203.186.178', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-14 08:03:35');
INSERT INTO `visit` VALUES (578, '', '171.221.42.20', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-02-14 21:54:39');
INSERT INTO `visit` VALUES (579, '', '112.96.198.246', '中国', '广东', '广州', 'instance-sznooi4f', 'Linux', '2019-02-15 00:02:19');
INSERT INTO `visit` VALUES (580, '', '42.120.161.83', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-15 00:55:32');
INSERT INTO `visit` VALUES (581, '', '182.138.233.120', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-02-15 10:08:07');
INSERT INTO `visit` VALUES (582, '', '115.156.157.56', '中国', '湖北', '武汉', 'instance-sznooi4f', 'Linux', '2019-02-15 15:11:39');
INSERT INTO `visit` VALUES (583, '', '171.212.177.32', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-02-15 17:33:46');
INSERT INTO `visit` VALUES (584, '', '183.193.160.238', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-15 20:59:23');
INSERT INTO `visit` VALUES (585, '', '182.39.152.229', '中国', '山东', '枣庄', 'instance-sznooi4f', 'Linux', '2019-02-15 22:05:09');
INSERT INTO `visit` VALUES (586, '', '183.193.160.238', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-15 22:14:00');
INSERT INTO `visit` VALUES (587, '', '112.240.25.244', '中国', '山东', '淄博', 'instance-sznooi4f', 'Linux', '2019-02-16 09:48:06');
INSERT INTO `visit` VALUES (588, '', '220.115.30.182', '中国', '天津', '天津', 'instance-sznooi4f', 'Linux', '2019-02-16 10:24:30');
INSERT INTO `visit` VALUES (589, '', '183.193.160.238', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-16 12:49:18');
INSERT INTO `visit` VALUES (590, '', '120.204.17.73', '中国', '上海', '普陀', 'instance-sznooi4f', 'Linux', '2019-02-16 12:50:18');
INSERT INTO `visit` VALUES (591, '', '113.111.6.247', '中国', '广东', '广州', 'instance-sznooi4f', 'Linux', '2019-02-16 14:16:45');
INSERT INTO `visit` VALUES (592, '', '183.193.160.238', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-16 14:25:26');
INSERT INTO `visit` VALUES (593, '', '183.193.160.238', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-16 14:36:26');
INSERT INTO `visit` VALUES (594, '', '61.151.207.205', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-16 14:37:26');
INSERT INTO `visit` VALUES (595, '', '183.193.160.238', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-16 15:58:39');
INSERT INTO `visit` VALUES (596, '', '219.132.117.89', '中国', '广东', '揭阳', 'instance-sznooi4f', 'Linux', '2019-02-17 22:16:31');
INSERT INTO `visit` VALUES (597, '', '202.102.180.149', '中国', '山东', '淄博', 'instance-sznooi4f', 'Linux', '2019-02-18 10:06:20');
INSERT INTO `visit` VALUES (598, '', '223.167.135.131', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-18 14:25:34');
INSERT INTO `visit` VALUES (599, '', '223.166.151.191', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-18 14:26:34');
INSERT INTO `visit` VALUES (600, '', '223.167.135.131', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-18 17:28:16');
INSERT INTO `visit` VALUES (601, '', '42.156.136.38', '中国', '北京', '北京', 'instance-sznooi4f', 'Linux', '2019-02-18 18:31:48');
INSERT INTO `visit` VALUES (602, '', '118.112.108.213', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-02-19 11:05:27');
INSERT INTO `visit` VALUES (603, '', '58.59.122.4', '中国', '山东', '滨州', 'instance-sznooi4f', 'Linux', '2019-02-19 11:36:52');
INSERT INTO `visit` VALUES (604, '', '182.48.101.194', '中国', '北京', '海淀', 'instance-sznooi4f', 'Linux', '2019-02-19 13:16:27');
INSERT INTO `visit` VALUES (605, '', '117.107.158.126', '中国', '北京', '海淀', 'instance-sznooi4f', 'Linux', '2019-02-19 14:58:49');
INSERT INTO `visit` VALUES (606, '', '115.213.73.18', '中国', '浙江', '宁波', 'instance-sznooi4f', 'Linux', '2019-02-19 15:20:28');
INSERT INTO `visit` VALUES (607, '', '183.193.141.235', '中国', '上海', '上海', 'instance-sznooi4f', 'Linux', '2019-02-19 17:45:39');
INSERT INTO `visit` VALUES (608, '', '183.14.17.167', '中国', '广东', '深圳', 'instance-sznooi4f', 'Linux', '2019-02-19 17:55:14');
INSERT INTO `visit` VALUES (609, '', '118.112.108.213', '中国', '四川', '成都', 'instance-sznooi4f', 'Linux', '2019-02-19 18:01:40');
INSERT INTO `visit` VALUES (610, '', '27.155.238.30', '中国', '福建', '福州', 'instance-sznooi4f', 'Linux', '2019-02-19 21:35:11');
INSERT INTO `visit` VALUES (611, '', '118.29.236.29', '中国', '天津', '天津', 'instance-sznooi4f', 'Linux', '2019-02-20 09:10:50');
INSERT INTO `visit` VALUES (612, '', '27.155.238.30', '中国', '福建', '福州', 'instance-sznooi4f', 'Linux', '2019-02-20 09:43:08');
INSERT INTO `visit` VALUES (623, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-21 16:31:29');
INSERT INTO `visit` VALUES (627, '', '132.145.36.9', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-21 23:36:05');
INSERT INTO `visit` VALUES (632, '', '212.112.124.98', '吉尔吉斯', '', '', 'instance-sznooi4f', 'Linux', '2019-02-22 11:36:11');
INSERT INTO `visit` VALUES (634, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-02-23 10:34:28');
INSERT INTO `visit` VALUES (655, '', '118.240.242.50', '日本', '', '', 'instance-sznooi4f', 'Linux', '2019-02-24 13:26:32');
INSERT INTO `visit` VALUES (690, '', '116.66.184.188', '新加坡', '', '', 'instance-sznooi4f', 'Linux', '2019-03-01 11:52:20');
INSERT INTO `visit` VALUES (691, '', '116.66.184.173', '新加坡', '', '', 'instance-sznooi4f', 'Linux', '2019-03-01 13:37:15');
INSERT INTO `visit` VALUES (717, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-03-05 16:55:15');
INSERT INTO `visit` VALUES (726, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-03-06 19:08:55');
INSERT INTO `visit` VALUES (777, '', '8.208.13.33', '英国', '英格兰', '伦敦', 'instance-sznooi4f', 'Linux', '2019-03-14 14:55:39');
INSERT INTO `visit` VALUES (781, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-03-15 15:03:15');
INSERT INTO `visit` VALUES (811, '', '149.129.127.39', '马来西亚', '', '', 'instance-sznooi4f', 'Linux', '2019-03-19 18:42:42');
INSERT INTO `visit` VALUES (827, '', '5.3.152.128', '俄罗斯', '', '', 'instance-sznooi4f', 'Linux', '2019-03-21 08:57:11');
INSERT INTO `visit` VALUES (836, '', '66.249.82.94', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-03-23 08:11:06');
INSERT INTO `visit` VALUES (1022, '', '40.77.167.173', '美国', '弗吉尼亚', '', 'instance-sznooi4f', 'Linux', '2019-04-10 19:46:30');
INSERT INTO `visit` VALUES (1057, '', '157.55.39.173', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-12 05:58:58');
INSERT INTO `visit` VALUES (1060, '', '46.188.31.24', '俄罗斯', '莫斯科', '', 'instance-sznooi4f', 'Linux', '2019-04-12 10:45:55');
INSERT INTO `visit` VALUES (1151, '', '40.77.188.214', '美国', '伊利诺斯', '芝加哥', 'instance-sznooi4f', 'Linux', '2019-04-17 18:50:59');
INSERT INTO `visit` VALUES (1157, '', '157.55.39.82', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-18 06:36:00');
INSERT INTO `visit` VALUES (1162, '', '157.55.39.153', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-18 15:17:41');
INSERT INTO `visit` VALUES (1217, '', '157.55.39.80', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-21 06:43:47');
INSERT INTO `visit` VALUES (1246, '', '207.46.13.158', '美国', '华盛顿', '', 'instance-sznooi4f', 'Linux', '2019-04-23 20:12:22');
INSERT INTO `visit` VALUES (1247, '', '199.241.123.13', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-23 21:59:50');
INSERT INTO `visit` VALUES (1248, '', '104.243.17.233', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-23 22:07:18');
INSERT INTO `visit` VALUES (1338, '', '40.77.167.205', '美国', '弗吉尼亚', '', 'instance-sznooi4f', 'Linux', '2019-04-27 02:38:32');
INSERT INTO `visit` VALUES (1373, '', '144.34.146.210', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-29 00:21:31');
INSERT INTO `visit` VALUES (1374, '', '157.55.39.158', '美国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-29 02:09:19');
INSERT INTO `visit` VALUES (1387, '', '194.66.243.21', '英国', '', '', 'instance-sznooi4f', 'Linux', '2019-04-29 22:20:52');
INSERT INTO `visit` VALUES (1402, '', '40.77.167.115', '美国', '弗吉尼亚', '', 'instance-sznooi4f', 'Linux', '2019-05-09 01:44:26');
INSERT INTO `visit` VALUES (1462, '', '13.66.139.0', '美国', '华盛顿', '昆西', 'instance-sznooi4f', 'Linux', '2019-05-12 05:09:55');
INSERT INTO `visit` VALUES (1490, '', '144.34.146.210', '美国', '加利福尼亚', '洛杉矶', 'host.localdomain', 'Linux', '2019-05-13 19:54:19');
INSERT INTO `visit` VALUES (1495, '', '144.34.146.210', '美国', '加利福尼亚', '洛杉矶', 'host.localdomain', 'Linux', '2019-05-13 20:05:08');
INSERT INTO `visit` VALUES (1497, '', '144.34.146.210', '美国', '加利福尼亚', '洛杉矶', 'host.localdomain', 'Linux', '2019-05-13 20:09:32');

SET FOREIGN_KEY_CHECKS = 1;
