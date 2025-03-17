create table admin(
	admin_id varchar(20) primary key, 
	admin_passwd text,
	admin_name text
);

insert into admin values('admin', 'admin', '');

create table category(
	cat_id serial primary key,
	cat_desc text
);

insert into category(cat_desc) values
('Ashirwad'), 
('Balgandharva Jewellery'), 
('Diamond'), 
('Golden Jazz'),
('Mangalsutra'),
('Royal Jewellery'),
('Silver'),
('Swarajya'),
('Temple Jewellery');

create table product(
	prod_id serial primary key,
	prod_desc text, 
	rate float, 
	disc float, 
	cat_id integer references category(cat_id)
);

create table customer(
	email varchar(50) primary key, 
	passwd text, 
	name text, 
	address text, 
	phone text
);

create table orders(
	ord_id serial primary key, 
	ord_date date, 
	total float, 
	email varchar(50) references customer(email), 
	processed_yn varchar(20), 
	card_no text, 
	bank_name text
);

create table order_details(
	ord_id integer references orders(ord_id), 
	prod_id integer references product(prod_id), 
	qty float, 
	primary key(ord_id,prod_id)
);

insert into product(prod_desc, rate, disc, cat_id) values
('Celtic',50000,10,1),
('EssentiallyLite',66000,15,1),
('Biasel Bangel',100000,0,1),
('Striking Forever',150000,0,1),
('Jiha Bangel',200000,20,1),
('Doris Bangel',250000,10,1),
('Widyat Bangel',300000,0,1),
('Deema Bangel',350000,15,1),
('Cleodora Bangel',550000,15,1),
('Karana Bangel',650000,10,1),

('Circonia earring',600000,0,2),
('Bridal Necklace',620000,0,2),
('Hastan earring',220000,0,2),
('Bliran Necklace',620000,0,2),
('Floral',290000,0,2),
('Aaran Bangel',900000,0,2),
('Aarav Bangel',290000,0,2),
('Traditional Bangel',100000,0,2),
('Tessera Bangel',660000,0,2),
('Pohe Har',990000,0,2),

('Blossom',1000000,10,3),
('Taj',550000,20,3),
('Passoa',750000,10,3),
('Brigyda',950000,0,3),
('Avsar',660000,15,3),
('Sleek',660000,15,3),
('Clem',450000,10,3),
('Licoric',850000,0,3),
('American Diamond',1000000,0,3),
('Curacao',560000,15,3),

('Dazziling gold',20000,15,4),
('Antique',69000,0,4),
('Astra',64000,10,4),
('Gallino',30000,10,4),
('Ribah',35000,10,4),
('Ribaan',45000,15,4),
('Jhumaka',35000,15,4),
('Migan',55000,15,4),
('Ayala',55000,20,4),
('Italian coral',90000,0,4),

('Indrani',75000,10,5),
('Mayur',64000,10,5),
('Parineeta',45000,15,5),
('Jyotsana',55000,15,5),
('Geetanjali',45000,10,5),
('Chandrima',65000,10,5),
('Pallavi',35000,10,5),
('Devika',36000,20,5),
('Aparajita',45000,10,5),
('Aditi',30000,20,5),

('Alpah',200000,2,6),
('Shagun',800000,2,6),
('Arion',90000,2,6),
('Traditional rajasthani',90000,5,6),
('Ziara',100000,3,6),
('Rani Har',700000,10,6),
('Swaroop',600000,15,6),
('Sazerac ring',60000,20,6),
('Savoy',55000,10,6),
('Pushpanjal',70000,0,6),

('Cordial',60000,10,7),
('Baileys',79000,10,7),
('Corona',56000,0,7),
('Tessera',49000,10,7),
('Mastani',59000,20,7),
('Peora',35000,5,7),
('Nerissa',65000,6,7),
('Magnificent',56000,5,7),
('Joan',32000,5,7),
('Safyra',38000,0,7),

('Aspira',400000,6,8),
('Pearl',350000,10,8),
('Jhumki',450000,8,8),
('Mahi',250000,10,8),
('Abhati',950000,0,8),
('Thushi',500000,3,8),
('Glitter',350000,0,8),
('Nose ring',50000,0,8),
('Clara ring',20000,0,8),
('BajuBand',300000,10,8),

('Jhumka',200000,0,9),
('Pushparjali',180000,0,9),
('Shreeyansh',340000,0,9),
('Sukki',230000,0,9),
('Angostura',120000,0,9),
('SuryaKiran',320000,0,9),
('Mukut',850000,0,9),
('Vividh Tej',550000,0,9),
('KamarPatta',450000,0,9),
('Luxurious Floralia',650000,0,9);
