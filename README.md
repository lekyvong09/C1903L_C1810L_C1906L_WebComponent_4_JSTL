# public_JavaEE_WebComponent_4_JSTL
create database world;
use world;
CREATE TABLE world.city (
id INT NOT NULL AUTO_INCREMENT,
name NVARCHAR(250) NULL,
countryCode NVARCHAR(250) NULL,
country NVARCHAR(250) NULL,
population INT NULL,
PRIMARY KEY (id));

use world;
insert into city(name,CountryCode,Country,Population) values ('Tokyo','JPN','Japan',37435191);
insert into city(name,CountryCode,Country,Population) values ('Delhi','IND','India',29399141);
insert into city(name,CountryCode,Country,Population) values ('Shanghai','CHN','China',26317104);
insert into city(name,CountryCode,Country,Population) values ('Sao Paulo','BRA','Brazil',21846507);
insert into city(name,CountryCode,Country,Population) values ('Mexico City','MEX','Mexico',21671908);
insert into city(name,CountryCode,Country,Population) values ('Cairo','EGY','Egypt',20484965);
insert into city(name,CountryCode,Country,Population) values ('Dhaka','BGD','Bangladesh',20283552);
insert into city(name,CountryCode,Country,Population) values ('Mumbai','IND','India',20185064);
insert into city(name,CountryCode,Country,Population) values ('Beijing','CHN','China',20035455);
insert into city(name,CountryCode,Country,Population) values ('Osaka','JPN','Japan',19222665);
insert into city(name,CountryCode,Country,Population) values ('Ho Chi Minh City','VNM','Vietnam',8837544);
insert into city(name,CountryCode,Country,Population) values ('Hanoi','VNM','Vietnam',4874982);



use world;
CREATE TABLE world.country (
Id int(11) NOT NULL AUTO_INCREMENT,
Code NVARCHAR(250) DEFAULT NULL,
Name NVARCHAR(250) DEFAULT NULL,
Population INT NULL,
Density INT NULL,
PRIMARY KEY (Id));

use world;
insert into country(Code,Name,Population,Density) values ('CHN','China',1439323776,153);
insert into country(Code,Name,Population,Density) values ('IND','India',1380004385,464);
insert into country(Code,Name,Population,Density) values ('USA','United States',331002651,36);
insert into country(Code,Name,Population,Density) values ('IDN','Indonesia',273523615,151);
insert into country(Code,Name,Population,Density) values ('PAK','Pakistan',220892340,287);
insert into country(Code,Name,Population,Density) values ('BRA','Brazil',212559417,25);
insert into country(Code,Name,Population,Density) values ('NGA','Nigeria',206139589,226);
insert into country(Code,Name,Population,Density) values ('BGD','Bangladesh',164689383,1265);
insert into country(Code,Name,Population,Density) values ('RUS','Russia',145934462,9);
insert into country(Code,Name,Population,Density) values ('MEX','Mexico',128932753,66);
insert into country(Code,Name,Population,Density) values ('JPN','Japan',126476461,347);
insert into country(Code,Name,Population,Density) values ('VNM','Vietnam',97338579,314);


use world;
CREATE TABLE Users (
id int(11) not null auto_increment,
uid VARCHAR(250) NOT NULL,
email VARCHAR(250) NOT NULL,
password VARCHAR(512) NOT NULL,
authlevel INT NULL DEFAULT 0,
countryCode NVARCHAR(250) DEFAULT NULL,
PRIMARY KEY (id));


use world;
CREATE TABLE world.webUser (
uid VARCHAR(250) NOT NULL,
password VARCHAR(512) NOT NULL,
authlevel INT NULL DEFAULT 0,
PRIMARY KEY (uid));

use world;
insert into webUser(uid,password,authlevel) values ('ray','password',2);
