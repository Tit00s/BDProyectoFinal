create table Eclesiarquia(

	Num_imperial varchar(15),
	Orden varchar(15),
	Unique(Orden),
	Primary key(Num_imperial));
	
create table Orden_de_Asesinos(

	Cabeza_de_caza varchar(15),
	Estilo varchar(15),
	Eclesiarquia varchar(15),
	Primary key(Cabeza_de_caza),
	Constraint FK_Orden_de_Asesinos Foreign key(Eclesiarquia) references ECLESIARQUIA(Orden));


create table Asesinos(

	Num_Asesino varchar(15),
	Tipo_Arma varchar(20),
	Orden_de_Asesinos varchar(15),
	Primary key(Num_Asesino),
	Constraint FK_Asesinos Foreign key(Orden_de_Asesinos) references ORDEN_DE_ASESINOS(Cabeza_de_caza)
);

Create table Inquisicion(

	Num_Inquisidor varchar(15),
	Tipo_Arma varchar(20),
	Armadura varchar(20),
	Eclesiarquia varchar(15),
	Primary key(Num_Inquisidor),
	Constraint FK_Inqusicion foreign key(Eclesiarquia) references ECLESIARQUIA(Orden));


create table Enemigo(
ADN_Especie varchar(10),
	Armas varchar(20),
	Primary key(ADN_Especie));

Create table Planeta(

	ID_planeta varchar(15),
	Sistema_Solar varchar(20),
	Primary key(Id_planeta));

Create table Planeta_Enemigo(
	ID_planeta varchar(15),
	Recursos_Basicos varchar(20),
	Primary key(Id_planeta),
	Constraint FK_Planeta_Enemigo Foreign key(ID_planeta) references Planeta(Id_planeta)
	
);

	

create table Defender(
		Num_Inquisidor varchar(15),
		ADN_Especie varchar(10),
		ID_planeta varchar(15),
		Primary key(Num_Inquisidor, ADN_Especie,ID_planeta),
		Constraint FK_Defender_INQ foreign key(Num_Inquisidor) references Inquisicion(Num_Inquisidor),
		Constraint FK_Defender_ADN foreign key(ADN_Especie) references Enemigo(ADN_Especie),
		Constraint FK_Defender_ID foreign key(ID_planeta) references Planeta(ID_planeta));


Create table Primarca(
	Nombre varchar(30),
	Talento varchar(20),
	Color_Armadura varchar(20),
	Primary key(Nombre)

);
Create table Legion(


	Nombre varchar(20),
	Color_Legion varchar(20),
	Nombre_Prim varchar(30),
	Primary key(Nombre),
	Constraint FK_Legion Foreign key(Nombre_Prim) references Primarca(Nombre)

);
CREATE TABLE Marine_Espacial(
    Tipo_de_Servoarmadura VARCHAR(10),
    Color_Armadura VARCHAR(20),
    Nom_Legion VARCHAR(20),
    Nombre_Prim VARCHAR(30),
	Unique(Tipo_de_Servoarmadura),
    PRIMARY KEY(Nom_Legion),
    CONSTRAINT FK_Legion_NOM FOREIGN KEY(Nom_Legion) REFERENCES Legion(Nombre),
    CONSTRAINT FK_Legion FOREIGN KEY(Nombre_Prim) REFERENCES Primarca(Nombre)
);

CREATE TABLE Planeta_Aliado(
    ID_planeta VARCHAR(15),
    Marine_Espacial VARCHAR(20),
    PRIMARY KEY(ID_planeta),
    CONSTRAINT FK_Planeta_Aliado FOREIGN KEY(ID_planeta) REFERENCES Planeta(ID_planeta),
    CONSTRAINT FK_Planeta_Aliado_ME FOREIGN KEY(Marine_Espacial) REFERENCES Marine_Espacial(Tipo_de_Servoarmadura));
Create table Pertenecer(

	Tipo_de_Servoarmadura varchar(20),
	ID_planeta varchar(15),
	Primary key(Tipo_de_Servoarmadura,ID_planeta),
	Constraint FK_Pertenecer Foreign key(Tipo_de_Servoarmadura) references Marine_Espacial(Tipo_de_Servoarmadura),
	Constraint FK_Pertenecer_PLN Foreign key(ID_planeta) references Planeta(ID_planeta)

);
Create table Arma(
	Nombre varchar(15),
	Tamaño varchar(15),
	Primary key(Nombre)
);
Create table Tener(
	Nombre varchar(15),
	Tipo_de_Servoarmadura varchar(20),
	Primary key(Nombre),
	constraint FK_Tener Foreign key(Nombre) references Arma(Nombre),
	Constraint FK_Tener_ARM Foreign key(Tipo_de_Servoarmadura) references Marine_Espacial(Tipo_de_Servoarmadura)
);
create table Pelea(
	Nombre varchar(15),
	Tipo_de_Servoarmadura varchar(20),
	ADN_Especie varchar(10),
	
	Primary key(Nombre, Tipo_de_Servoarmadura, ADN_Especie),
	Constraint FK_Pelea foreign key(Nombre) references Arma(Nombre),
	Constraint FK_Pelea_ARM foreign key(Tipo_de_Servoarmadura) references Marine_Espacial(Tipo_de_Servoarmadura),
	Constraint FK_Pelea_ADN foreign key(ADN_Especie) references Enemigo(ADN_Especie));

	