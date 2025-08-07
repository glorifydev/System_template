--------- Obtener precio de un producto en una lista
DROP FUNCTION IF EXISTS get_product_price_from_list(INT,INT);
CREATE OR REPLACE FUNCTION get_product_price_from_list(p_product_id INT, p_price_list_id INT)
RETURNS NUMERIC AS $$
DECLARE
	v_price NUMERIC;
BEGIN
	SELECT pl.price INTO v_price
	FROM price_list_item pl
	WHERE pl.product_id = p_product_id AND pl.price_list_id = p_price_list_id;

	RETURN v_price;
END;
$$ LANGUAGE plpgsql;

--------- Obtener todas las listas de precios disponibles
CREATE OR REPLACE FUNCTION get_price_lists()
RETURNS SETOF price_list AS $$
BEGIN
	RETURN QUERY SELECT * FROM price_list;
END;
$$ LANGUAGE plpgsql;

--------- Obtener todos los productos con sus precios en una lista
DROP FUNCTION IF EXISTS get_price_list_items(INT);
CREATE OR REPLACE FUNCTION get_price_list_items(p_price_list_id INT)
RETURNS TABLE (
	product_id INT,
	product_name TEXT,
	price NUMERIC
) AS $$
BEGIN
	RETURN QUERY
	SELECT
		p.id,
		p.name,
		pli.price
	FROM price_list_item pli
	JOIN product p ON p.id = pli.product_id
	WHERE pli.price_list_id = p_price_list_id;
END;
$$ LANGUAGE plpgsql;
