DROP procedure IF EXISTS `bsp_dame_planes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_planes`(pIncluyeBajas bool)
BEGIN
	/*
	Permite listar los planes dados de alta ordenadas por nombre.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		*
    FROM		planes
    WHERE		((pIncluyeBajas = true) OR  (EstadoPlan = 'A')) AND (IdPlan != 1)
    ORDER BY	plan asc;

END ;;
DELIMITER ;