--カテゴリテーブルのデータ初期データ
INSERT INTO categories (category_id, category_name) VALUES (default,'帽子');
INSERT INTO categories (category_id, category_name) VALUES (default,'鞄');

--カラーテーブルのデータ初期データ
INSERT INTO colors (color_id, color_name) VALUES (default,'金色');
INSERT INTO colors (color_id, color_name) VALUES (default,'黒色');
INSERT INTO colors (color_id, color_name) VALUES (default,'茶色');

--会員テーブルの初期データ
--password(tarou111)
INSERT INTO members (member_id, password, member_name, address, is_withdrawal) VALUES ('Tarou@ec.com','03f044b670d4fa5c06544b3120ae7ac13d98da962396a6907741f3ed12117687','太郎','東京都渋谷区1-1-1',default);
--password(hanako222)
INSERT INTO members (member_id, password, member_name, address, is_withdrawal) VALUES ('Hanako@ec.com','edbbe43789981853482f12a24ee557d99c166947368be7e9f69504ee45965b28','花子','東京都練馬区2-2-2',default);
--password(len333)
INSERT INTO members (member_id, password, member_name, address, is_withdrawal) VALUES ('Len@ec.com','34f42475ede8ba1bb9772d79d0ba388447b16b56b81caea9e15a0d4e5b54a00a','蓮','東京都千代田区3-3-3',default);

--商品テーブルの初期データ
INSERT INTO items (item_name, color_id, manufacturer, price, stock, category_id, recommended) VALUES ('おうかん',1,'ロイヤル商店',20000,10,1,default);
INSERT INTO items (item_name, color_id, manufacturer, price, stock, category_id, recommended) VALUES ('おおきな帽子',1,'ノーマル商店',4000,250,1,default);
INSERT INTO items (item_name, color_id, manufacturer, price, stock, category_id, recommended) VALUES ('良質なトランク',2,'ロイヤル商店',15600,20,2,TRUE);
INSERT INTO items (item_name, color_id, manufacturer, price, stock, category_id, recommended) VALUES ('怪しい鞄',2,'怪しいお店',250,66,2,default);

SELECT * FROM categories;
SELECT * FROM members;
SELECT * FROM items;
