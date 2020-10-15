DROP procedure IF EXISTS `bsp_buscar_profesional`;
DELIMITER $$

CREATE PROCEDURE `bsp_buscar_profesional`(pTextoBuscar varchar(30))
BEGIN
	/*
	Permite buscar los profesionales (alta o baja) que contengan una parte del nombre del titular o transporte
    */

    SELECT		per.Apellidos,per.Nombres,per.DNI,
				CASE 
					WHEN per.Sexo = 'H' THEN 'Hombre'
					WHEN per.Sexo = 'M' THEN 'Mujer'
				ELSE NULL
                END AS Sexo,
				per.FechaNac,per.Telefono,per.Email,per.Localidad,per.Calle
    FROM		personas per
				RIGHT JOIN profesionales prof on per.IdPersona = prof.IdProfesional
    WHERE		(per.Apellidos LIKE CONCAT('%',pTextoBuscar,'%')) OR (per.Nombres LIKE CONCAT('%',pTextoBuscar,'%')); 
END$$
DELIMITER ;