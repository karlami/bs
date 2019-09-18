CREATE TABLE IF NOT EXISTS Especie(
  IdEspecie INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  Nombre TEXT NOT NULL,
  NombreCientifico TEXT NOT NULL,
  Descripcion TEXT NOT NULL,
  IdZona INTEGER NOT NULL,
  FOREIGN KEY(IdZona) REFERENCES Zona(IdZona);
);


CREATE TABLE IF NOT EXISTS Habitat(
  IdHabitat INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  Nombre TEXT NOT NULL,
  Clima TEXT NOT NULL,
  TipoVegetacion TEXT NOT NULL,
  Continente TEXT NOT NULL
  
);

CREATE TABLE IF NOT EXISTS Continente(
  IdContinente INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  Nombre TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS HabitatContinente(
  IdHabitat INTEGER NOT NULL,
  IdContinente INTEGER NOT NULL,
  FOREIGN KEY(IdContinente) REFERENCES Continente (IdContinente),
  FOREIGN KEY(IdHabitat) REFERENCES Habitat (IdHabitat)
);

CREATE TABLE IF NOT EXISTS Zona(
  IdZona INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  Nombre TEXT NOT NULL,
  Extension InTEGER NOT NULL
  
);

CREATE TABLE IF NOT EXISTS HabitatZona(
  IdHabitat INTEGER NOT NULL,
  IdZona INTEGER NOT NULL,
  FOREIGN KEY(IdHabitat) REFERENCES Habitat (IdHabitat),
  FOREIGN KEY(IdZona) REFERENCES Zona (IdZona)
);
 
 
CREATE TABLE IF NOT EXISTS Itinerario(
  IdItinerario INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  Codigo TEXT NOT NULL,
  DuracionRecorrido INTEGER NOT NULL,
  LongitudItinerario INTEGER NOT NULL,
  NumVisitantes INTEGER NOT NULL
 
);

CREATE TABLE IF NOT EXISTS ZonaItinerario(
  IdHabitat INTEGER NOT NULL,
  IdZona INTEGER NOT NULL,
  FOREIGN KEY(IdHabitat) REFERENCES Habitat (IdHabitat),
  FOREIGN KEY(IdZona) REFERENCES Zona (IdZona)
);


CREATE TABLE IF NOT EXISTS Empleado(
  IdEmpleado INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  Nombre TEXT NOT NULL,
  Direccion TEXT NOT NULL,
  Telefono TEXT NULL NOT NULL
  
);


CREATE TABLE IF NOT EXISTS Empleado_Guia(
  IdEmpleado INTEGER NOT NULL,
  IdItinerario INTEGER NOT NULL,
  FechaIngreso DATE NOT NULL,
  HoraItinerario TIME NOT NULL,
  FOREIGN KEY(IdEmpleado) REFERENCES Empleado (IdEmpleado),
  FOREIGN KEY(IdItinerario) REFERENCES Itinerario (IdItinerario)

);

CREATE TABLE IF NOT EXISTS Empleado_Cuidador(
  IdEmpleado INTEGER NOT NULL,
  IdEspecie INTEGER NOT NULL,
  FechaIngreso DATE NOT NULL,
  FechaCuidadoEspecie DATE NOT NULL,
  FOREIGN KEY(IdEmpleado) REFERENCES Empleado (IdEmpleado),
  FOREIGN KEY(IdEspecie) REFERENCES Especie (IdEspecie)
);


-- INSERT INTO Especie(IdEspecie, Nombre, NombreCientifico,Descripcion,IdZona) VALUES
-- (1, 'GaviotaSombría', 'AlbertEinstein', 'Aaaaaaaaaaa',1),
-- (2, 'CorrelimosComún', 'AlbertEinstein', 'Bbbbbbbbbbb',2),
-- (3, 'GaviotaReidora', 'AlbertEinstein', 'Cccccccccccc',3),
-- (4, 'CormoránGrande', 'AlbertEinstein', 'Dddddddddd',4);

-- SELECT * FROM Itinerario;


-- INSERT INTO HabitatZona(IdHabitat, IdZona)
-- VALUES
-- (1, 1),
-- (2, 2),
-- (3, 3),
-- (4, 4);

-- INSERT INTO Itinerario(IdItinerario,Codigo,DuracionRecorrido,LongitudItinerario,NumVisitantes) VALUES
-- (1, 'AAA1212', 1000,10,14),
-- (2, 'AAA1313', 2000,36,54),
-- (3, 'AAA1414', 1548,25,69),
-- (4, 'AAA1515', 6458,36,36);

-- INSERT Into Empleado_Cuidador(IdEmpleado, IdEspecie, FechaIngreso, FechaCuidadoEspecie)
-- VALUES
-- (1,20,'2005-12-23','2005-12-31'),
-- (2,7,'2012-02-05','2014-6-31'),
-- (3,18,'2001-9-11','2010-12-08'),
-- (4,9,'2013-5-3','2019-8-2');

-- INSERT INTO Zona(IdZona, Nombre,Extension) VALUES
-- (1, 'Tropical', 1000),
-- (2, 'Bosque', 2000),
-- (3, 'Tropical', 1548),
-- (4, 'Bosque', 6458);

-- INSERT INTO Empleado_Guia(IdEmpleado,IdItinerario,FechaIngreso,HoraItinerario)
-- VALUES 
-- (6,8,'2005-12-23','8:20:55'),
-- (7,3,'2005-12-23','9:45:27'),
-- (8,1,'2005-12-23','12:55:06'),
-- (9,2,'2005-12-23','4:30:45');

-- INSERT INTO Empleado(IdEmpleado, Nombre, Direccion, Telefono)
-- VALUES 
-- (1,'Carlos','Guapiles-limon-pococí',86452770),
-- (2,'Miguel','siquirres-san jose-pococí',88256396),
-- (3,'Karla','Heredia',70257852),
-- (4,'Andrea','Cartago centro',61869954),
-- (5,'Juan','Turrialba',78785236),
-- (6,'lola','Isla grande',40302487),
-- (7,'ester','Managua',60105896),
-- (8,'job','Sambito',88294556),
-- (9,'Genesis','Guanacaste',12345678);                        

SELECT IdEmpleado, Nombre, Direccion,Telefono FROM Empleado;
SELECT * FROM Empleado;

SELECT * FROM Especie;

SELECT Empleado.Nombre 
FROM Empleado
INNER JOIN Empleado_Guia ON Empleado.IdEmpleado = Empleado_Guia.IdEmpleado
INNER JOIN Empleado_Cuidador ON Empleado.IdEmpleado = Empleado_Cuidador.IdEmpleado;