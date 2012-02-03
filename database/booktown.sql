-- Copyright (c) 2001 by Command Prompt, Inc. This material may be
-- distributed only subject to the terms and conditions set forth in
-- the Open Publication License, v1.0 or later (the latest version is
-- presently available at http://www.opencontent.org/openpub/).

-- This is a modified version of "booktown.sql" which can be found at
-- http://www.commandprompt.com/ppbook/booktown.sql

BEGIN TRANSACTION;
DROP TABLE IF EXISTS "publishers";
CREATE TABLE "publishers" (
            "publisher_id" integer NOT NULL,
            "name" text,
            "address" text,
            Constraint "publishers_pkey" Primary Key ("publisher_id")
    );
INSERT INTO "publishers" VALUES(59,'Random House','Random House, Inc, 1540 Broadway, New York, NY 10036');
INSERT INTO "publishers" VALUES(62,'Watson-Guptill Publications','1515 Boradway, New York, NY 10036');
INSERT INTO "publishers" VALUES(65,'HarperCollins','HarperCollins Publishers, 10 E 53rd St, New York, NY 10022');
INSERT INTO "publishers" VALUES(75,'Doubleday','Random House, Inc, 1540 Broadway, New York, NY 10036');
INSERT INTO "publishers" VALUES(91,'Henry Holt & Company, Inc.','Henry Holt & Company, Inc. 115 West 18th Street New York, NY 10011');
INSERT INTO "publishers" VALUES(99,'Ace Books','The Berkley Publishing Group, Penguin Putnam Inc, 375 Hudson St, New York, NY 10014');
INSERT INTO "publishers" VALUES(101,'Roc','Penguin Putnam Inc, 375 Hudson St, New York, NY 10014');
INSERT INTO "publishers" VALUES(102,'Penguin','Penguin Putnam Inc, 375 Hudson St, New York, NY 10014');
INSERT INTO "publishers" VALUES(105,'Noonday Press','Farrar Straus & Giroux Inc, 19 Union Square W, New York, NY 10003');
INSERT INTO "publishers" VALUES(113,'O''Reilly & Associates','O''Reilly & Associates, Inc. 101 Morris St, Sebastopol, CA 95472');
INSERT INTO "publishers" VALUES(149,'Kids Can Press','Kids Can Press, 29 Birch Ave. Toronto, ON  M4V 1E2');
INSERT INTO "publishers" VALUES(163,'Mojo Press','Mojo Press, PO Box 1215, Dripping Springs, TX 78720');
INSERT INTO "publishers" VALUES(171,'Books of Wonder','Books of Wonder, 16 W. 18th St. New York, NY, 10011');
DROP TABLE IF EXISTS "authors";
CREATE TABLE "authors" (
            "author_id" integer NOT NULL,
            "last_name" text,
            "first_name" text,
            Constraint "authors_pkey" Primary Key ("author_id")
    );
INSERT INTO "authors" VALUES(16,'Alcott','Louisa May');
INSERT INTO "authors" VALUES(115,'Poe','Edgar Allen');
INSERT INTO "authors" VALUES(1111,'Denham','Ariel');
INSERT INTO "authors" VALUES(1212,'Worsley','John');
INSERT INTO "authors" VALUES(1213,'Brookins','Andrew');
INSERT INTO "authors" VALUES(1533,'Brautigan','Richard');
INSERT INTO "authors" VALUES(1644,'Hogarth','Burne');
INSERT INTO "authors" VALUES(1717,'Brite','Poppy Z.');
INSERT INTO "authors" VALUES(1809,'Simon','Neil');
INSERT INTO "authors" VALUES(1866,'Herbert','Frank');
INSERT INTO "authors" VALUES(2001,'Clarke','Arthur C.');
INSERT INTO "authors" VALUES(2031,'Brown','Margaret Wise');
INSERT INTO "authors" VALUES(2112,'Gorey','Edward');
INSERT INTO "authors" VALUES(4156,'King','Stephen');
INSERT INTO "authors" VALUES(7805,'Lutz','Mark');
INSERT INTO "authors" VALUES(7806,'Christiansen','Tom');
INSERT INTO "authors" VALUES(15990,'Bourgeois','Paulette');
INSERT INTO "authors" VALUES(25041,'Bianco','Margery Williams');
INSERT INTO "authors" VALUES(25045,'Geisel','Theodore Seuss');
DROP TABLE IF EXISTS "stock";
CREATE TABLE "stock" (
            "isbn" text NOT NULL,
            "cost" numeric(5,2),
            "retail_price" numeric(5,2),
            "stock" integer,
            Constraint "stock_pkey" Primary Key ("isbn")
    );
INSERT INTO "stock" VALUES('0385121679',29,36.95,65);
INSERT INTO "stock" VALUES('039480001X',30,32.95,31);
INSERT INTO "stock" VALUES('0394900014',23,23.95,0);
INSERT INTO "stock" VALUES('044100590X',36,45.95,89);
INSERT INTO "stock" VALUES('0441172717',17,21.95,77);
INSERT INTO "stock" VALUES('0451160916',24,28.95,22);
INSERT INTO "stock" VALUES('0451198492',36,46.95,0);
INSERT INTO "stock" VALUES('0451457994',17,22.95,0);
INSERT INTO "stock" VALUES('0590445065',23,23.95,10);
INSERT INTO "stock" VALUES('0679803335',20,24.95,18);
INSERT INTO "stock" VALUES('0694003611',25,28.95,50);
INSERT INTO "stock" VALUES('0760720002',18,23.95,28);
INSERT INTO "stock" VALUES('0823015505',26,28.95,16);
INSERT INTO "stock" VALUES('0929605942',19,21.95,25);
INSERT INTO "stock" VALUES('1885418035',23,24.95,77);
INSERT INTO "stock" VALUES('0394800753',16,16.95,4);
DROP TABLE IF EXISTS "customers";
CREATE TABLE "customers" (
            "customer_id" integer NOT NULL,
            "last_name" text,
            "first_name" text,
            Constraint "customers_pkey" Primary Key ("customer_id")
    );
INSERT INTO "customers" VALUES(107,'Jackson','Annie');
INSERT INTO "customers" VALUES(112,'Gould','Ed');
INSERT INTO "customers" VALUES(142,'Allen','Chad');
INSERT INTO "customers" VALUES(146,'Williams','James');
INSERT INTO "customers" VALUES(172,'Brown','Richard');
INSERT INTO "customers" VALUES(185,'Morrill','Eric');
INSERT INTO "customers" VALUES(221,'King','Jenny');
INSERT INTO "customers" VALUES(270,'Bollman','Julie');
INSERT INTO "customers" VALUES(388,'Morrill','Royce');
INSERT INTO "customers" VALUES(409,'Holloway','Christine');
INSERT INTO "customers" VALUES(430,'Black','Jean');
INSERT INTO "customers" VALUES(476,'Clark','James');
INSERT INTO "customers" VALUES(480,'Thomas','Rich');
INSERT INTO "customers" VALUES(488,'Young','Trevor');
INSERT INTO "customers" VALUES(574,'Bennett','Laura');
INSERT INTO "customers" VALUES(652,'Anderson','Jonathan');
INSERT INTO "customers" VALUES(655,'Olson','Dave');
INSERT INTO "customers" VALUES(671,'Brown','Chuck');
INSERT INTO "customers" VALUES(723,'Eisele','Don');
INSERT INTO "customers" VALUES(724,'Holloway','Adam');
INSERT INTO "customers" VALUES(738,'Gould','Shirley');
INSERT INTO "customers" VALUES(830,'Robertson','Royce');
INSERT INTO "customers" VALUES(853,'Black','Wendy');
INSERT INTO "customers" VALUES(860,'Owens','Tim');
INSERT INTO "customers" VALUES(880,'Robinson','Tammy');
INSERT INTO "customers" VALUES(898,'Gerdes','Kate');
INSERT INTO "customers" VALUES(964,'Gould','Ramon');
INSERT INTO "customers" VALUES(1045,'Owens','Jean');
INSERT INTO "customers" VALUES(1123,'Corner','Kathy');
INSERT INTO "customers" VALUES(1125,'Bollman','Owen');
INSERT INTO "customers" VALUES(1149,'Becker','Owen');
DROP TABLE IF EXISTS "subjects";
CREATE TABLE "subjects" (
            "subject_id" integer NOT NULL,
            "subject" text,
            "location" text,
            Constraint "subjects_pkey" Primary Key ("subject_id")
    );
INSERT INTO "subjects" VALUES(0,'Arts','Creativity St');
INSERT INTO "subjects" VALUES(1,'Business','Productivity Ave');
INSERT INTO "subjects" VALUES(2,'Childrens Books','Kids Ct');
INSERT INTO "subjects" VALUES(3,'Classics','Academic Rd');
INSERT INTO "subjects" VALUES(4,'Computers','Productivity Ave');
INSERT INTO "subjects" VALUES(5,'Cooking','Creativity St');
INSERT INTO "subjects" VALUES(6,'Drama','Main St');
INSERT INTO "subjects" VALUES(7,'Entertainment','Main St');
INSERT INTO "subjects" VALUES(8,'History','Academic Rd');
INSERT INTO "subjects" VALUES(9,'Horror','Black Raven Dr');
INSERT INTO "subjects" VALUES(10,'Mystery','Black Raven Dr');
INSERT INTO "subjects" VALUES(11,'Poetry','Sunset Dr');
INSERT INTO "subjects" VALUES(12,'Religion','\N');
INSERT INTO "subjects" VALUES(13,'Romance','Main St');
INSERT INTO "subjects" VALUES(14,'Science','Productivity Ave');
INSERT INTO "subjects" VALUES(15,'Science Fiction','Main St');
DROP TABLE IF EXISTS "books";
CREATE TABLE "books" (
            "book_id" integer NOT NULL,
            "title" text NOT NULL,
            "author_id" integer references authors(author_id),
            "subject_id" integer references subjects(subject_id),
            Constraint "books_id_pkey" Primary Key ("book_id")
    );
INSERT INTO "books" VALUES(156,'The Tell-Tale Heart',115,9);
INSERT INTO "books" VALUES(190,'Little Women',16,6);
INSERT INTO "books" VALUES(1234,'The Velveteen Rabbit',25041,3);
INSERT INTO "books" VALUES(1501,'Goodnight Moon',2031,2);
INSERT INTO "books" VALUES(1590,'Bartholomew and the Oobleck',1809,2);
INSERT INTO "books" VALUES(1608,'The Cat in the Hat',1809,2);
INSERT INTO "books" VALUES(2038,'Dynamic Anatomy',1644,0);
INSERT INTO "books" VALUES(4267,'2001: A Space Odyssey',2001,15);
INSERT INTO "books" VALUES(4513,'Dune',1866,15);
INSERT INTO "books" VALUES(7808,'The Shining',4156,9);
INSERT INTO "books" VALUES(25908,'Franklin in the Dark',15990,2);
INSERT INTO "books" VALUES(41472,'Practical PostgreSQL',1212,4);
INSERT INTO "books" VALUES(41473,'Programming Python',7805,4);
INSERT INTO "books" VALUES(41477,'Learning Python',7805,4);
INSERT INTO "books" VALUES(41478,'Perl Cookbook',7806,4);
DROP TABLE IF EXISTS "editions";
CREATE TABLE "editions" (
            "isbn" text NOT NULL,
            "book_id" integer references books(book_id),
            "edition" integer,
            "publisher_id" integer,
            "publication_date" date,
            CONSTRAINT "integrity" CHECK (((book_id NOTNULL) AND (edition NOTNULL))),
            Constraint "pkey" Primary Key ("isbn")
    );
INSERT INTO "editions" VALUES('039480001X',1608,1,59,'1957-03-01');
INSERT INTO "editions" VALUES('0451160916',7808,1,75,'1981-08-01');
INSERT INTO "editions" VALUES('0394800753',1590,1,59,'1949-03-01');
INSERT INTO "editions" VALUES('0590445065',25908,1,150,'1987-03-01');
INSERT INTO "editions" VALUES('0694003611',1501,1,65,'1947-03-04');
INSERT INTO "editions" VALUES('0679803335',1234,1,102,'1922-01-01');
INSERT INTO "editions" VALUES('0760720002',190,1,91,'1868-01-01');
INSERT INTO "editions" VALUES('0394900014',1608,1,59,'1957-01-01');
INSERT INTO "editions" VALUES('0385121679',7808,2,75,'1993-10-01');
INSERT INTO "editions" VALUES('1885418035',156,1,163,'1995-03-28');
INSERT INTO "editions" VALUES('0929605942',156,2,171,'1998-12-01');
INSERT INTO "editions" VALUES('0441172717',4513,2,99,'1998-09-01');
INSERT INTO "editions" VALUES('044100590X',4513,3,99,'1999-10-01');
INSERT INTO "editions" VALUES('0451457994',4267,3,101,'2000-09-12');
INSERT INTO "editions" VALUES('0451198492',4267,3,101,'1999-10-01');
INSERT INTO "editions" VALUES('0823015505',2038,1,62,'1958-01-01');
INSERT INTO "editions" VALUES('0596000855',41473,2,113,'2001-03-01');
DROP TABLE IF EXISTS "shipments";
CREATE TABLE "shipments" (
	"shipment_id" integer NOT NULL,
	"customer_id" integer references customers(customer_id),
	"isbn" text references editions(isbn),
	"ship_date" timestamp with time zone,
	Constraint "shipments_pkey" Primary Key ("shipment_id")
);
INSERT INTO "shipments" VALUES(2,107,'0394800753','2001-09-22 20:58:56-07');
INSERT INTO "shipments" VALUES(56,880,'0590445065','2001-08-14 13:49:00-07');
INSERT INTO "shipments" VALUES(72,574,'0694003611','2001-08-06 07:49:44-07');
INSERT INTO "shipments" VALUES(95,480,'0590445065','2001-08-10 07:29:52-07');
INSERT INTO "shipments" VALUES(102,146,'0394900014','2001-08-11 13:34:08-07');
INSERT INTO "shipments" VALUES(117,185,'0760720002','2001-08-07 13:00:48-07');
INSERT INTO "shipments" VALUES(146,270,'039480001X','2001-08-13 09:42:10-07');
INSERT INTO "shipments" VALUES(189,107,'0394800753','2001-08-06 11:46:36-07');
INSERT INTO "shipments" VALUES(310,738,'0451198492','2001-08-15 14:02:01-07');
INSERT INTO "shipments" VALUES(323,671,'0451160916','2001-08-14 10:36:41-07');
INSERT INTO "shipments" VALUES(340,1149,'0385121679','2001-08-12 13:39:22-07');
INSERT INTO "shipments" VALUES(375,142,'039480001X','2001-08-06 09:29:21-07');
INSERT INTO "shipments" VALUES(406,1123,'0394900014','2001-08-13 09:47:04-07');
INSERT INTO "shipments" VALUES(433,898,'044100590X','2001-08-12 08:46:35-07');
INSERT INTO "shipments" VALUES(458,107,'0394800753','2001-08-07 10:58:36-07');
INSERT INTO "shipments" VALUES(510,860,'0823015505','2001-08-14 07:33:47-07');
INSERT INTO "shipments" VALUES(593,476,'0694003611','2001-08-15 11:57:40-07');
INSERT INTO "shipments" VALUES(599,430,'0929605942','2001-08-10 08:29:42-07');
INSERT INTO "shipments" VALUES(652,724,'1885418035','2001-08-14 13:41:39-07');
INSERT INTO "shipments" VALUES(660,409,'0451457994','2001-08-07 11:56:42-07');
INSERT INTO "shipments" VALUES(662,655,'0679803335','2001-08-09 07:30:07-07');
INSERT INTO "shipments" VALUES(720,107,'0394800753','2001-08-08 10:46:13-07');
INSERT INTO "shipments" VALUES(749,172,'0694003611','2001-08-11 10:52:34-07');
INSERT INTO "shipments" VALUES(754,107,'0394800753','2001-08-11 09:55:05-07');
INSERT INTO "shipments" VALUES(806,1125,'0760720002','2001-08-05 09:34:04-07');
INSERT INTO "shipments" VALUES(813,112,'0385121679','2001-08-08 09:53:46-07');
INSERT INTO "shipments" VALUES(871,388,'1885418035','2001-08-07 11:31:57-07');
INSERT INTO "shipments" VALUES(969,488,'0441172717','2001-08-14 08:42:58-07');
INSERT INTO "shipments" VALUES(977,853,'0679803335','2001-08-09 09:30:46-07');
INSERT INTO "shipments" VALUES(981,652,'0451160916','2001-08-08 08:36:44-07');
INSERT INTO "shipments" VALUES(997,185,'039480001X','2001-08-10 13:47:52-07');
INSERT INTO "shipments" VALUES(998,1045,'0590445065','2001-08-12 12:09:47-07');
INSERT INTO "shipments" VALUES(999,221,'0451160916','2001-08-14 13:45:51-07');
INSERT INTO "shipments" VALUES(1000,221,'039480001X','2001-09-14 16:46:32-07');
INSERT INTO "shipments" VALUES(1001,107,'039480001X','2001-09-14 17:42:22-07');
INSERT INTO "shipments" VALUES(1002,107,'0394800753','2001-09-22 11:23:28-07');
INSERT INTO "shipments" VALUES(1337,107,'0451160916','2001-09-22 20:58:56-07');
INSERT INTO "shipments" VALUES(1338,107,'0596000855','2001-08-11 09:55:05-07');
COMMIT;
