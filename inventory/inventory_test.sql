-- Categorías de producto
INSERT INTO product_category (name, description) VALUES
('Electronics', 'Devices and electronic accessories'),
('Tools', 'Manual and power tools'),
('Office Supplies', 'Stationery and equipment');

-- Proveedores
INSERT INTO supplier (name, phone, email, address) VALUES
('Proveeduría S.A.', '+54 11 4000-1234', 'contacto@proveeduria.com', 'Calle Mayor 1000'),
('Distribuidora Global', '+54 11 4555-7890', 'ventas@global.com', 'Ruta 8 km 45, Parque Ind.'),
('Ofimarket', '+54 11 4321-2222', 'ofimarket@gmail.com', 'Av. Corrientes 999');

-- Productos
SELECT create_product('Cable HDMI 2m', 'Cable de alta velocidad con conectores dorados', 'HDMI-2M-001', 1);
SELECT create_product('Taladro Bosch 550W', 'Taladro percutor eléctrico de 13mm', 'BOSCH-T550', 2);
SELECT create_product('Resma A4 500 hojas', 'Papel blanco tamaño A4', 'RESMA-A4', 3);

-- Stock inicial
INSERT INTO product_stock (product_id, quantity) VALUES
(1, 25),
(2, 10),
(3, 100);

-- Relación producto - proveedor
INSERT INTO product_supplier (product_id, supplier_id, cost_price) VALUES
(1, 1, 450.00),
(2, 2, 12500.00),
(3, 3, 2500.00);

-- Lista de precios base
INSERT INTO price_list (name, description) VALUES
('Base', 'Lista de precios estándar');

-- Precios por producto
INSERT INTO price_list_item (price_list_id, product_id, price) VALUES
(1, 1, 799.99),
(1, 2, 19800.00),
(1, 3, 4500.00);
