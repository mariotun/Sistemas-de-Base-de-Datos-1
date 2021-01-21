
-- ********************************************* CREACION DEL MODELO RELACIONAL ********************************************************

CREATE TABLE IF NOT EXISTS Continente (
ID_Continente INT NOT NULL AUTO_INCREMENT,
Nombre_Continente VARCHAR(50) NOT NULL,
PRIMARY KEY (ID_Continente)
)ENGINE=InnoDB DEFAULT CHARACTER SET=UTF8MB4;


CREATE TABLE IF NOT EXISTS Region (
ID_Region INT NOT NULL AUTO_INCREMENT,
Nombre_Region VARCHAR(50) NOT NULL,
ID_Continente INT NULL,
PRIMARY KEY (ID_Region),
CONSTRAINT regionContinente
FOREIGN KEY (ID_Continente) REFERENCES Continente (ID_Continente)
ON DELETE NO ACTION
)ENGINE=InnoDB DEFAULT CHARACTER SET=UTF8MB4;


CREATE TABLE IF NOT EXISTS Pais (
ID_Pais INT NOT NULL AUTO_INCREMENT,
Nombre_Pais VARCHAR(50) NOT NULL,
Poblacion_Pais INT NOT NULL,
AreaKm2 INT NULL,
Capital VARCHAR(40) NOT NULL,
ID_Region INT,
PRIMARY KEY (ID_Pais),
CONSTRAINT regionPais
FOREIGN KEY (ID_Region) REFERENCES Region (ID_Region)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Frontera (
ID_Frontera INT NOT NULL AUTO_INCREMENT,
Norte VARCHAR(10),
Sur VARCHAR(10),
Este VARCHAR(10),
Oeste VARCHAR(10),
Nombre_Pais VARCHAR(50) NOT NULL,
Nombre_Pais_Frontera VARCHAR(50) NOT NULL,
ID_Pais INT NOT NULL,
ID_Pais_Frontera INT NOT NULL,
PRIMARY KEY (ID_Frontera),
CONSTRAINT paisFrontera FOREIGN KEY (ID_Pais) REFERENCES Pais (ID_Pais)
ON DELETE NO ACTION,
CONSTRAINT paisFrontera2 FOREIGN KEY (ID_Pais_Frontera) REFERENCES Pais (ID_Pais)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;  


CREATE TABLE IF NOT EXISTS Inventor (
ID_Inventor INT NOT NULL AUTO_INCREMENT,
Nombre_Inventor VARCHAR(50) NOT NULL,
ID_Pais INT NOT NULL,
PRIMARY KEY (ID_Inventor),
CONSTRAINT paisInvento FOREIGN KEY (ID_Pais) REFERENCES Pais (ID_Pais)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Invento (
ID_Invento INT NOT NULL AUTO_INCREMENT,
Nombre_Invento VARCHAR(60) NOT NULL,
Anio_Invento INT NOT NULL,
PRIMARY KEY (ID_Invento)
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Inventado (
ID_Inventado INT NOT NULL AUTO_INCREMENT,
ID_Invento INT NOT NULL,
ID_Inventor INT NOT NULL,
PRIMARY KEY (ID_Inventado),
CONSTRAINT inventoInventado FOREIGN KEY (ID_Invento) REFERENCES Invento (ID_Invento)
ON DELETE NO ACTION,
CONSTRAINT inventorInventado FOREIGN KEY (ID_Inventor) REFERENCES Inventor (ID_Inventor)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Profesional (
ID_Profesional INT NOT NULL AUTO_INCREMENT,
Nombre_Profesional VARCHAR(60) NOT NULL,
Fecha_Contrato_Profesional DATE,
Salario INT NOT NULL,
Comision INT,
PRIMARY KEY (ID_Profesional)
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Area (
ID_Area INT NOT NULL AUTO_INCREMENT,
Nombre_Area VARCHAR(60),
Ranking INT NOT NULL,
ID_Profesional INT NOT NULL,
PRIMARY KEY (ID_Area),
CONSTRAINT jefeArea FOREIGN KEY (ID_Profesional) REFERENCES Profesional (ID_Profesional)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Profesional_Area (
ID_Profesional_Area INT NOT NULL AUTO_INCREMENT,
ID_Area INT NOT NULL,
ID_Profesional INT NOT NULL,
PRIMARY KEY (ID_Profesional_Area),
CONSTRAINT areaProfesionalArea FOREIGN KEY (ID_Area) REFERENCES Area (ID_Area)
ON DELETE NO ACTION,
CONSTRAINT profesionalProfesionalArea FOREIGN KEY (ID_Profesional) REFERENCES Profesional (ID_Profesional)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Asigna_Invento (
ID_Asigna_Invento INT NOT NULL AUTO_INCREMENT,
ID_Profesional INT NOT NULL,
ID_Invento INT NOT NULL,
PRIMARY KEY (ID_Asigna_Invento),
CONSTRAINT profesionalAsignaInventoVFOREIGN KEY (ID_Profesional) REFERENCES Profesional (ID_Profesional)
ON DELETE NO ACTION,
CONSTRAINT inventoAsignaInvento FOREIGN KEY (ID_Invento) REFERENCES Invento (ID_Invento)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Encuesta (
ID_Encuesta INT NOT NULL AUTO_INCREMENT,
Nombre_Encuesta VARCHAR(80) NOT NULL,
PRIMARY KEY (ID_Encuesta)
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Pregunta (
ID_Pregunta INT NOT NULL AUTO_INCREMENT,
Pregunta TEXT NOT NULL,
ID_Encuesta INT NOT NULL,
PRIMARY KEY (ID_Pregunta),
CONSTRAINT encuestaPregunta FOREIGN KEY (ID_Encuesta) REFERENCES Encuesta (ID_Encuesta)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Respuesta_Correcta (
ID_Respuesta_Correcta INT NOT NULL AUTO_INCREMENT,
Respuesta_Correcta VARCHAR(122),
ID_Pregunta INT NOT NULL,
PRIMARY KEY (ID_Respuesta_Correcta),
CONSTRAINT preguntaRespuestaCOrrecta FOREIGN KEY (ID_Pregunta) REFERENCES Pregunta (ID_Pregunta)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Respuesta (
ID_Respuesta INT NOT NULL AUTO_INCREMENT,
Respuesta TEXT NOT NULL,
ID_Pregunta INT NOT NULL,
PRIMARY KEY (ID_Respuesta),
CONSTRAINT preguntaRespuesta FOREIGN KEY (ID_Pregunta) REFERENCES Pregunta (ID_Pregunta)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


CREATE TABLE IF NOT EXISTS Pais_Respuesta (
ID_Pais_Respuesta INT NOT NULL AUTO_INCREMENT,
Respuesta_Pais VARCHAR(10) NOT NULL,
ID_Pais INT NOT NULL,
ID_Respuesta INT NOT NULL,
PRIMARY KEY (ID_Pais_Respuesta),
CONSTRAINT paisPaisRespuesta FOREIGN KEY (ID_Pais) REFERENCES Pais (ID_Pais)
ON DELETE NO ACTION,
CONSTRAINT respuestaPaisRespuesta FOREIGN KEY (ID_Respuesta) REFERENCES Respuesta (ID_Respuesta)
ON DELETE NO ACTION
)ENGINE = InnoDB DEFAULT CHARACTER SET = UTF8MB4;


