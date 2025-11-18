SELECT 
    d.SalesOrderID                          AS factura,
    FORMAT(h.OrderDate, 'dd-MM-yyyy')       AS fecha,
    d.ProductID                             AS id_producto,
    p.Name                                  AS nombre_producto,
    d.OrderQty                              AS cantidad,
    d.UnitPrice                             AS precio_unitario
FROM Sales.SalesOrderDetail AS d
INNER JOIN Sales.SalesOrderHeader AS h
        ON d.SalesOrderID = h.SalesOrderID
INNER JOIN Production.Product AS p
        ON d.ProductID = p.ProductID;