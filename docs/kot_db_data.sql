--
-- User
--

INSERT INTO `tab_user`(name,user_name,user_email,user_password,enabled,idx,docstatus,owner,creation) values
	('Admin','Admin','Admin','admin',1,0,0,USER(),NOW()),
	('Kitchen','Kitchen','Kitchen','kitchen',1,0,0,USER(),NOW()),
	('Test','Test','Test','test',0,0,0,USER(),NOW()),
	('Guest','Guest','Guest','guest',1,0,0,USER(),NOW());

--
-- Role
--

INSERT INTO `tab_role`(name,role_name,enabled,idx,docstatus,owner,creation) values
	('Admin','Admin',1,0,0,USER(),NOW()),
	('Counter','Counter',1,0,0,USER(),NOW()),
	('Kitchen','Kitchen',1,0,0,USER(),NOW());


--
-- Module
--

INSERT INTO `tab_module`(name,module_name,idx,docstatus,owner,creation) values('Fooding','Fooding',0,0,USER(),NOW()),('Lodging','Lodging',0,0,USER(),NOW());

--
-- UOM
--

INSERT INTO `tab_uom`(name,uom_name,description,must_be_whole_number,idx,docstatus,owner,creation) values('No','No','Numbers',0,0,0,USER(),NOW());
INSERT INTO `tab_uom`(name,uom_name,description,must_be_whole_number,idx,docstatus,owner,creation) values('Plate','Plate','Plate',0,0,0,USER(),NOW());
INSERT INTO `tab_uom`(name,uom_name,description,must_be_whole_number,idx,docstatus,owner,creation) values('Peg','Peg','Peg',0,0,0,USER(),NOW());

--
-- Item Type
--

INSERT INTO `tab_item_type`(name,item_type_name,idx,docstatus,owner,creation) values
		('Food','Food',0,0,USER(),NOW()),
		('Beverages','Beverages',0,0,USER(),NOW());
		
--
-- Item Category
--

INSERT INTO `tab_item_category`(name,parent,idx,docstatus,owner,creation,parentfield,parenttype) values
		('Veg','Food',0,0,USER(),NOW(),'items','Item Type'),
		('Non-Veg','Food',1,0,USER(),NOW(),'items','Item Type'),
		('Alcoholic','Beverages',0,0,USER(),NOW(),'items','Item Type'),
		('Non-Alcoholic','Beverages',1,0,USER(),NOW(),'items','Item Type');
		
--
-- Item
--

-- Food
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Veg Pakora','Veg Pakora','Food','Plate','Veg',60,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Onion Pakora','Onion Pakora','Food','Plate','Veg',60,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('French Fries','French Fries','Food','Plate','Veg',55,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Crispy Potato','Crispy Potato','Food','Plate','Veg',80,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Peanut Masala','Peanut Masala','Food','Plate','Veg',50,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Koka Masala','Koka Masala','Food','Plate','Veg',50,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Wai Wai Masala','Wai Wai Masala','Food','Plate','Veg',40,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Paneer Chilly','Paneer Chilly','Food','Plate','Veg',120,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Paneer Pakora','Paneer Pakora','Food','Plate','Veg',110,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Alu Paneer','Alu Paneer','Food','Plate','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Alu Matar','Alu Matar','Food','Plate','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Matar Paneer','Matar Paneer','Food','Plate','Veg',100,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Alu Dum','Alu Dum','Food','Plate','Veg',60,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Mix. Veg (Fried)','Mix. Veg (Fried)','Food','Plate','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Mushroom Datsi','Mushroom Datsi','Food','Plate','Veg',120,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Sag Datsi','Sag Datsi','Food','Plate','Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Ema Datsi','Ema Datsi','Food','Plate','Veg',110,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Kewa Datshi','Kewa Datshi','Food','Plate','Veg',80,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Plain Rice','Plain Rice','Food','Plate','Veg',40,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Dal Fry','Dal Fry','Food','Plate','Veg',25,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Dal Tadka','Dal Tadka','Food','Plate','Veg',60,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Veg Friend Rice','Veg Friend Rice','Food','Plate','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Pork Friend Rice','Pork Friend Rice','Food','Plate','Non-Veg',110,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Beef Friend Rice','Beef Friend Rice','Food','Plate','Non-Veg',110,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Friend Rice','Chicken Friend Rice','Food','Plate','Non-Veg',110,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Veg Pulao','Veg Pulao','Food','Plate','Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Biryani','Chicken Biryani','Food','Plate','Non-Veg',160,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Veg Biryani','Veg Biryani','Food','Plate','Veg',130,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Chilly','Chicken Chilly','Food','Plate','Non-Veg',130,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Pork Chilly','Pork Chilly','Food','Plate','Non-Veg',130,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Beef Chilly','Beef Chilly','Food','Plate','Non-Veg',130,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Fish Chilly','Fish Chilly','Food','Plate','Non-Veg',130,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Beef Datsi','Beef Datsi','Food','Plate','Non-Veg',140,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Pork Datsi','Pork Datsi','Food','Plate','Non-Veg',140,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Shakam Datsi','Shakam Datsi','Food','Plate','Non-Veg',160,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Sikam Datsi','Sikam Datsi','Food','Plate','Non-Veg',160,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Pork Paa','Pork Paa','Food','Plate','Non-Veg',150,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Beef Paa','Beef Paa','Food','Plate','Non-Veg',150,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Shakam Paa','Shakam Paa','Food','Plate','Non-Veg',160,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Sikam Paa','Sikam Paa','Food','Plate','Non-Veg',160,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Paa','Chicken Paa','Food','Plate','Non-Veg',150,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Karjee Marjee (Spicy Chicken)','Karjee Marjee (Spicy Chicken)','Food','Plate','Non-Veg',80,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Fry','Chicken Fry','Food','Plate','Non-Veg',120,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Pork Fry','Pork Fry','Food','Plate','Non-Veg',130,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Beef Fry','Beef Fry','Food','Plate','Non-Veg',110,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Fish Fry','Fish Fry','Food','Plate','Non-Veg',90,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Plain Roti','Plain Roti','Food','No','Veg',15,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Alu Paratha','Alu Paratha','Food','No','Veg',50,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Puri Sabji','Puri Sabji','Food','Plate','Veg',60,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Veg. Chowmein','Veg. Chowmein','Food','Plate','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Pork Chowmein','Pork Chowmein','Food','Plate','Non-Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Chowmein','Chicken Chowmein','Food','Plate','Non-Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Beef Chowmein','Beef Chowmein','Food','Plate','Non-Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Veg. Bathup','Veg. Bathup','Food','Plate','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Pork Bathup','Pork Bathup','Food','Plate','Non-Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Bathup','Chicken Bathup','Food','Plate','Non-Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Beef Bathup','Beef Bathup','Food','Plate','Non-Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Koka Chowmein Veg.','Koka Chowmein Veg.','Food','Plate','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Koka Chowmein Non-Veg','Koka Chowmein Non-Veg','Food','Plate','Non-Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Koka Veg','Koka Veg','Food','Plate','Veg',60,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Koka Non-Veg','Koka Non-Veg','Food','Plate','Non-Veg',80,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Mushroom Soup','Mushroom Soup','Food','No','Veg',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Veg. Soup','Veg. Soup','Food','No','Veg',70,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Chicken Soup','Chicken Soup','Food','No','Non-Veg',90,0,0,USER(),NOW());

-- Drinks
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Tea (Milk)','Tea (Milk)','Beverages','No','Non-Alcoholic',20,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Tea (Black)','Tea (Black)','Beverages','No','Non-Alcoholic',15,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Coffee (Milk)','Coffee (Milk)','Beverages','No','Non-Alcoholic',30,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Coffee (Black)','Coffee (Black)','Beverages','No','Non-Alcoholic',25,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Lemon Tea','Lemon Tea','Beverages','No','Non-Alcoholic',30,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Suja','Suja','Beverages','No','Non-Alcoholic',30,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Green Tea','Green Tea','Beverages','No','Non-Alcoholic',45,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('K5','K5','Beverages','Peg','Alcoholic',150,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Special Courier','Special Courier','Beverages','Peg','Alcoholic',55,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Highland (Bhutan Grain Whisky)','Highland (Bhutan Grain Whisky)','Beverages','Peg','Alcoholic',35,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Rock Bee','Rock Bee','Beverages','Peg','Alcoholic',20,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Black Mountain','Black Mountain','Beverages','Peg','Alcoholic',25,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Raven Vodka','Raven Vodka','Beverages','Peg','Alcoholic',50,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Druk 11000 (Can)','Druk 11000 (Can)','Beverages','No','Alcoholic',80,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Druk 11000','Druk 11000','Beverages','No','Alcoholic',80,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Foster (Can)','Foster (Can)','Beverages','No','Alcoholic',130,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Foster','Foster','Beverages','No','Alcoholic',130,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Lager (Can)','Lager (Can)','Beverages','No','Alcoholic',90,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Lager','Lager','Beverages','No','Alcoholic',90,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Coca-Cola (Can)','Coca-Cola (Can)','Beverages','No','Non-Alcoholic',60,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Coca-Cola','Coca-Cola','Beverages','No','Non-Alcoholic',20,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Applie Juice (Tetra Pack)','Applie Juice (Tetra Pack)','Beverages','No','Non-Alcoholic',20,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Apple Juice (Bottled)','Apple Juice (Bottled)','Beverages','No','Non-Alcoholic',25,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Ice Tea (Peach)','Ice Tea (Peach)','Beverages','No','Non-Alcoholic',60,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Fanta','Fanta','Beverages','No','Non-Alcoholic',20,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('7Up','7Up','Beverages','No','Non-Alcoholic',20,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Nimboo Pani','Nimboo Pani','Beverages','No','Non-Alcoholic',20,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Red Bull','Red Bull','Beverages','No','Non-Alcoholic',50,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Minteral Water (Small)','Minteral Water (Small)','Beverages','No','Non-Alcoholic',15,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Minteral Water','Minteral Water','Beverages','No','Non-Alcoholic',20,0,0,USER(),NOW());

INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Vintria Big','Vintria Big','Beverages','','Alcoholic',430,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Vintria Small','Vintria Small','Beverages','','Alcoholic',0,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Zumzin (Big)','Zumzin (Big)','Beverages','','Alcoholic',300,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Zumzin (Small)','Zumzin (Small)','Beverages','','Alcoholic',150,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Takin (Big)','Takin (Big)','Beverages','','Alcoholic',0,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Takin (Small)','Takin (Small)','Beverages','','Alcoholic',0,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Breezer','Breezer','Beverages','','Alcoholic',110,0,0,USER(),NOW());
INSERT INTO `tab_item`(name,item_name,item_type,uom,item_category,rate,idx,docstatus,owner,creation) VALUES('Spy','Spy','Beverages','','Alcoholic',150,0,0,USER(),NOW());

--
-- Menu
--
INSERT INTO `tab_menu`(name,menu_name,menu_type,is_default,idx,docstatus,owner,creation) values
		('Regular Menu','Regular Menu','List',1,0,0,USER(),NOW()),
		('Catering Menu','Catering Menu','Bundle',0,0,0,USER(),NOW());
		
--
-- Menu Group
--		

INSERT INTO `tab_menu_group`(parent,name,idx,docstatus,owner,creation,parentfield,parenttype) values
		('Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Soup',1,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Rice Varieties',2,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Roti',3,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Main Course',4,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Hot Drinks',5,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Whisky',6,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Vodka',7,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Beer',8,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Cool Drinks',9,0,USER(),NOW(),'items','Menu'),
		('Regular Menu','Wine',10,0,USER(),NOW(),'items','Menu');

--
-- Menu Group Item
--

-- Food
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Veg Pakora','Food','Plate',60,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Onion Pakora','Food','Plate',60,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('French Fries','Food','Plate',55,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Crispy Potato','Food','Plate',80,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Peanut Masala','Food','Plate',50,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Koka Masala','Food','Plate',50,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Wai Wai Masala','Food','Plate',40,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Paneer Chilly','Food','Plate',120,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Paneer Pakora','Food','Plate',110,'Veg','Regular Menu','Snacks',0,0,USER(),NOW(),'items','Menu Group');

INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Alu Paneer','Food','Plate',70,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Alu Matar','Food','Plate',70,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Matar Paneer','Food','Plate',100,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Alu Dum','Food','Plate',60,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Mix. Veg (Fried)','Food','Plate',70,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Mushroom Datsi','Food','Plate',120,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Sag Datsi','Food','Plate',90,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Ema Datsi','Food','Plate',110,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Kewa Datshi','Food','Plate',80,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');

INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Plain Rice','Food','Plate',40,'Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Dal Fry','Food','Plate',25,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Dal Tadka','Food','Plate',60,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Veg Friend Rice','Food','Plate',70,'Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Pork Friend Rice','Food','Plate',110,'Non-Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Beef Friend Rice','Food','Plate',110,'Non-Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Friend Rice','Food','Plate',110,'Non-Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Veg Pulao','Food','Plate',90,'Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Biryani','Food','Plate',160,'Non-Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Veg Biryani','Food','Plate',130,'Veg','Regular Menu','Rice Varieties',0,0,USER(),NOW(),'items','Menu Group');

INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Chilly','Food','Plate',130,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Pork Chilly','Food','Plate',130,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Beef Chilly','Food','Plate',130,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Fish Chilly','Food','Plate',130,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Beef Datsi','Food','Plate',140,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Pork Datsi','Food','Plate',140,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Shakam Datsi','Food','Plate',160,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Sikam Datsi','Food','Plate',160,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Pork Paa','Food','Plate',150,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Beef Paa','Food','Plate',150,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Shakam Paa','Food','Plate',160,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Sikam Paa','Food','Plate',160,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Paa','Food','Plate',150,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Karjee Marjee (Spicy Chicken)','Food','Plate',80,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Fry','Food','Plate',120,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Pork Fry','Food','Plate',130,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Beef Fry','Food','Plate',110,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Fish Fry','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');

INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Plain Roti','Food','No',15,'Veg','Regular Menu','Roti',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Alu Paratha','Food','No',50,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Puri Sabji','Food','Plate',60,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');

INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Veg. Chowmein','Food','Plate',70,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Pork Chowmein','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Chowmein','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Beef Chowmein','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Veg. Bathup','Food','Plate',70,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Pork Bathup','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Bathup','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Beef Bathup','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Koka Chowmein Veg.','Food','Plate',70,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Koka Chowmein Non-Veg','Food','Plate',90,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Koka Veg','Food','Plate',60,'Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Koka Non-Veg','Food','Plate',80,'Non-Veg','Regular Menu','Main Course',0,0,USER(),NOW(),'items','Menu Group');

INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Mushroom Soup','Food','No',90,'Veg','Regular Menu','Soup',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Veg. Soup','Food','No',70,'Veg','Regular Menu','Soup',0,0,USER(),NOW(),'items','Menu Group');
INSERT INTO tab_menu_group_item(name,item_type,uom,rate,item_category,menu,menu_group,idx,docstatus,owner,creation,parentfield,parenttype) VALUES('Chicken Soup','Food','No',90,'Non-Veg','Regular Menu','Soup',0,0,USER(),NOW(),'items','Menu Group');

-- Drinks