--UPDATES

--Actualizacion de precio en tabla vacuna
UPDATE VACUNA SET PRECIO = 40
WHERE PRECIO = 30

--Actualizacion de raza de mascota
UPDATE MASCOTA SET RAZA = UPPER('CHIHUAHUA')
WHERE RAZA = UPPER('LABRADOR')

--Actualizacion de fecha de cita
UPDATE CITA SET FECHA_CITA = DATE '2024-06-26'
WHERE FECHA_CITA = DATE '2024-06-25'

--Actualizacion de direccion de dueño
UPDATE DUENO SET DIRECCION = UPPER('123 Main ST, Anytown, CA 90567')
WHERE DIRECCION = UPPER('123 Main ST, Anytown, CA 90210')

--Actualizacion de ciudad en ubicacion de veterinaria
UPDATE UBICACION SET CIUDAD = UPPER('NEVADA')
WHERE CIUDAD = UPPER('L.A')

--Actualizacion sub total con IVA
UPDATE FACTURA SET SUB_TOTAL = SUB_TOTAL+(SUB_TOTAL*0.13)

--DELETES

--Eliminar una cita
DELETE FROM CITA 
WHERE ID_CITA = 308

--Eliminar un medicamento de expediente medicamento
DELETE FROM EXPEDIENTE_MEDICAMENTO
WHERE ID_EXP_MEDICAMENTO = 13
AND ID_EXPEDIENTE = 409
AND ID_MEDICAMENTO = 1105

--Eliminar funcionario de una veterinaria
DELETE FROM ESPECIALISTA
WHERE ID_ESPECIALISTA = 10008
AND ID_VETERINARIA = 104

--Eliminar una sucursal de veterinaria
DELETE FROM UBICACION 
WHERE ID_UBICACION = 83
AND ID_VETERINARIA = 104

--Eliminar tabla de expediente vacuna
DROP TABLE EXPEDIENTE_VACUNA CASCADE CONSTRAINT




