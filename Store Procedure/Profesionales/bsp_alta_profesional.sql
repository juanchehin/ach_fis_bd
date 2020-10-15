DROP procedure IF EXISTS `bsp_alta_profesional`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_alta_profesional`(
pApellidos varchar(60),
pNombres varchar(60),
pSexo CHAR(1),
pFechaNac date,
pTelefono int(30),
pEmail varchar(60),
pLocalidad varchar(70),
pCalle varchar(60),
pDNI int(45),
pEstadoPer char(1),
pObervaciones varchar(255)
)
SALIR:BEGIN
	/*
    Permite dar de alta un profesional controlando que el mismo no exista ya. 
    La da de alta al final del orden, con estado A: Activa. 
    Devuelve OK + Id o el mensaje de error en Mensaje.
    */
	DECLARE pIdPersona int;
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		-- NULL AS Id;
		ROLLBACK;
	END;
    -- Controla que el correo sea obligatorio 
	IF pEmail = '' OR pEmail IS NULL THEN
		SELECT 'Debe proveer un nombre para el correo' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
       
    -- Controla que el Documento sea obligatorio
	IF pDNI = '' OR pDNI IS NULL THEN
		SELECT 'Debe proveer un documento' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
-- Controla que no exista un documento con el mismo numero
	IF EXISTS(SELECT DNI FROM personas WHERE DNI = pDNI) THEN
		SELECT 'Ya existe un Documento con ese numero' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
	START TRANSACTION;
		SET pIdPersona = 1 + (SELECT COALESCE(MAX(IdPersona),0) FROM personas);
		INSERT INTO personas VALUES(pIdPersona,pApellidos,pNombres,pSexo,pFechaNac,pTelefono,
        pEmail,pLocalidad,pCalle,pDNI,curdate(),null,'A',pObservaciones);

		INSERT INTO profesionales(IdCliente,Especialidad) VALUES(pIdPersona,pEspecialidad);
	SELECT 'Ok' AS Mensaje;
    COMMIT;

END ;;
DELIMITER ;