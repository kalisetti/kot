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

--
-- 2019/05/11
--

/*
CREATE TABLE IF NOT EXISTS `user_login`(
	`user_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
	`user_email` VARCHAR(50) NOT NULL COMMENT '',
	`user_password` VARCHAR(50) NOT NULL COMMENT '',
	`user_name` VARCHAR(50) NOT NULL COMMENT '',
	PRIMARY KEY (`user_id`) COMMENT '',
	UNIQUE INDEX `user_email`(`user_email` ASC) COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;
*/

CREATE TABLE IF NOT EXISTS `tab_user`(
	`name` VARCHAR(140),
	`user_name` VARCHAR(140),
	`user_email` VARCHAR(140),
	`user_password` VARCHAR(140),
	`enabled` INT(1),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

/*
CREATE TABLE IF NOT EXISTS `user_status`(
	`user_id` INT(11) NOT NULL COMMENT '',
	`user_status` TEXT NOT NULL COMMENT '',
	`created_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	INDEX `user_id`(`user_id` ASC) COMMENT '',
	CONSTRAINT `user_status_ibfk_1` FOREIGN KEY(`user_id`) REFERENCES `user_login`(`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;
*/

-- Role
CREATE TABLE IF NOT EXISTS `tab_role`(
	`name` VARCHAR(140),
	`role_name` VARCHAR(140),
	`enabled` INT(1),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- User Role (XXXXXXXXXXXXXXXX IN-PROGRESS XXXXXXXXXXXXXXXX)
CREATE TABLE IF NOT EXISTS `tab_user_role`(
	`name` VARCHAR(140),
	`user` INT(1),
	`role` INT(1),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`parent`,`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

--
-- 2019/05/13
--

--
-- Admin
--

-- Module
CREATE TABLE IF NOT EXISTS `tab_module`(
	`name` VARCHAR(140),
	`module_name` VARCHAR(140),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- UOM
CREATE TABLE IF NOT EXISTS `tab_uom`(
	`name` VARCHAR(140),
	`uom_name` VARCHAR(140),
	`description` VARCHAR(140),
	`must_be_whole_number` INT(1) DEFAULT 0,
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

--
-- Fooding
--

-- Item Type
CREATE TABLE IF NOT EXISTS `tab_item_type`(
	`name` VARCHAR(140),
	`item_type_name` VARCHAR(140),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- Item Category
CREATE TABLE IF NOT EXISTS `tab_item_category`(
	`name` VARCHAR(140),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`parent`,`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- Item
CREATE TABLE IF NOT EXISTS `tab_item`(
	`name` VARCHAR(140),
	`item_name` VARCHAR(140),
	`item_type` VARCHAR(140),
	`item_category` VARCHAR(140),
	`uom` VARCHAR(140),
	`image` TEXT,
	`rate` DECIMAL(18,6),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- Menu
CREATE TABLE IF NOT EXISTS `tab_menu`(
	`name` VARCHAR(140),
	`menu_name` VARCHAR(140),
	`menu_type` VARCHAR(30),
	`rate` DECIMAL(18,6),
	`discount` DECIMAL(18,6),
	`amount` DECIMAL(18,6),
	`is_default` INT(1),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- Menu Group
CREATE TABLE IF NOT EXISTS `tab_menu_group`(
	`name` VARCHAR(140),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY pk_menu_group (`parent`,`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

-- Menu Group Item
CREATE TABLE IF NOT EXISTS `tab_menu_group_item`(
	`name` VARCHAR(140),
	`item_type` VARCHAR(140),
	`item_category` VARCHAR(140),
	`menu` VARCHAR(140),
	`menu_group` VARCHAR(140),
	`uom` VARCHAR(140),
	`rate` DECIMAL(18,6),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY pk_menu_group (`menu`,`menu_group`,`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;		

-- Table	
CREATE TABLE IF NOT EXISTS `tab_table`(
	`name` VARCHAR(140),
	`table_name` VARCHAR(140),
	`idx` INT(8),
	`docstatus` INT(1),
	`parent` VARCHAR(140),
	`parentfield` VARCHAR(140),
	`parenttype` VARCHAR(140),
	`_comments` TEXT,
	`_liked_by` TEXT,
	`_assign` TEXT,
	`_user_tags` TEXT,
	`owner` VARCHAR(140),
	`creation` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
	`modified_by` VARCHAR(140),
	`modified` DATETIME,
	PRIMARY KEY (`name`) COMMENT ''
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

INSERT INTO `tab_table`(name,table_name,idx,docstatus,owner,creation) VALUES
	('Table-1','Table-1',0,0,USER(),NOW()),
	('Table-2','Table-2',0,0,USER(),NOW()),
	('Table-3','Table-3',0,0,USER(),NOW()),
	('Table-4','Table-4',0,0,USER(),NOW()),
	('Table-5','Table-5',0,0,USER(),NOW()),
	('Table-6','Table-6',0,0,USER(),NOW()),
	('Table-7','Table-7',0,0,USER(),NOW()),
	('Table-8','Table-8',0,0,USER(),NOW()),
	('Table-9','Table-9',0,0,USER(),NOW()),
	('Table-10','Table-10',0,0,USER(),NOW());