DROP procedure IF EXISTS `bsp_dame_clientes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_clientes`(pIncluyeBajas bool)
BEGIN
	/*
	Permite listar los clientes dados de alta ordenadas por apellido.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		c.IdCliente,p.Apellidos,p.Nombres,p.DNI,DATE_FORMAT(p.FechaNac,'%d/%m/%Y') as FechaNac,DATE_FORMAT(p.FechaAlta,'%d/%m/%Y') as FechaAlta,p.Email,
				p.Telefono,p.Sexo,p.EstadoPer,p.Observaciones
    FROM		personas p
				JOIN clientes c on p.IdPersona = c.IdCliente
    WHERE		((pIncluyeBajas = true) OR  (EstadoPer = 'A'))
    ORDER BY	apellidos asc;

    
END ;;
DELIMITER ;