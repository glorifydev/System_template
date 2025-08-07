
---------Lista completa de clientes
CREATE OR REPLACE FUNCTION get_clients_list()
RETURNS SETOF client AS $$
BEGIN
	RETURN QUERY
	SELECT * FROM client;
END;
$$ LANGUAGE plpgsql;

----------Obtener cliente con su id
CREATE OR REPLACE FUNCTION get_client(p_id INT)
RETURNS client AS $$
DECLARE
	result client;
BEGIN
	SELECT *
	INTO result
	FROM client
	WHERE id = p_id;

	RETURN result;
END;
$$ LANGUAGE plpgsql;

---------- Crear cliente
CREATE OR REPLACE FUNCTION create_client(
	p_name TEXT,
	p_phone TEXT,
	p_email TEXT,
	p_address TEXT,
	p_type_id INT,
	p_status_id INT DEFAULT 1
) RETURNS client AS $$
DECLARE
	v_result client;
BEGIN
	INSERT INTO client (name, phone, email, address, type_id, status_id)
	VALUES (p_name, p_phone, p_email, p_address, p_type_id, p_status_id)
	RETURNING * INTO v_result;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

---------- Eliminar cliente
CREATE OR REPLACE FUNCTION delete_client(p_id INT)
RETURNS BOOLEAN AS $$
BEGIN
	DELETE FROM client
	WHERE id = p_id;

	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

--------- Obtener estado del cliente
CREATE OR REPLACE FUNCTION get_client_status(p_client_id INT)
RETURNS client_status AS $$
DECLARE
	v_result client_status;
BEGIN
	SELECT cs.*
	INTO v_result
	FROM client c
	JOIN client_status cs ON cs.id = c.status_id
	WHERE c.id = p_client_id;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;

---------- Obtener tipo de cliente
CREATE OR REPLACE FUNCTION get_client_type(p_client_id INT)
RETURNS client_type AS $$
DECLARE
	v_result client_type;
BEGIN
	SELECT ct.*
	INTO v_result
	FROM client c
	JOIN client_type ct ON ct.id = c.type_id
	WHERE c.id = p_client_id;

	RETURN v_result;
END;
$$ LANGUAGE plpgsql;
