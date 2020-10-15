DROP procedure IF EXISTS `bsp_buscar_profesional`;
DELIMITER $$

CREATE PROCEDURE `bsp_buscar_profesional`(pTextoBuscar varchar(30))
BEGIN
	/*
	Permite buscar los profesionales (alta o baja) que contengan una parte del nombre del titular o transporte
    */

    SELECT		*
    FROM		personas per
				RIGHT JOIN profesionales pro on per.IdPersona = prof.IProfesional
    WHERE		(per.Apellidos LIKE CONCAT('%',pTextoBuscar,'%')) OR (per.Nombres LIKE CONCAT('%',pTextoBuscar,'%')); 
END$$
DELIMITER ;