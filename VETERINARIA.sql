--Creacion tabla veterinaria
CREATE TABLE VETERINARIA(
ID_VETERINARIA NUMBER(3) CONSTRAINT PK_ID_VETERINARIA PRIMARY KEY,
TAMANO CHAR CONSTRAINT CK_TAMANO CHECK(TAMANO IN('G','M','P')),
SERVICIO VARCHAR2(30)
)

--Creacion tabla ubicacion
CREATE TABLE UBICACION(
ID_UBICACION NUMBER(2) CONSTRAINT PK_ID_UBICACION PRIMARY KEY,
ID_VETERINARIA NUMBER(3),
CIUDAD VARCHAR2(30),
ESTADO VARCHAR2(30)
)

--Asigancion de llaves foraneas
ALTER TABLE UBICACION ADD CONSTRAINT FK_ID_VET_UBICACION FOREIGN KEY (ID_VETERINARIA) REFERENCES VETERINARIA(ID_VETERINARIA)

--Creacion tabla due�o
CREATE TABLE DUENO(
ID_DUENO NUMBER(4) CONSTRAINT PK_ID_DUENO PRIMARY KEY,
NOMBRE VARCHAR(15),
APELLIDO1 VARCHAR(15),
APELLIDO2 VARCHAR(15),
DIRECCION VARCHAR(60),
TELEFONO VARCHAR2(15)
)

--Creacion tabla mascota
CREATE TABLE MASCOTA(
ID_MASCOTA NUMBER(1) CONSTRAINT PK_ID_MASCOTA PRIMARY KEY,
TIPO_MASCOTA VARCHAR2(15),
ID_DUENO NUMBER(4),
NOMBRE_MASCOTA VARCHAR2(10),
RAZA VARCHAR2(30)
)


--Asigancion de llaves foraneas
ALTER TABLE MASCOTA ADD CONSTRAINT FK_ID_DUENO_MASCOTA FOREIGN KEY(ID_DUENO) REFERENCES DUENO(ID_DUENO)

--Creacion tabla detalle mascota
CREATE TABLE DETALLE_MASCOTA(
ID_DETALLE_MASCOTA NUMBER(2) CONSTRAINT PK_ID_DETALLE_MASCOTA PRIMARY KEY,
ID_MASCOTA NUMBER(1),
EDAD VARCHAR2(10),
PESO VARCHAR2(10)
)

--Asigancion de llaves foraneas
ALTER TABLE DETALLE_MASCOTA ADD CONSTRAINT FK_ID_MASCOTA_DETALLE FOREIGN KEY(ID_MASCOTA) REFERENCES MASCOTA(ID_MASCOTA)

--Creacion tabla especialista
CREATE TABLE ESPECIALISTA(
ID_ESPECIALISTA NUMBER(5) CONSTRAINT PK_ID_ESPECIALISTA PRIMARY KEY,
ESPECIALIDAD VARCHAR2(40),
NOMBRE VARCHAR2(20),
APELLIDO1 VARCHAR2(20),
APELLIDO2 VARCHAR2(20),
TELEFONO VARCHAR2(15),
ID_VETERINARIA NUMBER(5)
)

--Asigancion de llaves foraneas
ALTER TABLE ESPECIALISTA ADD CONSTRAINT FK_ID_VET_ESPECIALISTA FOREIGN KEY (ID_VETERINARIA) REFERENCES VETERINARIA(ID_VETERINARIA)

--Creacion tabla detalle especialista
CREATE TABLE DETALLE_ESPECIALISTA(
ID_DETALLE_ESPECIALISTA NUMBER(5) CONSTRAINT PK_ID_DETALLE_ESPECIALISTA PRIMARY KEY,
ID_ESPECIALISTA NUMBER(5),
SALARIO NUMBER(35,0),
FECHA_CONTRATACION DATE
)

--Asigancion de llaves foraneas
ALTER TABLE DETALLE_ESPECIALISTA ADD CONSTRAINT FK_ID_ESPECIALISTA_DETALLE FOREIGN KEY (ID_ESPECIALISTA) REFERENCES ESPECIALISTA(ID_ESPECIALISTA)

--Creacion tabla medicamento
CREATE TABLE MEDICAMENTO(
ID_MEDICAMENTO NUMBER(5) CONSTRAINT PK_ID_MEDICAMENTO PRIMARY KEY,
NOMBRE VARCHAR2(30),
FECHA_CADUCIDAD DATE,
PRECIO NUMBER(35,0)
)

--Creacion tabla detalle medicamento
CREATE TABLE DETALLE_MEDICAMENTO(
ID_DETALLE_MEDICAMENTO NUMBER(5) CONSTRAINT PK_ID_DETALLE_MEDICAMENTO PRIMARY KEY,
ID_MEDICAMENTO NUMBER(5),
TIPO_MEDICAMENTO VARCHAR2(50),
HORARIO_DOSIS VARCHAR2(50)
)

--Asigancion de llaves foraneas
ALTER TABLE DETALLE_MEDICAMENTO ADD CONSTRAINT FK_ID_MED_DETALLE FOREIGN KEY (ID_MEDICAMENTO) REFERENCES MEDICAMENTO(ID_MEDICAMENTO)

--Creacion tabla cita
CREATE TABLE CITA(
ID_CITA NUMBER(5) CONSTRAINT PK_ID_CITA PRIMARY KEY,
ID_MASCOTA NUMBER(5),
ID_DUENO NUMBER(5),
ID_VETERINARIA NUMBER(5),
ID_ESPECIALISTA NUMBER(5),
RAZON_CITA VARCHAR2(40),
FECHA_CITA DATE,
ESTADO VARCHAR2(20)
)

--Asigancion de llaves foraneas
ALTER TABLE CITA ADD CONSTRAINT FK_ID_MASC_CITA FOREIGN KEY (ID_MASCOTA) REFERENCES MASCOTA(ID_MASCOTA);
ALTER TABLE CITA ADD CONSTRAINT FK_ID_DEUNO_CITA FOREIGN KEY (ID_DUENO) REFERENCES DUENO(ID_DUENO);
ALTER TABLE CITA ADD CONSTRAINT FK_ID_VET_CITA FOREIGN KEY (ID_VETERINARIA) REFERENCES VETERINARIA(ID_VETERINARIA);
ALTER TABLE CITA ADD CONSTRAINT FK_ID_ESP_CITA FOREIGN KEY (ID_ESPECIALISTA) REFERENCES ESPECIALISTA(ID_ESPECIALISTA);

--Creacion tabla vacuna
CREATE TABLE VACUNA(
ID_VACUNA NUMBER(5) CONSTRAINT PK_ID_VACUNA PRIMARY KEY,
NOMBRE VARCHAR2(20),
DESCRIPCION VARCHAR2(255),
FECHA_CADUCIDAD DATE,
PRECIO NUMBER(35)
)

--Creacion tabla enfermedad
CREATE TABLE ENFERMEDAD(
ID_ENFERMEDAD NUMBER(5) CONSTRAINT PK_ID_ENFERMEDAD PRIMARY KEY,
NOMBRE VARCHAR2(20),
DESCRIPCION VARCHAR2(255)
)

--Creacion tabla factura
CREATE TABLE FACTURA(
ID_FACTURA NUMBER(5) CONSTRAINT PK_ID_FACTURA PRIMARY KEY,
FECHA_FACTURA DATE,
DESCRIPCION VARCHAR2(40),
ID_DUENO NUMBER(5),
ID_VETERINARIA NUMBER(5),
SUB_TOTAL NUMBER(35,0)
)

--Asigancion de llaves foraneas
ALTER TABLE FACTURA ADD CONSTRAINT FK_ID_DEUNO_FACTURA FOREIGN KEY (ID_DUENO) REFERENCES DUENO(ID_DUENO);
ALTER TABLE FACTURA ADD CONSTRAINT FK_ID_VET_FACTURA FOREIGN KEY (ID_VETERINARIA) REFERENCES VETERINARIA(ID_VETERINARIA);

--Creacion tabla expediente
CREATE TABLE EXPEDIENTE(
ID_EXPEDIENTE NUMBER(5) CONSTRAINT ID_EXPEDIENTE PRIMARY KEY,
ID_CITA NUMBER(5),
ID_MASCOTA NUMBER(5),
ID_DUENO NUMBER(5),
ID_ESPECIALISTA NUMBER(5)
)

--Asigancion de llaves foraneas
ALTER TABLE EXPEDIENTE ADD CONSTRAINT FK_ID_CITA_EXPEDIENTE FOREIGN KEY (ID_CITA) REFERENCES CITA(ID_CITA);
ALTER TABLE EXPEDIENTE ADD CONSTRAINT FK_ID_MASCOTA_EXPEDIENTE FOREIGN KEY (ID_MASCOTA) REFERENCES MASCOTA(ID_MASCOTA);
ALTER TABLE EXPEDIENTE ADD CONSTRAINT FK_ID_DUENO_EXPEDIENTE FOREIGN KEY (ID_DUENO) REFERENCES DUENO(ID_DUENO);
ALTER TABLE EXPEDIENTE ADD CONSTRAINT FK_ID_ESPECIALISTA_EXPE FOREIGN KEY (ID_ESPECIALISTA) REFERENCES ESPECIALISTA(ID_ESPECIALISTA);

--Creacion tabla expediente de vacuna
CREATE TABLE EXPEDIENTE_VACUNA(
ID_EXP_VACUNA NUMBER(5) CONSTRAINT PK_ID_EXP_VACUNA PRIMARY KEY,
ID_EXPEDIENTE NUMBER(5),
ID_VACUNA NUMBER(5)
)

--Asigancion de llaves foraneas
ALTER TABLE EXPEDIENTE_VACUNA ADD CONSTRAINT FK_ID_EXPEDIENTE_EXPVACUNA FOREIGN KEY (ID_EXPEDIENTE) REFERENCES EXPEDIENTE(ID_EXPEDIENTE);
ALTER TABLE EXPEDIENTE_VACUNA ADD CONSTRAINT FK_ID_VACUNA_EXPVACUNA FOREIGN KEY (ID_VACUNA) REFERENCES VACUNA(ID_VACUNA);

--Creacion tabla expediente de enfermedad
CREATE TABLE EXPEDIENTE_ENFERMEDAD(
ID_EXP_ENFERMEDAD NUMBER(5) CONSTRAINT PK_ID_EXP_ENFERMEDAD PRIMARY KEY,
ID_EXPEDIENTE NUMBER(5),
ID_ENFERMEDAD NUMBER(5)
)

--Asigancion de llaves foraneas
ALTER TABLE EXPEDIENTE_ENFERMEDAD ADD CONSTRAINT FK_ID_EXPEDIENTE_EXPENFERMEDAD FOREIGN KEY (ID_EXPEDIENTE) REFERENCES EXPEDIENTE(ID_EXPEDIENTE);
ALTER TABLE EXPEDIENTE_ENFERMEDAD ADD CONSTRAINT FK_ID_ENFERMEDAD_EXPENFERMEDAD FOREIGN KEY (ID_ENFERMEDAD) REFERENCES ENFERMEDAD(ID_ENFERMEDAD);

--Creacion tabla expediente de medicamento
CREATE TABLE EXPEDIENTE_MEDICAMENTO(
ID_EXP_MEDICAMENTO NUMBER(5) CONSTRAINT PK_ID_EXP_MEDICAMENTO PRIMARY KEY,
ID_EXPEDIENTE NUMBER(5),
ID_MEDICAMENTO NUMBER(5)
)

--Asigancion de llaves foraneas
ALTER TABLE EXPEDIENTE_MEDICAMENTO ADD CONSTRAINT FK_ID_EXPEDIENTE_EXPMED FOREIGN KEY (ID_EXPEDIENTE) REFERENCES EXPEDIENTE(ID_EXPEDIENTE);
ALTER TABLE EXPEDIENTE_MEDICAMENTO ADD CONSTRAINT FK_ID_MEDICAMENTO_EXPMED FOREIGN KEY (ID_MEDICAMENTO) REFERENCES MEDICAMENTO(ID_MEDICAMENTO);
