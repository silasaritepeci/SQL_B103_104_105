--ALIASES
CREATE TABLE calisanlar (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO calisanlar VALUES(123456789, ‘Ali Can', ‘Istanbul'); 
INSERT INTO calisanlar VALUES(234567890, ‘Veli Cem', ‘Ankara'); 
INSERT INTO calisanlar VALUES(345678901, ‘Mine Bulut', ‘Izmir');

CREATE TABLE calisanlar1
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar VALUES(123456789, ‘Ali Can', ‘Istanbul');
INSERT INTO calisanlar VALUES(234567890, ‘Veli Cem', ‘Ankara');
INSERT INTO calisanlar VALUES(345678901, ‘Mine Bulut',‘Izmir');


--IS NULL CONDITION

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar

--Name sutununda null olan degerleri listeleyelim

SELECT name FROM insanlar WHERE name IS NULL


--Insanlar tablosunda sadece null olmayan degerleri listeleyiniz

SELECT name FROM insanlar WHERE name IS NOT NULL

--Insanlar tablosunda null deger almis verileri no name olarak degistiriniz
UPDATE insanlar
SET name='No Name'
WHERE name is null;

CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/


--Insanlar tablosundaki datalari adres’e gore siralayin
SELECT *FROM insanlar2 ORDER BY adres;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT *FROM insanlar2 WHERE isim='Mine' ORDER BY ssn;

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

SELECT * FROM insanlar WHERE soyisim='Bulut' ORDER BY 2
-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar ORDER BY ssn DESC;
-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar ORDER BY isim ASC, soyisim DESC;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız

/*
Eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız 
Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz
*/
SELECT isim,soyisim FROM insanlar ORDER BY LENGTH (soyisim) DESC;
-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH(isim||soyisim)
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))


-- GROUP BY KULLANIMI
CREATE TABLE manav
(
isim varchar(50),  
Urun_adi varchar(50),  
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav
delete from manav

--Isme gore alinan toplam urunleri listeleyiniz
SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim;

--Isme gore alinan toplam urunleri bulun ve urunleri büyükten küçüğe listeleyiniz
SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldığı_toplam_urun DESC;
 
-- Urun ismine gore urunu alan toplam kisi sayisi
SELECT urun_adi,count(isim) FROM manav
GROUP BY urun_adi;
SELECT isim,count(urun_adi) FROM manav
GROUP BY isim















































