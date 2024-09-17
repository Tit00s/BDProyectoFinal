insert into Eclesiarquia
(Num_Imperial, Orden)
values
('57845346581081', 'Santa Trina'),
('87426584421352', 'Santo Emperador'),
('47841354874593' ,'Santa Sanctorum'),
('97841264781574', 'Santa Terra'),
('978413457819605' ,'Santa Lorna');


insert into Orden_De_Asesinos
(Cabeza_de_caza,Estilo,Eclesiarquia)
values
('648754721349481', 'Sigilo','Santa Trina'),
('978454316184952', 'Sigilo', 'Santa Sanctorum'),
('984561894898843', 'Relampago', 'Santa Terra'),
('849845421584954', 'Francotirador', 'Santo Emperador'),
('156517894526155', 'Berserker', 'Santa Lorna'),
('465656123171686', 'Relampago','Santa Trina'),
('987984561235497', 'Sigilo', 'Santa Sanctorum'),
('798757948949478', 'Asedio', 'Santa Terra'),
('795465187985469', 'Sigilo', 'Santo Emperador'),
('879784543125710', 'Relampago', 'Santa Lorna');



insert into Asesinos
(Num_Asesino, Tipo_Arma,Orden_de_Asesinos)
values
('89849849879771', 'Cuchillo','648754721349481'),
('84985232564872', 'Daga', '978454316184952'),
('78763161948573', 'Bolter', '984561894898843'),
('78763164587944', 'Francotirador', '849845421584954'),
('87654148954975', 'Espadon', '156517894526155'),
('98795498798496', 'Bolter','465656123171686'),
('64512754849177', 'Veneno', '987984561235497'),
('63857415849768', 'Escudo', '798757948949478'),
('51346798174989', 'Daga', '795465187985469'),
('51376481971610', 'Bolter', '879784543125710');



insert into Inquisicion
(Num_Inquisidor, Tipo_Arma, Armadura, Eclesiarquia)
values
('978464781967811', 'Caliz','MK1','Santa Lorna'),
('689479617977772', 'Feretro','Exterminador', 'Santa Lorna'),
('987546215797893', 'Feretro','MK1', 'Santa Trina'),
('978461357971814', 'Bolter ligero', null ,'Santa Sanctorum'),
('987546216548945', 'Caliz','Exterminador', 'Santa Sanctorum'),
('159753468491986', 'Caliz','MK1','Santa Trina'),
('799846516549877', 'Feretro',null, 'Santa Lorna'),
('765951486148948', 'Bolter',null, 'Santo Emperador'),
('789854984984889', 'Bolter ligero','MK1', 'Santa Terra'),
('987456135795410', 'Caliz','MK1', 'Santa Trina');


insert into Enemigo
(ADN_Especie, Armas)
values
('HUM','Atomicas'),
('NEC','Laser'),
('ELD','Psciquicas'),
('ORK','Primitivas'),
('TYR','Primitivas'),
('TAU','Disformes'),
('VOT','Atomicas');


insert into Planeta
(ID_planeta, Sistema_Solar)
values
('798498498798491', 'Terra'),
('798498179198472', 'Andromeda'),
('798498984879873' ,'Cadia'),
('798798498419514', 'Ultramar'),
('987643161785175' ,'Ultramar'),
('315467948181976' ,'Caliban'),
('798498198198197' ,'Baal'),
('789849519878988' ,'Caliban'),
('643151975463169' ,'Baal'),
('312154649815110' ,'Terra');

insert into Planeta_Enemigo
(ID_planeta, Recursos_Basicos)
values
('798498198198197', 'Carne'),
('798498179198472', 'Ceramita'),
('643151975463169' ,'Uruk'),
('798798498419514', 'Arena'),
('987643161785175' ,'Carne');



insert into  Defender
(NUM_Inquisidor, ADN_Especie, ID_planeta)
values
('978464781967811', 'VOT','798498498798491'),
('689479617977772', 'HUM','798798498419514'),
('987546215797893', 'TYR','643151975463169'),
('978461357971814', 'TYR','798498179198472'),
('987546216548945', 'NEC','798498179198472'),
('987546216548945', 'VOT','987643161785175'),
('765951486148948', 'TAU','312154649815110'),
('978464781967811', 'HUM','643151975463169'),
('987456135795410', 'HUM','798498498798491'),
('689479617977772', 'ORK','798498498798491');






insert into Primarca
(Nombre,Talento,Color_Armadura)
values
('Alpharius','Invisibilidad','Azul celeste'),
('Perturabo','Creacion','Gris'),
('Magnus','Sabiduria','Azul oscuro'),
('Mortarion','Muerte','Verde'),
('Fulgrim','Vida','Morado'),
('Sanguinius','Justicia','Dorado'),
('Corvus corax','Teletransporte','Negro'),
('Jaghatai khan','Velocidad','Blanco'),
('Konrad kurze','Letalidad','Negro y azul'),
('Robute Guilliman','Gestion','Azul ultramar');


insert into  Legion
(Nombre, Color_Legion, Nombre_Prim)
values
('Angeles de sangre','Dorado', 'Sanguinius'),
('Manos de hierro','Gris', 'Perturabo'),
('Ultramarinos','Azul ultramar', 'Robute Guilliman'),
('Guardia del cuervo','Negro', 'Corvus corax'),
('Rayos blancos','Blanco', 'Jaghatai khan'),
('Hijos del emperador','Morado', 'Fulgrim'),
('Guardia de la muerte','Verde', 'Mortarion'),
('Faraones','Azul oscuro', 'Magnus'),
('Hydra','Azul celeste', 'Alpharius'),
('Cuervos oscuros','Negro mate', null);



insert into Marine_Espacial
(Tipo_de_Servoarmadura,Color_Armadura,Nom_Legion,Nombre_Prim)
values
('MK1','Dorada','Angeles de sangre','Sanguinius'),
('Ceramita','Gris','Manos de hierro','Perturabo'),
('Ultra','Azul ultramar','Ultramarinos','Robute Guilliman'),
('MK','Negro','Guardia del cuervo','Corvus corax'),
('MK3','Blanco','Rayos blancos','Jaghatai khan'),
('MK5','Morado','Hijos del emperador','Fulgrim'),
('MK2','Verde','Guardia de la muerte','Mortarion'),
('Imperial','Azul oscuro','Faraones','Magnus'),
('Honoris','Azul celeste','Hydra','Alpharius'),
('MK0','Negro mate','Cuervos oscuros',null);

INSERT INTO Planeta_Aliado (ID_planeta, Marine_Espacial)
VALUES
('798498498798491', 'MK1'),
('798498984879873','MK2') ,
('789849519878988','MK0') ,
('312154649815110','Honoris') ,
('315467948181976','Ceramita');


insert into Pertenecer
(Tipo_de_Servoarmadura,ID_planeta)
values
('Honoris','312154649815110'),
('MK1','798498498798491'),
('Ceramita','315467948181976'),
('MK0','789849519878988'),
('MK2','798498984879873');


insert into Arma
(Nombre, Tamaño)
values
('Exterminatus','Atomico'),
('Sonoritas','Gigante'),
('Bolter','Grande'),
('Raygun','Estandar'),
('Bolter ligero','Ligero');



insert into Tener
(Nombre, Tipo_de_Servoarmadura)
values
('Sonoritas','MK0'),
('Bolter','Imperial'),
('Bolter ligero','Honoris'),
('Raygun','Honoris'),
('Exterminatus','MK');



insert into Pelea
(Nombre,Tipo_de_Servoarmadura,ADN_Especie)
values
('Sonoritas','MK0','TYR'),
('Exterminatus','MK','ORK'),
('Bolter','Imperial','NEC'),
('Bolter ligero','MK1','TAU'),
('Bolter ligero','MK1','TYR'),
('Sonoritas','Ceramita','HUM'),
('Bolter ligero','MK1','HUM'),
('Raygun','MK2','TAU'),
('Sonoritas','MK0','ELD'),
('Exterminatus','MK','TYR')
