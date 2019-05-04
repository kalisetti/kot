--
-- 2019/03/17
-- KOT DB
--
--

create database kot;
use kot;

GRANT ALL PRIVILEGES ON kot.* TO 'kot'@'localhost' IDENTIFIED BY 'kot'; 

--
-- tables
--

create table if not exists `tabUser`(
	`name`	varchar(140),
	`username` varchar(140) not null,
	`password` varchar(140) not null,
	`email` varchar(140) not null,
	primary key(name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `tabUser`
	(name, username, password, email)
values
	('test','test','test','test@test.com');

create table item_group(name varchar(140),
owner varchar(140),
creation datetime(6),
modified_by varchar(140),
modified varchar(140),
parent varchar(140),
idx int(8),
description varchar(140),
primary key(name)
);

insert into item_group
	(name, owner, creation, modified_by, modified, parent, idx, description)
values 
	('Breakfast', user(), now(), null, null, null, 1, 'Breakfast'),
	('Lunch', user(), now(), null, null, null, 1, 'Lunch'),
	('Dinner', user(), now(), null, null, null, 1, 'Dinner');

create table item(name varchar(140),
owner varchar(140),
creation datetime(6),
modified_by varchar(140),
modified varchar(140),
parent varchar(140),
idx int(8),
description varchar(140),
item_group varchar(140),
primary key(name)
);

