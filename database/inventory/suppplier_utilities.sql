--------- Lista completa de proveedores
CREATE OR REPLACE FUNCTION get_suppliers_list()
RETURNS SETOF supplier AS $$
BEGIN
	RETURN QUERY SELECT * FROM supplier;
END;
$$ LANGUAGE plpgsql;

--------- Obtener proveedor por ID
CREATE OR REPLACE FUNCTION get_supplier(p_id INT)
RETURNS supplier AS $$
DECLARE
	v_result supplier;
BEGIN
	SELECT * INTO v_result FROM supplier WHERE id = p_id;
	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

--------- Obtener proveedores de un producto
CREATE OR REPLACE FUNCTION get_product_suppliers(p_product_id INT)
RETURNS TABLE (
	supplier_id INT,
	supplier_name TEXT,
	cost_price NUMERIC
) AS $$
BEGIN
	RETURN QUERY
	SELECT
		s.id,
		s.name,
		ps.cost_price
	FROM product_supplier ps
	JOIN supplier s ON s.id = ps.supplier_id
	WHERE ps.product_id = p_product_id;
END;
$$ LANGUAGE plpgsql;
