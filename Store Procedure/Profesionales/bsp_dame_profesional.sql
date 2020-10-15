DROP procedure IF EXISTS `bsp_dame_profesional`;
DELIMITER $$

CREATE PROCEDURE `bsp_dame_profesional` (pIdProfesional int)
SALIR:BEGIN
	/*
    Procedimiento que devuelve un profesional de la BD dado un ID
    */
-- Controla que no exista un documento con el mismo numero
	IF NOT EXISTS(SELECT IdProfesional FROM profesionales WHERE IdProfesional = pIdProfesional) THEN
		SELECT 'Profesional inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
    SELECT	*
    FROM	profesionales
    WHERE	IdProfesional = pIdProfesional;
    
END$$
DELIMITER ;