DROP TABLE IF EXISTS members CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS carts CASCADE ;
DROP TABLE IF EXISTS purchases CASCADE;
DROP TABLE IF EXISTS purchase_details CASCADE;
DROP SEQUENCE IF EXISTS members_seq;
DROP SEQUENCE IF EXISTS categories_seq;
DROP SEQUENCE IF EXISTS items_seq;
DROP SEQUENCE IF EXISTS purchases_seq;

--カテゴリIDシーケンス
CREATE SEQUENCE categories_seq;
--会員番号シーケンス
CREATE SEQUENCE members_seq START 10;
--商品IDシーケンス
CREATE SEQUENCE items_seq;
--購入IDシーケンス
CREATE SEQUENCE purchases_seq;

--カテゴリテーブル
CREATE TABLE categories(
	category_id INTEGER PRIMARY KEY DEFAULT nextval('categories_seq'),
	category_name VARCHAR(135) NOT NULL
);

--会員テーブル
CREATE TABLE members(
	member_number INTEGER PRIMARY KEY DEFAULT nextval('members_seq'),
   	email VARCHAR(254) NOT NULL UNIQUE,
	password VARCHAR(64) NOT NULL,
	member_name VARCHAR(60) NOT NULL,
	address VARCHAR(180) NOT NULL,
	is_withdrawal BOOLEAN NOT NULL DEFAULT FALSE
);

--商品テーブル
CREATE TABLE items(
	item_id INTEGER PRIMARY KEY DEFAULT nextval('items_seq'),
	item_name VARCHAR(135) NOT NULL,
	color VARCHAR(20) NOT NULL,
	manufacturer VARCHAR(137) NOT NULL,
	price INTEGER NOT NULL,
	stock INTEGER NOT NULL DEFAULT 0,
	category_id INTEGER NOT NULL,
	recommended BOOLEAN NOT NULL DEFAULT FALSE,
	FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

--カートテーブル
CREATE TABLE carts(
	member_number INTEGER,
	item_id INTEGER,
	quantity INTEGER NOT NULL,
	FOREIGN KEY (member_number) REFERENCES members(member_number), 
	FOREIGN KEY (item_id) REFERENCES items(item_id), 
	PRIMARY KEY (member_number,item_id)
);

--	購入テーブル
CREATE TABLE purchases(
	purchase_id INTEGER PRIMARY KEY DEFAULT nextval('purchases_seq'),
	member_number INTEGER NOT NULL,
	purchase_date DATE NOT NULL,
	delivery_address VARCHAR(180) NOT NULL,
	payment VARCHAR(20) NOT NULL,
	cancel_flag BOOLEAN NOT NULL DEFAULT FALSE,
	cancel_date DATE DEFAULT NULL,
	FOREIGN KEY (member_number) REFERENCES members(member_number)
);

--購入詳細テーブル
CREATE TABLE purchase_details(
	purchase_id INTEGER,
	item_id INTEGER,
	quantity INTEGER NOT NULL,
	FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id), 
	FOREIGN KEY (item_id) REFERENCES items(item_id), 
	PRIMARY KEY (purchase_id,item_id)
);


