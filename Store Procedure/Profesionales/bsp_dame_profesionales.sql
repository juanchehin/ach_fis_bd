DROP procedure IF EXISTS `bsp_dame_profesionales`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_profesionales`()
BEGIN
	/*
	Permite listar los profesionales dados de alta ordenadas por apellido.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		prof.IdProfesional,per.Apellidos,per.Nombres,per.DNI,DATE_FORMAT(per.FechaNac,'%d/%m/%Y') as FechaNac,DATE_FORMAT(per.FechaAlta,'%d/%m/%Y') as FechaAlta,per.Email,
				per.Telefono,per.Sexo,per.EstadoPer,per.Observaciones
    FROM		personas per
				JOIN profesionales prof on per.IdPersona = prof.IdProfesional
    WHERE		EstadoPer = 'A'
    ORDER BY	apellidos asc;

    
END ;;
DELIMITER ;