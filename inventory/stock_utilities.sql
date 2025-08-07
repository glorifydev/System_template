--------- Obtener stock actual de un producto
CREATE OR REPLACE FUNCTION get_product_stock(p_product_id INT)
RETURNS product_stock AS $$
DECLARE
	v_result product_stock;
BEGIN
	SELECT * INTO v_result
	FROM product_stock
	WHERE product_id = p_product_id;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

--------- Actualizar stock de un producto
CREATE OR REPLACE FUNCTION update_product_stock(p_product_id INT, p_quantity NUMERIC)
RETURNS product_stock AS $$
DECLARE
	v_result product_stock;
BEGIN
	UPDATE product_stock
	SET quantity = p_quantity,
		updated_at = CURRENT_TIMESTAMP
	WHERE product_id = p_product_id
	RETURNING * INTO v_result;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

--------- Incrementar stock
CREATE OR REPLACE FUNCTION increase_product_stock(p_product_id INT, p_amount NUMERIC)
RETURNS product_stock AS $$
DECLARE
	v_result product_stock;
BEGIN
	UPDATE product_stock
	SET quantity = quantity + p_amount,
		updated_at = CURRENT_TIMESTAMP
	WHERE product_id = p_product_id
	RETURNING * INTO v_result;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

--------- Disminuir stock
CREATE OR REPLACE FUNCTION decrease_product_stock(p_product_id INT, p_amount NUMERIC)
RETURNS product_stock AS $$
DECLARE
	v_result product_stock;
BEGIN
	UPDATE product_stock
	SET quantity = quantity - p_amount,
		updated_at = CURRENT_TIMESTAMP
	WHERE product_id = p_product_id
	RETURNING * INTO v_result;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;
