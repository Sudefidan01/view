--View
--View'lar sorguları basitleştirmek , erişim izinlerini düzenlemek , farklı sunuculardaki eşdeğer verileri karşılaştırmak veya bazı durumlarda sorgu süresini kusaltmak için kullanılan , gerçekte olmayan 'Select' ifadeleri için tanımlanmış olan sanal tablolardır

--İçerisinde veri bulunmaz , sadece tabloların görünümlerinden ibarettir

-- * İsimsiz Kolon Bırakılmaz
-- * Herhangi bir parametre yollanmaz
-- * Insert , Update , Delete işlemi uygulanmaz
-- * Subquery yöntemi ile sorgulama yapılamaz
-- * Order BY kullanılmaz

--View yapısının 3 farklı kullanımı mevcuttur
--	1-Create View
--	2-Alter View
--	3-Drop View

--	1-Create View
--Yeni bir sanal tablo oluşturmak için kullanılır

--Syntax
--Create view <viewAdı> as <sqlSorgusu>
Use NORTHWND
--Örnek
--Alman Müşterileri getiren bir View oluşturalım
create view AlmanMusteriler as 
select * 
from Customers
where Country='Germany'

select * from AlmanMusteriler order by CompanyName 

--Oluşturduğumuz View'ları Database içerisinde Views Klasöründe görebiliriz
--Oluşturulan Viewları Select etmek için standart Select işlemi kullanılır

--Oluşturduğumuz view içerisinde ünvanı yönteici olanları listeleyelim (manager)

select
	CompanyName,ContactName,ContactTitle
from AlmanMusteriler
where ContactTitle like '%manager%'
order by ContactName asc


--	2-Alter View
--Oluşturulan View içerisindeki Sql sorgusunu değiştirir

--Syntax 
--Alter View <viewAdı> as <sqlSorgusu>

--Örnek
--Alman müşteriler view tablosunu güncelleyelim
alter view  AlmanMusteriler
as
	select
	CompanyName,ContactName,ContactTitle,Country
from Customers
where Country='Germany'

select * from AlmanMusteriler

--Drop View
--Mevcut View ' i silmek için kullanılır

--Syntax
--Drop View <viewAdı>

drop view AlmanMusteriler