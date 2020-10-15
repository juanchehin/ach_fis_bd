DROP procedure IF EXISTS `bsp_editar_profesional`;
DELIMITER $$
CREATE PROCEDURE `bsp_editar_profesional`(
pIdPersona int,
pApellidos varchar(60),
pNombres varchar(60),
pSexo CHAR(1),
pFechaNac date,
pTelefono int(11),
pEmail varchar(60),
pLocalidad varchar(70),
pCalle varchar(60),
pDNI varchar(45),
pEstadoPer char(1),
pObervaciones varchar(255)
)
SALIR:BEGIN
	/*
    Permite modificar un profesional existente. 
    Devuelve 1 o el mensaje de error en Mensaje.
    */
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
    
-- Controla que no exista un documento con el mismo numero
	IF NOT EXISTS(SELECT IdPersona FROM personas WHERE IdPersona = pIdPersona) THEN
		SELECT 'Persona inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;    

START TRANSACTION;
	UPDATE Personas SET Apellidos = pApellidos WHERE IdPersona = pIdPersona;
    UPDATE Personas SET Nombres = pNombres WHERE IdPersona = pIdPersona;
    UPDATE Personas SET Sexo = pSexo WHERE IdPersona = pIdPersona;
	UPDATE Personas SET FechaNac = pFechaNac WHERE IdPersona = pIdPersona;
    UPDATE Personas SET Telefono = pTelefono WHERE IdPersona = pIdPersona;
    UPDATE Personas SET Email = pEmail WHERE IdPersona = pIdPersona;
    UPDATE Personas SET Localidad = pLocalidad WHERE IdPersona = pIdPersona;
    UPDATE Personas SET Calle = pCalle WHERE IdPersona = pIdPersona;
    UPDATE Personas SET DNI = pDNI WHERE IdPersona = pIdPersona;
    UPDATE Personas SET EstadoPer = pEstadoPer WHERE IdPersona = pIdPersona;
    UPDATE Personas SET Observaciones = pObservaciones WHERE IdPersona = pIdPersona;

	SELECT 'Ok';
COMMIT;

END$$
DELIMITER ;