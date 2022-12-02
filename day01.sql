--DDL -DATA DEFINITION LANG.
--CREATE -TABLO OLUSTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real, --ondalikli sayilar kullanilir (Double gibi)
kayit_tarih date	

);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA 
CREATE TABLE ogrenci_notlari
AS --benzer tablodaki basliklarla ve data tipleri ile yeni bir tablo olusturmak icin normal tablo olusturuken ki parantezler
--yerine AS kullanip almak istedigimiz verileri aliriz
SELECT isim,soyisim,not_ort FROM ogrenciler2;

--DML - DATA MANUPULATION LANG.
--INSERT (data veri ekleme)

INSERT INTO ogrenciler2 VALUES ('1234567','Said','ILHAN',85.5,now());

--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK 

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('Sila','Saritepeci');

--DQL -DATA QUERY LANG. 
--SELECT

select * FROM ogrenciler2;







