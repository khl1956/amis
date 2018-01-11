/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     22.12.2017 21:10:42                          */
/*==============================================================*/

/*==============================================================*/
/* База данних: social_network                                  */
/*==============================================================*/

/*==============================================================*/
/* Таблиця: logining_data                                       */
/*==============================================================*/

CREATE TABLE `logining_data` (
  `id` int(10) unsigned NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Індекси таблиці `logining_data`                              */
/*==============================================================*/

ALTER TABLE `logining_data`
  ADD PRIMARY KEY (`id`);

/*==============================================================*/
/* AUTO_INCREMENT для таблиці `logining_data`                   */
/*==============================================================*/

ALTER TABLE `logining_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;


/*==============================================================*/
/* Таблиця : messages                                           */
/*==============================================================*/

CREATE TABLE `messages` (
  `idSender` int(11) NOT NULL,
  `idRecipient` int(11) NOT NULL,
  `message` text NOT NULL,
  `dataTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table name: user_information                                 */
/*==============================================================*/

CREATE TABLE `user_information` (
  `id` int(10) unsigned NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `surename` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `birthday` date NOT NULL,
  `films` text NOT NULL,
  `photo` text NOT NULL,
  `friends` text NOT NULL,
  `dialogue` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


/*==============================================================*/
/* Індекси таблиці `user_information`                           */
/*==============================================================*/

ALTER TABLE `user_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);


/*==============================================================*/
/* AUTO_INCREMENT для таблиці `user_information`                */
/*==============================================================*/

ALTER TABLE `user_information`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;