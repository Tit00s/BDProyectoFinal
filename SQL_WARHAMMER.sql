
--Consultas simples
	--1) Devulveme toda la informacion de todos los primarcas
		select * 
		from Primarca


	--2) Devuelveme el nombre de la legion que no tiene Primarca
		select nombre
		from legion
		where Nombre_prim is null



	--3)Devulveme toda la informacion de los marines espaciales que formen parte de la legion "Angeles de sangre"
		select *
		from marine_espacial
		where lower(nom_legion) ='angeles de sangre'

	--4)Devulveme el color de armadura de los marines que tengan el tipo de armadura MK
		select color_armadura
		from marine_espacial
		where lower(tipo_de_servoarmadura) like '%mk%'

	--5)Devuelve el numero de inquisidor que sean de "Santa Trina" o usen un Caliz
		Select num_inquisidor
		from Inquisicion
		where lower(eclesiarquia) ='santa trina' or lower(tipo_arma) ='caliz'


--Update y alter



	--Update 1) Ponle a la legion que no tiene un primarca el nombre del Primarca Konrad Kurze

		update Marine_Espacial
		set Nombre_Prim = 'Konrad kurze' 
		where Nombre_Prim is null
	--Update 2) Actualiza la tabla inquisicion y ponle aramadura de ceramita a los que no tengan

		update Inquisicion
		set Armadura ='Ceramita'
		where Armadura is null

	--Alter table 1) Cambiale el nombre a la tabla Legion y ponle Legiones

		Alter table Legion
		Rename to Legiones
		

	
	--Alter table 1)Elimina todos los estilos de los asesinos
		Alter table Orden_de_asesinos
		Drop Estilo

--Consultas con mas de una tabla


	--1)Devuelve el color de la armadura de los Marines que vienen de un planeta aliado

		select Color_Armadura
		From Marine_Espacial, Planeta_Aliado
		where Marine_Espacial = Tipo_de_servoarmadura

	--2)Devuelveme el nombre de los Primarcas que sus legiones visten de azul

		select Primarca.nombre
		from Primarca
		join legion on legion.Nombre_Prim = Primarca.nombre
		where lower(color_legion) like '%azul%'



	--3)Devuelveme el id de los planetas enemigos y sus recursos basicos que formen parte del sistema Baal

		select planeta_enemigo.ID_planeta, Recursos_basicos
		from Planeta_enemigo
		Join Planeta  on Planeta_enemigo.ID_planeta = planeta.ID_planeta
		where lower(Sistema_solar) = 'baal'

--Consultas con funciones
	--1)Devuelveme el numero total de armas que hay
		select count(nombre) as Armas_totales
		from Arma
	--2) Devuelveme el numero de  peleas en las que se hayan usando bolters
		select count(Nombre) as Bolter
		from Pelea
		where lower(nombre) like '%bolter%'
	--3)Devuelveme el numero de veces que se hayan usado armas de tamaño atomico contra Tyranidos
		select count(ADN_Especie) as TYR
		from Pelea
		join Arma on pelea.nombre = arma.nombre
		where lower(arma.tamaño) = 'atomico' and lower(ADN_Especie) = 'tyr'
--Consultas con group by
	--1) Devuelvme el nombre de las ordenes de la Eclesiarquia, junto a su numero total de asesinos, agrupalo por la orden a la que pertenecen
		select orden, count(Cabeza_de_caza)as Asesinos
		from Eclesiarquia, Orden_de_asesinos
		where orden = Eclesiarquia
		Group by(Orden)
	--2) Devuelveme el nombre de los primarcas y sus respectivas legiones, y agrupa el nombre del primarca junto a su legion
		select Primarca.nombre,legion.nombre
		from primarca
		join Legion on Primarca.nombre = Nombre_Prim
		Group by(Primarca.nombre, legion.nombre)
--Subconsultas
	--1) Devulveme el nombre de la legion la cual su primarca tiene el talento de la invisibilidad 

		SELECT legion.nombre
		FROM Legion
		WHERE Nombre_prim = (Select nombre
					From Primarca
					Where lower(talento)='invisibilidad')
	--2)Devuelveme el adn de las especies que tengan armas laser
		SELECT ADN_Especie
		FROM Pelea
		WHERE ADN_Especie =(SELECT ADN_Especie
                     	FROM Enemigo
                     	WHERE lower(Armas) = 'laser');
--Consultas con Having

	--1)Devuelveme todas las armaduras que tengan menos de 3 ejemplares, agrupalos con sus numeros de ejemplares

		select Tipo_de_servoarmadura, count(Tipo_de_servoarmadura)
		from Marine_Espacial
		Group by(Tipo_de_servoarmadura)
		having count(Tipo_de_servoarmadura)<3
	--2)Devulveme el id de los planetas aliados, mas su tipo de marine espacial, pero solo de los sistemas que tengan 2 planetas.

		SELECT planeta.id_planeta, Marine_Espacial
		from Planeta
		join Planeta_aliado on planeta.id_planeta = planeta_aliado.id_planeta
		Group by(planeta.id_planeta,Marine_Espacial)
		having count(Sistema_solar) < 2

--Updates complejos
	--1) Cambia el talento del primarca cuya legion es de color Dorado y ponle que su Talento sea algo que gustes

		UPDATE Primarca
		SET Talento = 'Rapear'
		WHERE Color_Armadura = (SELECT Color_Legion
                        	FROM Legiones
                        	WHERE Color_Legion = 'Dorado');

	--2)Cambia la Tabla Primarca para que todos tengan el mismo color de Armadura que Alpharius

		Update  Primarca
		set Color_Armadura = (Select Color_Legion
					 	From Legiones
					 	Where lower(Nombre_Prim) = 'alpharius')



	--3) Cambia la tabla Asesinos poniendole las Armas de tamaño atomico, a aquellos que tengan un numero menor a 64512754849178.

	UPDATE Asesinos
	SET Tipo_Arma = (SELECT Nombre
                 FROM Arma
                 WHERE lower(tamaño) = 'atomico')
	WHERE num_asesino < '64512754849178';