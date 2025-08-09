
-------- Prueba de datos

----------- Tipos de Cliente
INSERT INTO client_type (name, description) VALUES
('minorista', 'Cliente minorista'),
('mayorista', 'Cliente mayorista');
---------- Estados de Cliente
INSERT INTO client_status (name, description) VALUES
('activo', 'Cliente activo'),
('inactivo', 'Cliente inactivo'),
('suspendido', 'Cliente suspendido');
-- Cliente 1
SELECT create_client(
	'Juan Pérez',
	'+54 11 5555-1234',
	'juanperez@email.com',
	'Avenida Siempreviva 123',
	1, -- general
	1  -- active
);
-- Cliente 2
SELECT create_client(
	'María Gómez',
	'+54 11 4444-5678',
	'maria.gomez@example.com',
	'Calle Falsa 456',
	2,
	2
);
-- Cliente 3
SELECT create_client(
	'Empresa XYZ',
	'+54 11 2222-9999',
	'contacto@xyz.com',
	'Parque Industrial, Lote 15',
	1, -- wholesale
	1  -- active
);
