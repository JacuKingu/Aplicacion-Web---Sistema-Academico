-- Base de datos Academico - solo para uso academico
-- Hugo Espetia
-- 2024

use master
go
--------------------------------------------------------------------------------------------
if DB_ID('BDAcademico') is not null
   drop database BDAcademico
go
create database BDAcademico
go
--------------------------------------------------------------------------------------------
use BDAcademico
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TEscuela','U') is not null
	drop table  TEscuela
go 
create table TEscuela
(
	CodEscuela 		char(3) not null,
	Nombre 	varchar (50) not null,
	primary key (CodEscuela)
)  
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TUsuario','U') is not null
	drop table  TUsuario
go 
create table TUsuario
(
	CodUsuario  varchar(50),
	Contrasena	varbinary(8000),
	primary key (CodUsuario)
)  
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TAlumno','U') is not null
	drop table  TAlumno
go 
create table TAlumno
(
	CodAlumno	 	char (5) not null,
	APaterno 	varchar (50) not null,
	AMaterno 	varchar (50) not null,
	Nombres 	varchar (50) not null,
	CodUsuario     varchar (50) unique not null,
	CodEscuela 	char (3)not null,
	primary key 	(CodAlumno),
	foreign key 	(CodUsuario) references TUsuario,
	foreign key     (CodEscuela) references TEscuela
)
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TAsignatura','U') is not null
	drop table  TAsignatura
go 
create table TAsignatura(
	CodAsignatura	 	char(3) not null,
	Nombre 	varchar(50) not null,
	CodRequisito 	char(3),
	primary key 	(CodAsignatura),
	foreign key	(CodRequisito) references TAsignatura  
)
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TDocente','U') is not null
	drop table  TDocente
go 
create table TDocente(
	CodDocente	 	char (3) not null,
	APaterno 	varchar (50) not null,
	AMaterno 	varchar (50) not null,
	Nombres 	varchar (50) not null,
	CodUsuario     varchar (50) unique not null,	
	primary key 	(CodDocente),  
	foreign key(CodUsuario) references TUsuario
)
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TCarga','U') is not null
	drop table  TCarga
go 
create table TCarga
(
	IdCarga		  	int not null,
	CodDocente 	char (3) not null,
	CodAsignatura 	char (3)  not null,
	Semestre 	varchar(20) not null,
	primary key 	(IdCarga),
	foreign key 	(CodDocente) references TDocente,
	foreign key 	(CodAsignatura) references TAsignatura
)
go
--------------------------------------------------------------------------------------------
if OBJECT_ID('TNota','U') is not null
	drop table  TNota
go 
create table TNota(
	CodAlumno 	char (5) not null,
	CodAsignatura 	char (3) not null,
	Semestre 	varchar (20) not null,
	Parcial1 		decimal(4,2),
	Parcial2 		decimal (4,2),
	NotaFinal 		decimal (4,2),
	primary key 	(CodAlumno, CodAsignatura, Semestre),
	foreign key 	(CodAlumno) references TAlumno,
	foreign key 	(CodAsignatura) references TAsignatura
)
go


--------------------------------------------------------------------------------------------
--insercion de carrera
insert into TEscuela Values ('C01','Ingenier�a de Sistemas')
insert into TEscuela values ('C02','Ingenier�a Industrial')
insert into TEscuela values ('C03','Ingenier�a Civil')
go


-- insercion de usuarios alumnos
insert into TUsuario values ('cuellar@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('velasquez@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('miranda@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('alvarez@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('becerra@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('zuniga@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('rodriguez@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('osorio@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('vasquez@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('mamani@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('espellivar@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('razuri@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('velazco@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('ortiz@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('quispe@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('aranzibia@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('palomino@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('marca@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('altuve@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('tica@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('flores@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('olivares@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('esquivel@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('antunez@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('chacon@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('daza@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('alquiper@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('dallas@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('oporto@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values ('danino@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))

--insercion de Alumno 
insert into TAlumno values ('A0001','Cuellar', 'Vasques','Leonardo','cuellar@hotmail.com','C01')
insert into TAlumno values ('A0002','Velasquez','Saldivar', 'Miguel','velasquez@hotmail.com','C01')
insert into TAlumno values ('A0003','Miranda','Perez','Yesica','miranda@hotmail.com','C01')
insert into TAlumno values ('A0004','Alvarez','Guzman','Maria','alvarez@hotmail.com','C01')
insert into TAlumno values ('A0005','Becerra', 'Quispe','Juan Carlos','becerra@hotmail.com','C01')
insert into TAlumno values ('A0006','Zuniga', 'Lopez', 'Alicia','zuniga@hotmail.com','C01')
insert into TAlumno values ('A0007','Rodriguez','Mamani', 'Renato','rodriguez@hotmail.com','C01')
insert into TAlumno values ('A0008','Osorio', 'Vasques','Leonardo','osorio@hotmail.com','C01')
insert into TAlumno values ('A0009','Vasquez','Saldivar', 'Miguel','vasquez@hotmail.com','C01')
insert into TAlumno values ('A0010','Mamani','Perez','Yesica','mamani@hotmail.com','C01')
insert into TAlumno values ('A0011','Espellivar','Guzman','Maria','espellivar@hotmail.com','C02')
insert into TAlumno values ('A0012','Razuri', 'Quispe','Juan Carlos','razuri@hotmail.com','C02')
insert into TAlumno values ('A0013','Velazco', 'Lopez', 'Alicia','velazco@hotmail.com','C02')
insert into TAlumno values ('A0014','Ortiz','Mamani', 'Renato','ortiz@hotmail.com','C02')
insert into TAlumno values ('A0015','Quispe', 'Triveno','Leonardo','quispe@hotmail.com','C02')
insert into TAlumno values ('A0016','Arancibia','Saldivar', 'Miguel','aranzibia@hotmail.com','C02')
insert into TAlumno values ('A0017','Palomino','Perez','Yesica','palomino@hotmail.com','C02')
insert into TAlumno values ('A0018','Marca','Guzman','Maria','marca@hotmail.com','C02')
insert into TAlumno values ('A0019','Altuve', 'Quispe','Juan Carlos','altuve@hotmail.com','C02')
insert into TAlumno values ('A0020','Tica', 'Lopez', 'Alicia','tica@hotmail.com','C03')
insert into TAlumno values ('A0021','Flores','Mamani', 'Renato','flores@hotmail.com','C03')
insert into TAlumno values ('A0022','Olivares', 'Vasques','Leonardo','olivares@hotmail.com','C03')
insert into TAlumno values ('A0023','Esquivel','Saldivar', 'Miguel','esquivel@hotmail.com','C03')
insert into TAlumno values ('A0024','Antunez','Perez','Yesica','antunez@hotmail.com','C03')
insert into TAlumno values ('A0025','Chacon','Guzman','Maria','chacon@hotmail.com','C03')
insert into TAlumno values ('A0026','Daza', 'Quispe','Juan Carlos','daza@hotmail.com','C03')
insert into TAlumno values ('A0027','Alquiper', 'Lopez', 'Alicia','alquiper@hotmail.com','C03')
insert into TAlumno values ('A0028','Dallas','Mamani', 'Renato','dallas@hotmail.com','C03')
insert into TAlumno values ('A0029','Oporto', 'Vasques','Leonardo','oporto@hotmail.com','C03')
insert into TAlumno values ('A0030','Danino','Saldivar', 'Miguel','danino@hotmail.com','C03')
go

--insercion de asignatura
insert into TAsignatura values  ('S01','Matematica I',Null)
insert into TAsignatura values  ('S02','Algoritmica I',Null)
insert into TAsignatura values  ('S03','Informatica Basica',Null)
insert into TAsignatura values  ('S04','Redaccion',Null)
insert into TAsignatura values  ('S05','Matematica II','S01')
insert into TAsignatura values  ('S06','Algoritmica II','S02')
insert into TAsignatura values  ('S07','Base de Datos I','S03')
insert into TAsignatura values  ('S08','Web I','S03')
insert into TAsignatura values  ('S09','Matematica III','S05')
insert into TAsignatura values  ('S10','Estructura de Datos','S06')
insert into TAsignatura values  ('S11','Base de Datos II','S07')
insert into TAsignatura values  ('S12','Web II','S08')
insert into TAsignatura values  ('S13','Centros de Computo','S10')
insert into TAsignatura values  ('S14','Inteligencia Artificial','S10')
insert into TAsignatura values  ('S15','Web III','S12')
insert into TAsignatura values  ('S16','Sistemas Distribuidos','S12')
insert into TAsignatura values  ('S17','Desarrollo de SW','S16')
insert into TAsignatura values  ('S18','Metodologias','S14')
insert into TAsignatura values  ('S19','Analisis y Diseno de Sistemas','S13')
insert into TAsignatura values  ('S20','Practicas I','S19')
insert into TAsignatura values  ('S21','Practicas II','S20')
go

-- insercion de usuarios docentes
insert into TUsuario values('admin',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values('mnina@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values('jarredondo@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values('kcosio@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values('cmedrano@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values('lserrano@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values('ilavilla@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
insert into TUsuario values('apalomino@hotmail.com',ENCRYPTBYPASSPHRASE('miFraseDeContrase�a', '1234'))
go

--insercion docente
insert into TDocente values  ('D01','Alcazar','Bustamante', 'Julio Cesar','admin')
insert into TDocente values  ('D02','Nina', 'Perez', 'Miguel','mnina@hotmail.com')
insert into TDocente values  ('D03','Arredondo', 'Altamirano', 'Jesus','jarredondo@hotmail.com')
insert into TDocente values  ('D04','Cosio', 'Valle', 'Kelma','kcosio@hotmail.com')
insert into TDocente values  ('D05','Medrano', 'Ibarra', 'Carmen','cmedrano@hotmail.com')
insert into TDocente values  ('D06','Serrano', 'Monge', 'Lilian','lserrano@hotmail.com')
insert into TDocente values  ('D07','La Villa', 'Mesa' ,'Ivan','ilavilla@hotmail.com')
insert into TDocente values  ('D08','Palomino', 'Uscachi' ,'Ariadna','apalomino@hotmail.com')
go

--insercion carga
insert into TCarga values  (1,'D01','S01','2010-I')
insert into TCarga values  (2,'D02','S02','2010-I')
insert into TCarga values  (3,'D03','S03','2010-I')
insert into TCarga values  (4,'D04','S04','2010-I')
insert into TCarga values  (5,'D05','S05','2010-II')
insert into TCarga values  (6,'D06','S06','2010-II')
insert into TCarga values  (7,'D07','S07','2010-II')
insert into TCarga values  (8,'D08','S08','2010-II')
insert into TCarga values  (9,'D01','S09','2011-I')
insert into TCarga values  (10,'D02','S10','2011-I')
insert into TCarga values  (11,'D03','S11','2011-I')
insert into TCarga values  (12,'D04','S12','2011-I')
insert into TCarga values  (13,'D05','S13','2011-II')
insert into TCarga values  (14,'D06','S14','2011-II')
insert into TCarga values  (15,'D07','S15','2011-II')
insert into TCarga values  (16,'D08','S16','2011-II')
go

--insercion Notas
insert into TNota values  ('A0001','S01','2010-I',18,12,14)
insert into TNota values  ('A0001','S02','2010-I',10,12,12)
insert into TNota values  ('A0001','S03','2010-I',14,12,1)
insert into TNota values  ('A0001','S04','2010-I',12,17,12)

insert into TNota values  ('A0002','S01','2010-I',14,12,14)
insert into TNota values  ('A0002','S02','2010-I',16,11,12)
insert into TNota values  ('A0002','S03','2010-I',14,12,14)
insert into TNota values  ('A0002','S04','2010-I',12,7,12)

insert into TNota values  ('A0003','S01','2010-I',8,15,14)
insert into TNota values  ('A0003','S02','2010-I',14,12,12)
insert into TNota values  ('A0003','S03','2010-I',14,12,17)
insert into TNota values  ('A0003','S04','2010-I',12,17,12)

insert into TNota values  ('A0004','S01','2010-I',18,12,14)
insert into TNota values  ('A0004','S02','2010-I',11,2,12)
insert into TNota values  ('A0004','S03','2010-I',4,12,1)
insert into TNota values  ('A0004','S04','2010-I',2,7,12)

insert into TNota values  ('A0005','S01','2010-I',8,2,14)
insert into TNota values  ('A0005','S02','2010-I',10,12,12)
insert into TNota values  ('A0005','S03','2010-I',15,14,16)
insert into TNota values  ('A0005','S04','2010-I',12,17,12)

insert into TNota values  ('A0006','S01','2010-I',18,12,14)
insert into TNota values  ('A0006','S02','2010-I',14,12,12)
insert into TNota values  ('A0006','S03','2010-I',14,12,17)
insert into TNota values  ('A0006','S04','2010-I',12,20,20)

insert into TNota values  ('A0007','S01','2010-I',8,12,14)
insert into TNota values  ('A0007','S02','2010-I',10,15,12)
insert into TNota values  ('A0007','S03','2010-I',14,12,18)
insert into TNota values  ('A0007','S04','2010-I',12,7,12)

go

insert into TNota values  ('A0001','S05','2010-II',18,12,14)
insert into TNota values  ('A0001','S06','2010-II',10,12,12)
insert into TNota values  ('A0001','S07','2010-II',14,12,1)
insert into TNota values  ('A0001','S08','2010-II',12,17,12)

insert into TNota values  ('A0002','S05','2010-II',14,12,14)
insert into TNota values  ('A0002','S06','2010-II',16,11,12)
insert into TNota values  ('A0002','S07','2010-II',14,12,14)
insert into TNota values  ('A0002','S08','2010-II',12,7,12)

insert into TNota values  ('A0003','S05','2010-II',8,15,14)
insert into TNota values  ('A0003','S06','2010-II',14,12,12)
insert into TNota values  ('A0003','S07','2010-II',14,12,17)
insert into TNota values  ('A0003','S08','2010-II',12,17,12)

insert into TNota values  ('A0004','S05','2010-II',18,12,14)
insert into TNota values  ('A0004','S06','2010-II',11,2,12)
insert into TNota values  ('A0004','S07','2010-II',4,12,1)
insert into TNota values  ('A0004','S08','2010-II',2,7,12)

insert into TNota values  ('A0005','S05','2010-II',8,2,14)
insert into TNota values  ('A0005','S06','2010-II',10,12,12)
insert into TNota values  ('A0005','S07','2010-II',15,14,16)
insert into TNota values  ('A0005','S08','2010-II',12,17,12)

insert into TNota values  ('A0006','S05','2010-II',18,12,14)
insert into TNota values  ('A0006','S06','2010-II',14,12,12)
insert into TNota values  ('A0006','S07','2010-II',14,12,17)
insert into TNota values  ('A0006','S08','2010-II',12,20,20)

insert into TNota values  ('A0007','S05','2010-II',8,12,14)
insert into TNota values  ('A0007','S06','2010-II',10,15,12)
insert into TNota values  ('A0007','S07','2010-II',14,12,18)
insert into TNota values  ('A0007','S08','2010-II',12,7,12)
go

-- Autorizar diagrama de base de datos
Alter authorization on database::BDAcademico to sa
go

select * from TUsuario
go

select * from TEscuela
go

select * from TAlumno
go

select * from TCarga
go
