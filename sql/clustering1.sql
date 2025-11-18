WITH ventas_cliente AS (
    SELECT
        ss_customer_sk                         AS id_cliente,
        COUNT(DISTINCT ss_ticket_number)       AS num_pedidos,
        COUNT(ss_item_sk)                      AS num_items,
        SUM(ss_net_paid)                       AS monto_comprado
    FROM store_sales
    GROUP BY ss_customer_sk
),
devoluciones_cliente AS (
    SELECT
        sr_customer_sk                         AS id_cliente,
        COUNT(DISTINCT sr_ticket_number)       AS num_pedidos_dev,
        COUNT(sr_item_sk)                      AS num_items_dev,
        SUM(sr_return_amt)                     AS monto_devuelto
    FROM store_returns
    GROUP BY sr_customer_sk
)

SELECT
    v.id_cliente AS cliente,
    -- relación de pedidos devueltos vs pedidos totales
    ROUND(
        COALESCE(
            1.0 * d.num_pedidos_dev / NULLIF(v.num_pedidos, 0),
            0
        ),
        7
    ) AS ratio_de_pedidos_devueltos,

    -- proporción de artículos devueltos vs artículos comprados
    ROUND(
        COALESCE(
            1.0 * d.num_items_dev / NULLIF(v.num_items, 0),
            0
        ),
        7
    ) AS ratio_de_artículos_devueltos,

    -- relación de importe devuelto vs importe comprado
    ROUND(
        COALESCE(
            d.monto_devuelto / NULLIF(v.monto_comprado, 0),
            0
        ),
        7
    ) AS ratio_monetario_de_devolución,

    -- frecuencia de devolución (número de pedidos devueltos)
    COALESCE(d.num_pedidos_dev, 0) AS frecuencia_de_retorno
FROM ventas_cliente v
LEFT JOIN devoluciones_cliente d
    ON v.id_cliente = d.id_cliente;
