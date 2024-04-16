--Que muestre especialista, la veterinaria asignada y la ubicacion de la vetrinaria
SELECT E.NOMBRE,E.APELLIDO1,V.SERVICIO,U.CIUDAD,U.ESTADO FROM ESPECIALISTA E
LEFT JOIN VETERINARIA V
ON V.ID_VETERINARIA = E.ID_VETERINARIA
LEFT JOIN UBICACION U
ON U.ID_VETERINARIA = V.ID_VETERINARIA

--Mostrar cita, nombre de mascota, nombre de due�o y razon de cita
SELECT C.RAZON_CITA, M.NOMBRE_MASCOTA,D.NOMBRE DUENO, D.APELLIDO1 FROM CITA C
INNER JOIN MASCOTA M
ON M.ID_MASCOTA = C.ID_MASCOTA
INNER JOIN DUENO D
ON D.ID_DUENO = C.ID_DUENO

--Mostrar la factura, el nombre de dueno y el servicio adquirido
SELECT F.DESCRIPCION, D.NOMBRE, D.APELLIDO1, V.SERVICIO FROM FACTURA F
LEFT JOIN DUENO D
ON D.ID_DUENO = F.ID_DUENO
LEFT JOIN VETERINARIA V
ON V.ID_VETERINARIA = F.ID_VETERINARIA

--Mostrar el expediente, la razon de cita, el nombre de mascota y nombre de especialista
SELECT E.ID_EXPEDIENTE, C.RAZON_CITA,M.NOMBRE_MASCOTA,ES.NOMBRE ESPECIALISTA FROM EXPEDIENTE E
LEFT JOIN CITA C
ON C.ID_CITA = E.ID_CITA 
LEFT JOIN MASCOTA M
ON M.ID_MASCOTA = E.ID_MASCOTA
LEFT JOIN ESPECIALISTA ES
ON ES.ID_ESPECIALISTA = E.ID_ESPECIALISTA

--Mostar expediente de medicamentos, el id del medicamento, el nombre de medicamento y el tipo de medicamento
SELECT ID_EXP_MEDICAMENTO,M.ID_MEDICAMENTO,M.NOMBRE MEDICAMENTO,DM.TIPO_MEDICAMENTO  FROM EXPEDIENTE_MEDICAMENTO EM
LEFT JOIN MEDICAMENTO M
ON M.ID_MEDICAMENTO = EM.ID_MEDICAMENTO
LEFT JOIN DETALLE_MEDICAMENTO DM
ON DM.ID_MEDICAMENTO = EM.ID_MEDICAMENTO

--Mostrar especialista y sus citas sin asistencias
SELECT E.NOMBRE ESPECIALISTA, M.NOMBRE_MASCOTA,C.ESTADO, C.RAZON_CITA, C.FECHA_CITA FROM CITA C
RIGHT JOIN ESPECIALISTA E 
ON E.ID_ESPECIALISTA = C.ID_ESPECIALISTA
RIGHT JOIN MASCOTA M
ON M.ID_MASCOTA = C.ID_MASCOTA
WHERE C.ESTADO = 'Ausente'

--Mostrar que due�os tiene m�s de una mascota y la edad de la mascota
SELECT D.NOMBRE, COUNT(M.ID_MASCOTA) NUMERO_MASCOTA, DM.EDAD
FROM MASCOTA M
INNER JOIN DUENO D
ON M.ID_DUENO = D.ID_DUENO
INNER JOIN DETALLE_MASCOTA DM
ON DM.ID_MASCOTA = M.ID_MASCOTA
GROUP BY D.NOMBRE, DM.EDAD
HAVING COUNT(M.ID_MASCOTA) > 1

--Mostrar las mascotas que han sido vacunadas
SELECT E.ID_EXPEDIENTE,C.ID_CITA, EV.ID_EXP_VACUNA, M.NOMBRE_MASCOTA FROM EXPEDIENTE E
LEFT JOIN CITA C
ON C.ID_CITA = E.ID_CITA
LEFT JOIN EXPEDIENTE_VACUNA EV
ON EV.ID_EXPEDIENTE = E.ID_EXPEDIENTE
LEFT JOIN MASCOTA M
ON M.ID_MASCOTA = E.ID_MASCOTA
WHERE ID_EXP_VACUNA IS NOT NULL

--Mostrar expediente completo de mascota enferma
SELECT E.ID_EXPEDIENTE, EE.ID_EXP_ENFERMEDAD,EV.ID_EXP_VACUNA,EM.ID_EXP_MEDICAMENTO FROM EXPEDIENTE E
INNER JOIN EXPEDIENTE_ENFERMEDAD EE
ON EE.ID_EXPEDIENTE = E.ID_EXPEDIENTE
INNER JOIN EXPEDIENTE_VACUNA EV
ON EV.ID_EXPEDIENTE = E.ID_EXPEDIENTE
INNER JOIN EXPEDIENTE_MEDICAMENTO EM
ON EM.ID_EXPEDIENTE = E.ID_EXPEDIENTE

--Citas de todos los especialistas de estado presente
SELECT C.FECHA_CITA, E.NOMBRE ESPECIALISTA, V.SERVICIO FROM CITA C
LEFT JOIN ESPECIALISTA E
ON E.ID_ESPECIALISTA = C.ID_ESPECIALISTA
LEFT JOIN VETERINARIA V
ON V.ID_VETERINARIA = C.ID_VETERINARIA
WHERE C.ESTADO = 'Presente'

--Mostrar mascotas que pesan 30kg
SELECT M.NOMBRE_MASCOTA, DM.PESO, M.RAZA,D.NOMBRE DUENO FROM MASCOTA M
LEFT JOIN DETALLE_MASCOTA DM
ON DM.ID_MASCOTA = M.ID_MASCOTA
LEFT JOIN DUENO D
ON D.ID_DUENO = M.ID_DUENO
WHERE PESO = '30KG'

--Veterinarias y su pago por citas
SELECT V.ID_VETERINARIA,V.SERVICIO,U.CIUDAD,F.FECHA_FACTURA, F.SUB_TOTAL FROM VETERINARIA V
LEFT JOIN FACTURA F
ON F.ID_VETERINARIA = V.ID_VETERINARIA
LEFT JOIN UBICACION U
ON U.ID_VETERINARIA = V.ID_VETERINARIA

--Edad de mascotas
SELECT D.NOMBRE DUENO, M.NOMBRE_MASCOTA, DM.EDAD FROM MASCOTA M
LEFT JOIN DUENO D
ON D.ID_DUENO = M.ID_DUENO
LEFT JOIN DETALLE_MASCOTA DM
ON DM.ID_MASCOTA = M.ID_MASCOTA

--Medicametos que solo tiene una dosis
SELECT M.NOMBRE,DM.TIPO_MEDICAMENTO,DM.HORARIO_DOSIS FROM DETALLE_MEDICAMENTO DM
RIGHT JOIN MEDICAMENTO M
ON M.ID_MEDICAMENTO = DM.ID_MEDICAMENTO 
WHERE DM.HORARIO_DOSIS NOT LIKE '%-%'

--Mostrar las enfermedades de las mascotas
SELECT M.NOMBRE_MASCOTA, D.NOMBRE DUENO, EE.ID_ENFERMEDAD
FROM EXPEDIENTE E
LEFT JOIN EXPEDIENTE_ENFERMEDAD EE
ON EE.ID_EXPEDIENTE = E.ID_EXPEDIENTE
LEFT JOIN MASCOTA M
ON M.ID_MASCOTA = E.ID_MASCOTA
LEFT JOIN DUENO D
ON D.ID_DUENO = E.ID_DUENO
WHERE EE.ID_ENFERMEDAD IS NOT NULL

--Mostrar las vacunas que tienen las mascotas
SELECT M.NOMBRE_MASCOTA, D.NOMBRE DUENO, EV.ID_VACUNA
FROM EXPEDIENTE E
LEFT JOIN EXPEDIENTE_VACUNA EV 
ON EV.ID_EXPEDIENTE = E.ID_EXPEDIENTE
LEFT JOIN MASCOTA M
ON M.ID_MASCOTA = E.ID_MASCOTA
LEFT JOIN DUENO D
ON D.ID_DUENO = E.ID_DUENO
WHERE EV.ID_VACUNA IS NOT NULL

--Salario promedio de los especialistas
SELECT E.NOMBRE AS ESPECIALISTA, E.ESPECIALIDAD, AVG(DE.SALARIO) AS PROMEDIO_SALARIO, V.SERVICIO
FROM ESPECIALISTA E
LEFT JOIN VETERINARIA V 
ON E.ID_VETERINARIA = V.ID_VETERINARIA
LEFT JOIN DETALLE_ESPECIALISTA DE 
ON DE.ID_ESPECIALISTA = E.ID_ESPECIALISTA
GROUP BY E.ESPECIALIDAD, E.NOMBRE, V.SERVICIO

--Gastos totales de duenos
SELECT D.NOMBRE, D.APELLIDO1 || ' ' || D.APELLIDO2 AS APELLIDOS, V.SERVICIO,
SUM(F.SUB_TOTAL) AS TOTAL_GASTOS
FROM FACTURA F 
INNER JOIN DUENO D 
ON D.ID_DUENO = F.ID_DUENO
INNER JOIN VETERINARIA V
ON V.ID_VETERINARIA = F.ID_VETERINARIA
GROUP BY D.NOMBRE, D.APELLIDO1 || ' ' || D.APELLIDO2, V.SERVICIO;