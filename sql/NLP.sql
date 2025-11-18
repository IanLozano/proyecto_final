SELECT 
    r.pr_review_date           AS fecha_revision,
    r.pr_item_sk               AS id_producto,
    r.pr_review_rating         AS calificacion,
    r.pr_review_content        AS comentario,
    r.pr_user_sk               AS id_usuario,
    i.i_category               AS categoria,
    i.i_product_name           AS nombre_producto,
    i.i_item_desc              AS descripcion_producto,
    i.i_size                   AS tamano_producto
FROM product_reviews AS r
INNER JOIN item AS i
    ON r.pr_item_sk = i.i_item_sk;
