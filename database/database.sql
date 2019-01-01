-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 18 Şub 2017, 23:49:49
-- Sunucu sürümü: 10.1.13-MariaDB
-- PHP Sürümü: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_blobs`
--

CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) UNSIGNED NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` int(10) UNSIGNED DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_cache`
--

CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_categories`
--

CREATE TABLE `qa_categories` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `position` smallint(5) UNSIGNED NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_categorymetas`
--

CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_contentwords`
--

CREATE TABLE `qa_contentwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `count` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_cookies`
--

CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) UNSIGNED NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_iplimits`
--

CREATE TABLE `qa_iplimits` (
  `ip` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_messages`
--

CREATE TABLE `qa_messages` (
  `messageid` int(10) UNSIGNED NOT NULL,
  `type` enum('PUBLIC','PRIVATE') NOT NULL DEFAULT 'PRIVATE',
  `fromuserid` int(10) UNSIGNED NOT NULL,
  `touserid` int(10) UNSIGNED NOT NULL,
  `fromhidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `tohidden` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_options`
--

CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `qa_options`
--

INSERT INTO `qa_options` (`title`, `content`) VALUES
('avatar_allow_gravatar', '1'),
('avatar_allow_upload', '1'),
('avatar_default_show', ''),
('avatar_message_list_size', '80'),
('block_ips_write', ''),
('cache_flaggedcount', ''),
('cache_queuedcount', ''),
('cache_tagcount', ''),
('cache_uapprovecount', '0'),
('cache_userpointscount', '1'),
('comment_on_as', '1'),
('comment_on_qs', '0'),
('confirm_user_emails', '1'),
('custom_footer', ''),
('custom_header', ''),
('custom_in_head', ''),
('custom_welcome', ''),
('db_version', '59'),
('feedback_email', 'admin@admin.com'),
('feedback_enabled', '1'),
('flagging_of_posts', '1'),
('form_security_salt', '23hzqovbwjevys8g0bgb9he5l749n349'),
('from_email', 'no-reply@example.com'),
('image_max_file_count', '12'),
('image_max_upload', '2'),
('logo_height', ''),
('logo_show', ''),
('logo_url', ''),
('logo_width', ''),
('moderate_users', ''),
('nav_activity', ''),
('nav_ask', '1'),
('nav_categories', ''),
('nav_home', ''),
('nav_hot', ''),
('nav_qa_not_home', '0'),
('nav_questions', '1'),
('nav_tags', '1'),
('nav_unanswered', '1'),
('nav_users', '1'),
('neat_urls', '5'),
('pages_prev_next', '3'),
('page_size_q_as', '10'),
('permit_hide_show', '70'),
('permit_moderate', '100'),
('permit_post_a', '150'),
('permit_post_c', '150'),
('permit_post_q', '150'),
('permit_view_voters_flaggers', '20'),
('points_a_selected', '30'),
('points_a_voted_max_gain', '20'),
('points_a_voted_max_loss', '5'),
('points_base', '100'),
('points_multiple', '10'),
('points_per_a_voted', ''),
('points_per_a_voted_down', '2'),
('points_per_a_voted_up', '2'),
('points_per_q_voted', ''),
('points_per_q_voted_down', '1'),
('points_per_q_voted_up', '1'),
('points_post_a', '4'),
('points_post_q', '2'),
('points_q_voted_max_gain', '10'),
('points_q_voted_max_loss', '3'),
('points_select_a', '3'),
('points_to_titles', ''),
('points_vote_down_a', '1'),
('points_vote_down_q', '1'),
('points_vote_on_a', ''),
('points_vote_on_q', ''),
('points_vote_up_a', '1'),
('points_vote_up_q', '1'),
('register_notify_admin', ''),
('show_custom_footer', ''),
('show_custom_header', ''),
('show_custom_home', ''),
('show_custom_in_head', ''),
('show_custom_sidebar', '1'),
('show_custom_sidepanel', ''),
('show_custom_welcome', '1'),
('show_c_reply_buttons', '1'),
('show_fewer_cs_count', '5'),
('show_fewer_cs_from', '10'),
('show_home_description', ''),
('show_notice_welcome', ''),
('site_language', ''),
('site_maintenance', '0'),
('site_text_direction', ''),
('site_theme', 'default'),
('site_theme_mobile', 'default'),
('site_title', 'King Media'),
('site_url', '/'),
('smtp_active', ''),
('sort_answers_by', 'created'),
('tags_or_categories', 'tc'),
('video_ffmpeg', '/usr/bin/ffmpeg'),
('video_max_upload', '10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_pages`
--

CREATE TABLE `qa_pages` (
  `pageid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_postmetas`
--

CREATE TABLE `qa_postmetas` (
  `postid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_posts`
--

CREATE TABLE `qa_posts` (
  `postid` int(10) UNSIGNED NOT NULL,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `postformat` enum('V','I','N') DEFAULT NULL,
  `parentid` int(10) UNSIGNED DEFAULT NULL,
  `categoryid` int(10) UNSIGNED DEFAULT NULL,
  `catidpath1` int(10) UNSIGNED DEFAULT NULL,
  `catidpath2` int(10) UNSIGNED DEFAULT NULL,
  `catidpath3` int(10) UNSIGNED DEFAULT NULL,
  `acount` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `selchildid` int(10) UNSIGNED DEFAULT NULL,
  `closedbyid` int(10) UNSIGNED DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `cookieid` bigint(20) UNSIGNED DEFAULT NULL,
  `createip` int(10) UNSIGNED DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `lastip` int(10) UNSIGNED DEFAULT NULL,
  `upvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `downvotes` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` int(10) UNSIGNED DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_posttags`
--

CREATE TABLE `qa_posttags` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL,
  `postcreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_sharedevents`
--

CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_tagmetas`
--

CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_tagwords`
--

CREATE TABLE `qa_tagwords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_titlewords`
--

CREATE TABLE `qa_titlewords` (
  `postid` int(10) UNSIGNED NOT NULL,
  `wordid` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userevents`
--

CREATE TABLE `qa_userevents` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `questionid` int(10) UNSIGNED NOT NULL,
  `lastpostid` int(10) UNSIGNED NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(10) UNSIGNED DEFAULT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userfavorites`
--

CREATE TABLE `qa_userfavorites` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `nouserevents` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userfields`
--

CREATE TABLE `qa_userfields` (
  `fieldid` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(40) DEFAULT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `flags` tinyint(3) UNSIGNED NOT NULL,
  `permit` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `qa_userfields`
--

INSERT INTO `qa_userfields` (`fieldid`, `title`, `content`, `position`, `flags`, `permit`) VALUES
(1, 'name', NULL, 1, 0, NULL),
(2, 'location', NULL, 2, 0, NULL),
(3, 'website', NULL, 3, 2, NULL),
(4, 'about', NULL, 4, 1, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userlevels`
--

CREATE TABLE `qa_userlevels` (
  `userid` int(10) UNSIGNED NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userlimits`
--

CREATE TABLE `qa_userlimits` (
  `userid` int(10) UNSIGNED NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) UNSIGNED NOT NULL,
  `count` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userlogins`
--

CREATE TABLE `qa_userlogins` (
  `userid` int(10) UNSIGNED NOT NULL,
  `source` varchar(16) CHARACTER SET ascii NOT NULL,
  `identifier` varbinary(1024) NOT NULL,
  `identifiermd5` binary(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_usermetas`
--

CREATE TABLE `qa_usermetas` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_usernotices`
--

CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userpoints`
--

CREATE TABLE `qa_userpoints` (
  `userid` int(10) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `qa_userpoints`
--

INSERT INTO `qa_userpoints` (`userid`, `points`, `qposts`, `aposts`, `cposts`, `aselects`, `aselecteds`, `qupvotes`, `qdownvotes`, `aupvotes`, `adownvotes`, `qvoteds`, `avoteds`, `upvoteds`, `downvoteds`, `bonus`) VALUES
(1, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_userprofile`
--

CREATE TABLE `qa_userprofile` (
  `userid` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_users`
--

CREATE TABLE `qa_users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) UNSIGNED NOT NULL,
  `email` varchar(80) NOT NULL,
  `handle` varchar(20) NOT NULL,
  `avatarblobid` bigint(20) UNSIGNED DEFAULT NULL,
  `avatarwidth` smallint(5) UNSIGNED DEFAULT NULL,
  `avatarheight` smallint(5) UNSIGNED DEFAULT NULL,
  `passsalt` binary(16) DEFAULT NULL,
  `passcheck` binary(20) DEFAULT NULL,
  `level` tinyint(3) UNSIGNED NOT NULL,
  `loggedin` datetime NOT NULL,
  `loginip` int(10) UNSIGNED NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) UNSIGNED DEFAULT NULL,
  `emailcode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessioncode` char(8) CHARACTER SET ascii NOT NULL DEFAULT '',
  `sessionsource` varchar(16) CHARACTER SET ascii DEFAULT '',
  `flags` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `wallposts` mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `qa_users`
--

INSERT INTO `qa_users` (`userid`, `created`, `createip`, `email`, `handle`, `avatarblobid`, `avatarwidth`, `avatarheight`, `passsalt`, `passcheck`, `level`, `loggedin`, `loginip`, `written`, `writeip`, `emailcode`, `sessioncode`, `sessionsource`, `flags`, `wallposts`) VALUES
(1, '2017-02-19 00:46:06', 0, 'admin@admin.com', 'admin', NULL, NULL, NULL, 0x386b333562376377676f6e6c32687177, 0xb554babb34455030ee6c3194e3bf593592d1a23f, 120, '2017-02-19 00:46:15', 0, NULL, NULL, '', 'ymssu4ma', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_uservotes`
--

CREATE TABLE `qa_uservotes` (
  `postid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_widgets`
--

CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) UNSIGNED NOT NULL,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `qa_words`
--

CREATE TABLE `qa_words` (
  `wordid` int(10) UNSIGNED NOT NULL,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `contentcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagwordcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tagcount` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `qa_blobs`
--
ALTER TABLE `qa_blobs`
  ADD PRIMARY KEY (`blobid`);

--
-- Tablo için indeksler `qa_cache`
--
ALTER TABLE `qa_cache`
  ADD PRIMARY KEY (`type`,`cacheid`),
  ADD KEY `lastread` (`lastread`);

--
-- Tablo için indeksler `qa_categories`
--
ALTER TABLE `qa_categories`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `parentid` (`parentid`,`tags`),
  ADD UNIQUE KEY `parentid_2` (`parentid`,`position`),
  ADD KEY `backpath` (`backpath`(200));

--
-- Tablo için indeksler `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD PRIMARY KEY (`categoryid`,`title`);

--
-- Tablo için indeksler `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Tablo için indeksler `qa_cookies`
--
ALTER TABLE `qa_cookies`
  ADD PRIMARY KEY (`cookieid`);

--
-- Tablo için indeksler `qa_iplimits`
--
ALTER TABLE `qa_iplimits`
  ADD UNIQUE KEY `ip` (`ip`,`action`);

--
-- Tablo için indeksler `qa_messages`
--
ALTER TABLE `qa_messages`
  ADD PRIMARY KEY (`messageid`),
  ADD KEY `type` (`type`,`fromuserid`,`touserid`,`created`),
  ADD KEY `touserid` (`touserid`,`type`,`created`),
  ADD KEY `fromhidden` (`fromhidden`),
  ADD KEY `tohidden` (`tohidden`);

--
-- Tablo için indeksler `qa_options`
--
ALTER TABLE `qa_options`
  ADD PRIMARY KEY (`title`);

--
-- Tablo için indeksler `qa_pages`
--
ALTER TABLE `qa_pages`
  ADD PRIMARY KEY (`pageid`),
  ADD UNIQUE KEY `position` (`position`),
  ADD KEY `tags` (`tags`);

--
-- Tablo için indeksler `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD PRIMARY KEY (`postid`,`title`);

--
-- Tablo için indeksler `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `type` (`type`,`created`),
  ADD KEY `type_2` (`type`,`acount`,`created`),
  ADD KEY `type_4` (`type`,`netvotes`,`created`),
  ADD KEY `type_5` (`type`,`views`,`created`),
  ADD KEY `type_6` (`type`,`hotness`),
  ADD KEY `type_7` (`type`,`amaxvote`,`created`),
  ADD KEY `parentid` (`parentid`,`type`),
  ADD KEY `userid` (`userid`,`type`,`created`),
  ADD KEY `selchildid` (`selchildid`,`type`,`created`),
  ADD KEY `closedbyid` (`closedbyid`),
  ADD KEY `catidpath1` (`catidpath1`,`type`,`created`),
  ADD KEY `catidpath2` (`catidpath2`,`type`,`created`),
  ADD KEY `catidpath3` (`catidpath3`,`type`,`created`),
  ADD KEY `categoryid` (`categoryid`,`type`,`created`),
  ADD KEY `createip` (`createip`,`created`),
  ADD KEY `updated` (`updated`,`type`),
  ADD KEY `flagcount` (`flagcount`,`created`,`type`),
  ADD KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  ADD KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  ADD KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  ADD KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  ADD KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  ADD KEY `lastip` (`lastip`,`updated`,`type`);

--
-- Tablo için indeksler `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`,`postcreated`);

--
-- Tablo için indeksler `qa_sharedevents`
--
ALTER TABLE `qa_sharedevents`
  ADD KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  ADD KEY `questionid` (`questionid`,`entitytype`,`entityid`);

--
-- Tablo için indeksler `qa_tagmetas`
--
ALTER TABLE `qa_tagmetas`
  ADD PRIMARY KEY (`tag`,`title`);

--
-- Tablo için indeksler `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Tablo için indeksler `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD KEY `postid` (`postid`),
  ADD KEY `wordid` (`wordid`);

--
-- Tablo için indeksler `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD KEY `userid` (`userid`,`updated`),
  ADD KEY `questionid` (`questionid`,`userid`);

--
-- Tablo için indeksler `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  ADD KEY `userid` (`userid`,`nouserevents`),
  ADD KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`);

--
-- Tablo için indeksler `qa_userfields`
--
ALTER TABLE `qa_userfields`
  ADD PRIMARY KEY (`fieldid`);

--
-- Tablo için indeksler `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD UNIQUE KEY `userid` (`userid`,`entitytype`,`entityid`),
  ADD KEY `entitytype` (`entitytype`,`entityid`);

--
-- Tablo için indeksler `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD UNIQUE KEY `userid` (`userid`,`action`);

--
-- Tablo için indeksler `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD KEY `source` (`source`,`identifiermd5`),
  ADD KEY `userid` (`userid`);

--
-- Tablo için indeksler `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD PRIMARY KEY (`userid`,`title`);

--
-- Tablo için indeksler `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD PRIMARY KEY (`noticeid`),
  ADD KEY `userid` (`userid`,`created`);

--
-- Tablo için indeksler `qa_userpoints`
--
ALTER TABLE `qa_userpoints`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `points` (`points`);

--
-- Tablo için indeksler `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD UNIQUE KEY `userid` (`userid`,`title`);

--
-- Tablo için indeksler `qa_users`
--
ALTER TABLE `qa_users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `email` (`email`),
  ADD KEY `handle` (`handle`),
  ADD KEY `level` (`level`),
  ADD KEY `created` (`created`,`level`,`flags`);

--
-- Tablo için indeksler `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD UNIQUE KEY `userid` (`userid`,`postid`),
  ADD KEY `postid` (`postid`);

--
-- Tablo için indeksler `qa_widgets`
--
ALTER TABLE `qa_widgets`
  ADD PRIMARY KEY (`widgetid`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Tablo için indeksler `qa_words`
--
ALTER TABLE `qa_words`
  ADD PRIMARY KEY (`wordid`),
  ADD KEY `word` (`word`),
  ADD KEY `tagcount` (`tagcount`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `qa_categories`
--
ALTER TABLE `qa_categories`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `qa_messages`
--
ALTER TABLE `qa_messages`
  MODIFY `messageid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `qa_pages`
--
ALTER TABLE `qa_pages`
  MODIFY `pageid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `qa_posts`
--
ALTER TABLE `qa_posts`
  MODIFY `postid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `qa_userfields`
--
ALTER TABLE `qa_userfields`
  MODIFY `fieldid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  MODIFY `noticeid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `qa_users`
--
ALTER TABLE `qa_users`
  MODIFY `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `qa_widgets`
--
ALTER TABLE `qa_widgets`
  MODIFY `widgetid` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Tablo için AUTO_INCREMENT değeri `qa_words`
--
ALTER TABLE `qa_words`
  MODIFY `wordid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `qa_categorymetas`
--
ALTER TABLE `qa_categorymetas`
  ADD CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_contentwords`
--
ALTER TABLE `qa_contentwords`
  ADD CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Tablo kısıtlamaları `qa_postmetas`
--
ALTER TABLE `qa_postmetas`
  ADD CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_posts`
--
ALTER TABLE `qa_posts`
  ADD CONSTRAINT `qa_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  ADD CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  ADD CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`);

--
-- Tablo kısıtlamaları `qa_posttags`
--
ALTER TABLE `qa_posttags`
  ADD CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Tablo kısıtlamaları `qa_tagwords`
--
ALTER TABLE `qa_tagwords`
  ADD CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Tablo kısıtlamaları `qa_titlewords`
--
ALTER TABLE `qa_titlewords`
  ADD CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`);

--
-- Tablo kısıtlamaları `qa_userevents`
--
ALTER TABLE `qa_userevents`
  ADD CONSTRAINT `qa_userevents_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_userfavorites`
--
ALTER TABLE `qa_userfavorites`
  ADD CONSTRAINT `qa_userfavorites_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_userlevels`
--
ALTER TABLE `qa_userlevels`
  ADD CONSTRAINT `qa_userlevels_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_userlimits`
--
ALTER TABLE `qa_userlimits`
  ADD CONSTRAINT `qa_userlimits_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_userlogins`
--
ALTER TABLE `qa_userlogins`
  ADD CONSTRAINT `qa_userlogins_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_usermetas`
--
ALTER TABLE `qa_usermetas`
  ADD CONSTRAINT `qa_usermetas_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_usernotices`
--
ALTER TABLE `qa_usernotices`
  ADD CONSTRAINT `qa_usernotices_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_userprofile`
--
ALTER TABLE `qa_userprofile`
  ADD CONSTRAINT `qa_userprofile_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `qa_uservotes`
--
ALTER TABLE `qa_uservotes`
  ADD CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  ADD CONSTRAINT `qa_uservotes_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `qa_users` (`userid`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
