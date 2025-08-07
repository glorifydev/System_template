--------- Lista completa de productos
CREATE OR REPLACE FUNCTION get_products_list()
RETURNS SETOF product AS $$
BEGIN
	RETURN QUERY SELECT * FROM product;
END;
$$ LANGUAGE plpgsql;

--------- Obtener producto por ID
CREATE OR REPLACE FUNCTION get_product(p_id INT)
RETURNS product AS $$
DECLARE
	v_result product;
BEGIN
	SELECT * INTO v_result FROM product WHERE id = p_id;
	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

--------- Crear producto
CREATE OR REPLACE FUNCTION create_product(
	p_name TEXT,
	p_description TEXT,
	p_code TEXT,
	p_category_id INT
) RETURNS product AS $$
DECLARE
	v_result product;
BEGIN
	INSERT INTO product (name, description, code, category_id)
	VALUES (p_name, p_description, p_code, p_category_id)
	RETURNING * INTO v_result;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

--------- Eliminar producto
CREATE OR REPLACE FUNCTION delete_product(p_id INT)
RETURNS BOOLEAN AS $$
BEGIN
	DELETE FROM product WHERE id = p_id;
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

--------- Obtener categoría de un producto
CREATE OR REPLACE FUNCTION get_product_category(p_product_id INT)
RETURNS product_category AS $$
DECLARE
	v_result product_category;
BEGIN
	SELECT pc.* INTO v_result
	FROM product p
	JOIN product_category pc ON pc.id = p.category_id
	WHERE p.id = p_product_id;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

