Create table Mehsul
(
MehsulId serial primary key,
MehsulAd varchar(50) unique not null,
MehsulQiymet int not null,
MehsulGrupId serial
);

alter table Mehsul
alter column MehsulQiymet type numeric(5,2)

Create table Grup 
(
GrupId serial primary key,
GrupAd varchar(50)
);

Create table Isci 
(
IsciId serial primary key,
IsciAd varchar(50) unique not null,
IsciSoyad varchar(50) unique not null,
IsciAtaAd varchar(50) unique not null,
IsciTel int unique not null,
IsciVezifeId serial
);

alter table Isci 
alter column IsciTel type varchar(50)

Create table Stok
(
StokId serial primary key,
StokAd varchar(50) unique not null,
StokMehsulId serial,
StokMehsulSay int 
);

Alter table Stok 
add column 

Create table Vezife 
(
VezifeId serial primary key,
VezifeAd varchar(50) unique not null,
VezifeMaas int not null
);


Create table Istehsalci 
(
IstehsalciId serial primary key,
IstehsalciAd varchar(50) unique not null,
IstehsalciTel int unique not null
);

alter table Istehsalci
alter column IstehsalciTel type varchar(50)

Create table Musteri
(
MusteriId serial primary key,
MesteriAd varchar(50) unique not null,
MusteriSoyad varchar(50) unique not null,
MusteriAtaAd varchar(50) unique not null,
MusteriUnvan varchar(150) not null,
MusteriTel int unique not null,
MusteriEpoct varchar(50) unique not null
);

alter table Musteri
alter column MusteriTel type varchar(50)

alter table Musteri
alter column MusteriEpoct type varchar(150)

Create table Satis 
(
SatisIs serial primary key,
SatisMehsulId serial,
SatisIsciId serial,
SatisStokId serial,
SatisIstehsalciId serial,
SatisMusteriId serial,
SatisTarix date not null,
SatisMehsulSay int not null,
SatisUmumiMebleg int not null
);


alter table Mehsul
add constraint FC_Grup foreign key (MehsulGrupId) references Grup(GrupId) on delete cascade on update cascade

alter table Stok
add constraint FC_StMehsul foreign key (StokMehsulId) references Mehsul(MehsulId) on delete cascade on update cascade

alter table Isci
add constraint FC_IsVezife foreign key (IsciVezifeId) references Vezife(VezifeId) on delete cascade on update cascade

alter table Satis
add constraint FC_SaMehsul foreign key (SatisMehsulId) references Mehsul(MehsulId) on delete cascade on update cascade 

alter table Satis
add constraint FC_SaIsci foreign key (SatisIsciId) references Isci(IsciId) on delete cascade on update cascade 

alter table Satis
add constraint FC_SaMusteri foreign key (SatisMusteriId) references Musteri(MusteriId) on delete cascade on update cascade 

alter table Satis
add constraint FC_SaStok foreign key (SatisStokId) references Stok(StokId) on delete cascade on update cascade

alter table Satis
add constraint FC_SaIstehsalci foreign key (SatisIstehsalciId) references Istehsalci(IstehsalciId) on delete cascade on update cascade 


Select*from Mehsul
insert into Mehsul
values ( 1,'Aspirin',4.09,1),
(2,'Parasetamol',0.15,1),
(3,'Vitamin C',29.40,2),
(4,'Vitamin D',28.40,2),
(5,'La Rosche-Posay Kerium',52.9,3),
(6,'Berdoues 1902 edc Tonique Odekalon',30.9,3),
(7,'Qlükometr "Beuer" GL44',39.9,4),
(8,'Sensolite Nova',18.6,4),
(9,'"Swiss Energy" Omega3',26.3,6),
(10,'Süd içkisi "Mamako 3"',12.20,6),
(11,'Pulsoksimetr',94.90,7),
(12,'Hava nəmləndirici aromatizator',109.9,7);



Select*from Grup
insert into Grup 
values (1,'Xəstəliklər üçün'),
(2,'Vitamin və minerallar'),
(3,'Kozmetik məhsullar'),
(4,'Medikal avadanlıqlar'),
(5,'Xidmətlər'),
(6,'Gıda əlavələri'),
(7,'Kafedra tələbləri');


Select*from Istehsalci
insert into Istehsalci
values (1,'Teva','+49 (0)731 402 - 02'),
(2,'Pfizer','+49 (0) 30 / 55 00 55-51000'),
(3,'Beurer','+49 (0) 30 / 87 24 30-91630'),
(4,'Sanofi','(012) 437 16 48'),
(5,'AstraZeneca','0800 22 88 660');


Select*from Vezife 
insert into Vezife 
values (1,'Müdir',3200),
(2,'Satış agenti',900),
(3,'Məhsul idarəçisi',1200),
(4,'Məhsul alma agenti ',1100),
(5,'Məlumat üzrə işçi',1300),
(6,'Kuryer',800),
(7,'Finans mütəxəssisi',2500),
(8,'Anbar işçisi',850),
(9,'Təchizatçı',1250);


Select*from Stok
insert into Stok
values (1,'Aspirin',1,200),
(2,'Aromatizator',12,300),
(3,'Qlükometr',7,150),
(4,'Pulsoksimetr',11,250),
(5,'Vitamin D',4,100),
(6,'Vitamin C',3,200);


Select*from Isci
insert into Isci
values (1,'Zeynəb','Qəmbərova','Məhərrəm','050 635 42 76',8),
(2,'Elnarə','Mustafayeva','Mahmud','055 249 73 29',5),
(3,'Seyidəli','Qasımov','Müşviq','070 437 28 90',1),
(4,'Pərvin','Süleymanzadə','Qəzənfər','077 647 82 71',9),
(5,'Əminə','İsmayılova','Teymur','051 729 74 30',3),
(6,'Muxtar','Musayev','Pərviz','055 923 64 38',7),
(7,'Cavanşir','Rüstəmov','Qiyas','050 387 63 45',6),
(8,'Murad','Hüseynli','Nazim','070 983 48 10',4),
(9,'Tamara','Hüseynova','Müslüm','077 189 53 81',2),
(10,'Hüseyn','Cəbiyev','Nizam','055 729 82 01',6),
(11,'Rəqsanə','Həşimov','Mehdi','070 811 84 37',6),
(12,'Ayxan','Məmmədov','Rəşad','077 637 29 29',6),
(13,'Nəzrin','Quliyeva','Hikmət','051 762 62 71',6);


Select*from Musteri
insert into Musteri 
values (1,'Aytac','Xudiyeva','Hikmət','H.Əliyev 15','050 675 53 82','aytacxudiyeva@gmail.com'),
(2,'Sədan','İbayeva','Rüstəm','Q.Musabəyov 56','055 436 78 62','sedanibayeva@gmail.com'),
(3,'Mehriban','Məmmmədşahlı','Rasim','Xanlar 89','070 982 36 87','mehimemmedsahli@gmail.com'),
(4,'Ramazan','Seyidov','Rəşad','R.Axundov 5A','077 526 89 90','ramazanseyidov@gmail.com'),
(5,'Cavid','Cəfərzadə','Mətin','M.Əzizbəyov 29','055 325 91 03','cavidceferzade@gmail.com'),
(6,'Rəvan','Qasımov','Faiq','S.Bünyadov','051 672 97 37','revanqasimov@gmail.com'),
(7,'Aminə','Nəsirova','Kazım','M.M.Xəzani 17','055 887 64 04','nesirovamine@gmail.com'),
(8,'Cuma','Arixov','Fikrət','P.Həşimov 34','051 245 72 88','arixovcuma@gmail.com'),
(9,'Elvar','Ağamalıyev','Elçin','D.Bünyətzadə 4','070 833 49 60','elvaragamaliyev@gmail.com'),
(10,'Yeganə','Hüseynova','Mikayıl','Q.Qarayev 21','070 912 67 83','huseynovayegane@gmail.com'),
(11,'Muhamməd','Ağayev','İkram','D.Ağamalıyev 19A','050 822 39 01','agayevmuhammad@gmail.com'),
(12,'Nərmin','Məmmədova','Nizam','T.Osmanlı 7B','077 835 67 22','mammadovanarmin@gmail.com');


Select*from Satis
insert into Satis
values (1,1,10,1,1,1,'12.03.2023',2,8.18),
(2,12,11,2,3,2,'15.04.2023',1,109.9),
(3,7,12,3,2,5,'01.03.2023',1,39.9),
(4,11,7,4,4,7,'10.04.2023',1,94.9),
(5,4,13,5,5,8,'11.01.2023',1,28.4),
(6,3,12,6,1,10,'13.04.2023',1,29.4),
(7,1,7,1,2,12,'25.02.2023',3,12.12),
(8,12,12,2,3,9,'30.01.2023',1,109.9),
(9,7,10,3,4,3,'31.03.2023',1,39.9),
(10,11,7,4,5,4,'05.02.2023',1,94.9),
(11,4,10,5,5,11,'09.02.2023',1,28.4),
(12,3,11,6,2,6,'22.03.2023',1,29.4),
(13,1,12,1,1,1,'19.04.2023',3,12.12),
(14,12,13,2,4,5,'04.01.2023',1,109.9),
(15,7,11,3,3,10,'17.02.2023',1,39.9);


-----------------------------------------------------------------------------------------------------
create table Meneger 
( MenegerId int primary key,
 MenegerAd varchar(50),
 MenegerSoyad varchar(50),
 MenegerIsciId int,
 foreign key ( MenegerIsciId) references Meneger(MenegerId) 
)


select*from Meneger 
insert into Meneger
values (1,'Aysun','Ağazadə',NULL),
 (2,'Seyid','Qasımov',1), 
 (3,'Muxtar','Musayev',1),
 (4,'Tamara','Hüseynova',2), 
 (5,'Aytac','Xudiyeva',3); 

Select c.MenegerAd || ' ' || c.MenegerSoyad,
d.MenegerAd || ' ' || d.MenegerSoyad from Meneger c
left join Meneger d on c.MenegerId=d.MenegerIsciId 


drop table Meneger 

-----------------------------------------------------------------------------------------------------

Select*from Mehsul
right join Grup on Mehsul.MehsulGrupId=Grup.GrupId

Select*from Isci 
full join Vezife on Isci.IsciVezifeId=Vezife.VezifeId 

Select*from Satis
inner join Mehsul on Satis.SatisMehsulIs=Mehsul.MehsulId
inner join Isci on Satis.SatisIsciIs=Isci.IsciId
inner join Stok on Satis.SatisStokIs=Stok.StokId
inner join Istehsalci on Satis.SatisIstehsalciIs=Istehsalci.IstehsalciId
inner join Musteri on Satis.SatisMusteriIs=Musteri.MusteriId

Select*from Stok
left join Mehsul on Stok.StokMehsulId=Mehsul.MehsulId
------------------------------------------------------------------------------------

Select*from Vezife where VezifeMaas>=1000 and VezifeAd='Müdir'
 
Select*from Vezife where VezifeMaas<=1000 and not VezifeAd='Kuryer'

Select*from Vezife where VezifeMaas<=1000 or VezifeAd='Müdir'

Select*from Mehsul limit 5

Select distinct VezifeAd from Vezife

Select*from Vezife Order by VezifeMaas desc

Select count(*)StokMehsulSay from Stok Group by StokAd

Select MehsulId from Mehsul Group by MehsulId

Select MehsulId, Sum(MehsulQiymet) from Mehsul Group by MehsulId

Select MehsulId, Sum(MehsulQiymet) from Mehsul Group by MehsulId Order by Sum(MehsulQiymet) asc
																			  
Select IsciId,Count(IsciAd) from Isci Group by IsciId		
																			  
Select Max(VezifeMaas)from Vezife 
 																			  
Select Avg(MehsulQiymet)from Mehsul																		  

Select GrupId, Sum(MehsulQiymet) from Mehsul
inner join Grup on Mehsul.MehsulGrupId=Grup.GrupId Group by GrupId Order by Sum(MehsulQiymet) desc

Select SatisIs, SatisIsciId, Sum(SatisMehsulSay) from Satis Group by SatisIs,SatisIsciId

Select SatisIs, SatisIsciId, Sum(SatisMehsulSay) from Satis Group by SatisIs,SatisIsciId Order by SatisIs asc

Select SatisIs, date(SatisTarix) from Satis Group by SatisIs

Select sum(SatisUmumiMebleg), date(SatisTarix) from Satis Group by date(SatisTarix) 

Select SatisIs, Sum(SatisUmumiMebleg) from Satis Group by SatisIs Having Sum(SatisUmumiMebleg)>30
------------------------------------------------------------------------------------------------------

Select IsciAd, IsciSoyad, IsciAtaAd from Isci
union
Select MesteriAd, MusteriSoyad, MusteriAtaAd from Musteri

Select IsciAd, IsciSoyad, IsciAtaAd from Isci
union all
Select MesteriAd, MusteriSoyad, MusteriAtaAd from Musteri

Select IsciAtaAd from Isci
intersect
Select MusteriAtaAd from Musteri

Select IsciAd, IsciSoyad, IsciAtaAd from Isci
except
Select MesteriAd, MusteriSoyad, MusteriAtaAd from Musteri
																			  
Select SatisIs,SatisIsciId,Sum(SatisUmumiMebleg)from Satis 
Group by Grouping sets( (SatisIs,SatisIsciId),(SatisIs),(SatisIsciId),())	
																			  
Select SatisIs, SatisMehsulSay, Sum(SatisUmumiMebleg) from Satis Group by SatisIs,  Rollup(SatisMehsulSay)

-------------------------------------------------------------------------------------------																			  

Select*from Vezife where VezifeMaas>(Select avg(VezifeMaas) from Vezife)

Select IsciId,IsciAd,IsciSoyad from Isci where IsciId in 
(Select VezifeId from Vezife inner join Isci on Vezife.VezifeId=Isci.IsciId where VezifeId=6) 	
																			  
Select IsciAd,IsciSoyad from Isci where exists (Select 1 from Vezife where Vezife.VezifeId=Isci.IsciId)	
																			  
Select MehsulAd from Mehsul where MehsulQiymet>any(Select avg(SatisUmumiMebleg)from Satis)
																			  
Select MehsulAd from Mehsul where MehsulQiymet>all(Select avg(SatisUmumiMebleg)from Satis)
																			  
Select IsciAd, IsciSoyad from Isci where IsciVezifeId=any(select count(IsciVezifeId) from Isci)	
																			  
Select MehsulAd from Mehsul where MehsulId = any (Select StokId from Stok where StokId<4)
																			  
--------------------------------------------------------------------------------------------------

Create Procedure Mehsulİnsert (MehsulId int,MehsulAd varchar,MehsulQiymet int ,MehsulGrupId int)
language plpgsql as $$ begin 
insert into Mehsul values (MehsulId,MehsulAd,MehsulQiymet,MehsulGrupId);
end; $$		
	
Call Mehsulİnsert (13,'Valerian',2,1)	
Select*from Mehsul

																			  
Create Procedure VezifeMaasArtimi (VId int)
language plpgsql as $$ begin 
Update Vezife set VezifeMaas=VezifeMaas + VezifeMaas*0.05 
where VId=Vezife.VezifeId;
end; $$	
																			  
call VezifeMaasArtimi(4)	
Select*from Vezife																			  
																		  																			  
/*
Create Procedure IsciMaasArtimi (IsciId int)
language plpgsql as $$ begin 
Select*from Isci 
inner join Vezife on Isci.IsciVezifeId=Vezife.VezifeId;																		  
Update Vezife set VezifeMaas=VezifeMaas + VezifeMaas*0.05 where IsciId;
end; $$	
drop procedure IsciMaasArtimi 
*/		
																			  
																		  
-----------------------------------------------------------------------------------------------------																			  
																			  
Create View IsinTeskili as
Select Isci.IsciAd, Isci.IsciSoyad, Vezife.VezifeAd, Vezife.VezifeMaas																		  
from Isci																			  
Inner Join Vezife on Isci.IsciVezifeId=Vezife.VezifeId 																			  
															
Select*from IsinTeskili				

------------
Create View SatisHesabati as
Select Satis.SatisIs, Satis.SatisTarix,Satis.SatisUmumiMebleg, Satis.SatisMehsulSay,Musteri.MesteriAd,
Musteri.MusteriSoyad,Isci.IsciAd, IsciSoyad, Mehsul.MehsulAd, Mehsul.MehsulQiymet
from Satis
inner join Mehsul on Satis.SatisMehsulId=Mehsul.MehsulId
inner join Isci on Satis.SatisIsciId=Isci.IsciId
inner join Musteri on Satis.SatisMusteriId=Musteri.MusteriId

Select*from SatisHesabati

------------
																	  
Create or Replace Function Func_SatisAlgoritmi()
Returns Trigger as $$ begin
    Update Stok
    set StokMehsulSay = StokMehsulSay - NEW.SatisMehsulSay where StokMehsulId = NEW.SatisMehsulId;
 return NEW;
end;
$$ language plpgsql;
Create Trigger Trig_SatisAlgoritmi
after Insert on  Satis
For each Row
Execute Function Func_SatisAlgoritmi()


Select*from Satis
insert into Satis
values (17,2,10,1,1,8,'08.05.2023',1,4.09)
Select*from Stok
																			  
-------------																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
																			  
									
																			  