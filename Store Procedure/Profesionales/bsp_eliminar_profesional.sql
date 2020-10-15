DROP procedure IF EXISTS `bsp_eliminar_profesional`;
DELIMITER $$

CREATE PROCEDURE `bsp_eliminar_profesional`(pIdPersona int)
SALIR:BEGIN
	/*
    Permite cambiar el estado de un profesional a B: Baja siempre y cuando no esté dado de 
    baja ya. Devuelve 1 o el mensaje de error en Mensaje.
	*/
    -- Controla que el cliente no este dado de baja ya
    IF EXISTS(SELECT IdPersona FROM personas WHERE IdPersona = pIdPersona
						AND EstadoPer = 'B') THEN
		SELECT 'El profesional ya está dado de baja.' AS Mensaje;
        LEAVE SALIR;
	END IF;
    
-- Da de baja
    UPDATE personas SET EstadoPer = 'B' WHERE IdPersona = pIdPersona;

    SELECT 1;
END$$
DELIMITER ;