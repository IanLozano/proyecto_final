SELECT 
    c.c_customer_sk                        AS id_cliente,
    LTRIM(RTRIM(c.c_first_name + ' ' + c.c_last_name)) AS nombre_completo,
    c.c_birth_year                         AS anio_nacimiento,
    c.c_birth_month                        AS mes_nacimiento,
    c.c_birth_day                          AS dia_nacimiento,
    c.c_birth_country                      AS pais_origen,
    c.c_last_review_date                   AS revision
FROM customer AS c;
