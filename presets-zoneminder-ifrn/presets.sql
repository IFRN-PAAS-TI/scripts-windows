/* Para importar este arquivo no zoneminder, execute como root o comando:
	# mysql -p "zm" < presets.sql
   Lembrando que "presets.sql" precisa estar no diretorio atual.
	
 */

INSERT INTO `MonitorPresets` VALUES (NULL, 'IFRN Preset P1354-E/M1114-E', 'Remote', 'http', 'simple', NULL, NULL, NULL, 'usuario:senha@endereco.ip', 80, '/mjpg/video.mjpg', NULL, 640, 480, 3, NULL, 0, NULL, NULL, NULL, 100, 100)

/*(
  `Id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(64) NOT NULL default '',
  `Type` enum('Local','Remote','File','Ffmpeg','Libvlc','cURL') NOT NULL default 'Local',
  `Device` tinytext,
  `Channel` tinytext,
  `Format` int(10) unsigned default NULL,
  `Protocol` varchar(16) default NULL,
  `Method` varchar(16) default NULL,
  `Host` varchar(64) default NULL,
  `Port` varchar(8) default NULL,
  `Path` varchar(255) default NULL,
  `SubPath` varchar(64) default NULL,
  `Width` smallint(5) unsigned default NULL,
  `Height` smallint(5) unsigned default NULL,
  `Palette` int(10) unsigned default NULL,
  `MaxFPS` decimal(5,2) default NULL,
  `Controllable` tinyint(3) unsigned NOT NULL default '0',
  `ControlId` varchar(16) default NULL,
  `ControlDevice` varchar(255) default NULL,
  `ControlAddress` varchar(255) default NULL,
  `DefaultRate` smallint(5) unsigned NOT NULL default '100',
  `DefaultScale` smallint(5) unsigned NOT NULL default '100',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB;
*/
