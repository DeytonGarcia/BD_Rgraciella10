-- Crear Tabla `person`
CREATE TABLE person (
    person_id NUMBER PRIMARY KEY,
    person_type VARCHAR2(50) NOT NULL,
    names VARCHAR2(100) NOT NULL CHECK (REGEXP_LIKE(names, '^[A-Za-z\s]+$')),
    surnames VARCHAR2(100) NOT NULL CHECK (REGEXP_LIKE(surnames, '^[A-Za-z\s]+$')),
    address VARCHAR2(200),
    phone VARCHAR2(15),
    email VARCHAR2(100) UNIQUE,
    date_of_birth DATE,
    document_type VARCHAR2(50),
    document_number VARCHAR2(20) UNIQUE NOT NULL
);

-- Crear Tabla `menu`
CREATE TABLE menu (
    menu_id NUMBER PRIMARY KEY,
    dish_name VARCHAR2(100) NOT NULL,
    description VARCHAR2(255),
    registration_date DATE DEFAULT SYSDATE,
    entrance VARCHAR2(100),
    second_course VARCHAR2(100),
    dessert VARCHAR2(100),
    unit_price NUMBER(10, 2) CHECK (unit_price > 0),
    amount NUMBER,
    state VARCHAR2(20)
);

-- Crear Tabla `orders`
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    client_id NUMBER REFERENCES person(person_id) ON DELETE CASCADE,
    waiter_name VARCHAR2(100),
    menu_dish_id NUMBER REFERENCES menu(menu_id),
    order_date DATE DEFAULT SYSDATE
);

-- Crear Tabla `order_detail`
CREATE TABLE order_detail (
    detail_id NUMBER PRIMARY KEY,
    order_id NUMBER REFERENCES orders(order_id) ON DELETE CASCADE,
    menu_type NUMBER,
    order_responsible VARCHAR2(100),
    payment_type VARCHAR2(50)
);

-- Crear Tabla `reservation_detail`
CREATE TABLE reservation_detail (
    detail_id NUMBER PRIMARY KEY,
    amount NUMBER,
    menu_requested VARCHAR2(100) NOT NULL,
    menu_type NUMBER,
    sub_total NUMBER(10, 2) CHECK (sub_total >= 0)
);

-- Crear Tabla `reservations`
CREATE TABLE reservations (
    reservation_id NUMBER PRIMARY KEY,
    client_id NUMBER REFERENCES person(person_id) ON DELETE CASCADE,
    reservation_date DATE,
    reservation_time TIMESTAMP,
    detalle_reserva_id_detalleReserva NUMBER REFERENCES reservation_detail(detail_id) ON DELETE CASCADE
);
-- Inserciones de datos

-- Inserción de Registros en `person`
INSERT INTO person VALUES (1, 'CLIENTE', 'Pedro', 'Alvarez', 'Calle Lima 101', '123456789', 'pedro.alvarez@example.com', TO_DATE('1988-01-10', 'YYYY-MM-DD'), 'DNI', '11223344');
INSERT INTO person VALUES (2, 'CLIENTE', 'Maria', 'Gonzalez', 'Calle Santa 202', '987654321', 'maria.gonzalez@example.com', TO_DATE('1990-02-15', 'YYYY-MM-DD'), 'DNI', '22334455');
INSERT INTO person VALUES (3, 'CLIENTE', 'Luis', 'Martinez', 'Calle del Sol 303', '654321987', 'luis.martinez@example.com', TO_DATE('1995-03-20', 'YYYY-MM-DD'), 'DNI', '33445566');
INSERT INTO person VALUES (4, 'CLIENTE', 'Ana', 'Lopez', 'Calle Luna 404', '321654987', 'ana.lopez@example.com', TO_DATE('1985-04-25', 'YYYY-MM-DD'), 'DNI', '44556677');
INSERT INTO person VALUES (5, 'CLIENTE', 'Javier', 'Fernandez', 'Calle Norte 505', '123123123', 'javier.fernandez@example.com', TO_DATE('1980-05-30', 'YYYY-MM-DD'), 'DNI', '55667788');
INSERT INTO person VALUES (6, 'CLIENTE', 'Sofia', 'Ramirez', 'Calle Oeste 606', '456456456', 'sofia.ramirez@example.com', TO_DATE('1992-06-05', 'YYYY-MM-DD'), 'DNI', '66778899');
INSERT INTO person VALUES (7, 'CLIENTE', 'Diego', 'Torres', 'Calle Este 707', '789789789', 'diego.torres@example.com', TO_DATE('1993-07-10', 'YYYY-MM-DD'), 'DNI', '77889900');
INSERT INTO person VALUES (8, 'CLIENTE', 'Valeria', 'Pérez', 'Calle Sur 808', '159159159', 'valeria.perez@example.com', TO_DATE('1989-08-15', 'YYYY-MM-DD'), 'DNI', '88990011');
INSERT INTO person VALUES (9, 'CLIENTE', 'Carlos', 'Diaz', 'Calle Central 909', '357357357', 'carlos.diaz@example.com', TO_DATE('1982-09-20', 'YYYY-MM-DD'), 'DNI', '99001122');
INSERT INTO person VALUES (10, 'CLIENTE', 'Laura', 'Gutiérrez', 'Calle Abajo 1000', '654654654', 'laura.gutierrez@example.com', TO_DATE('1987-10-25', 'YYYY-MM-DD'), 'DNI', '11223333');


select * from menu; 

-- Inserción de Registros en `menu`
INSERT INTO menu VALUES (1, 'Ensalada Caesar', 'Ensalada con pollo y aderezo Caesar', SYSDATE, 'Lechuga', 'Pollo', 'Tarta', 12.50, 100, 'Disponible');
INSERT INTO menu VALUES (2, 'Pizza Margarita', 'Pizza con tomate y queso', SYSDATE, 'Masa', 'Queso', 'Helado', 15.00, 50, 'Disponible');
INSERT INTO menu VALUES (3, 'Pasta Carbonara', 'Pasta con salsa de huevo y queso', SYSDATE, 'Pasta', 'Tocino', 'Fruta', 10.00, 80, 'Disponible');
INSERT INTO menu VALUES (4, 'Sushi', 'Arroz y pescado crudo', SYSDATE, 'Alga', 'Pescado', 'Té', 20.00, 30, 'No Disponible');
INSERT INTO menu VALUES (5, 'Tacos', 'Tacos de carne y vegetales', SYSDATE, 'Tortilla', 'Carne', 'Flan', 8.00, 60, 'Disponible');
INSERT INTO menu VALUES (6, 'Ceviche', 'Pescado marinado en limón', SYSDATE, 'Pescado', 'Cebolla', 'Mousse', 18.00, 40, 'Disponible');
INSERT INTO menu VALUES (7, 'Hamburguesa', 'Hamburguesa de carne con queso', SYSDATE, 'Pan', 'Carne', 'Brownie', 11.00, 70, 'Disponible');
INSERT INTO menu VALUES (8, 'Sopa de Verduras', 'Sopa de verduras frescas', SYSDATE, 'Verduras', 'Fideos', 'Tarta', 9.00, 90, 'Disponible');
INSERT INTO menu VALUES (9, 'Goulash', 'Estofado de carne y verduras', SYSDATE, 'Carne', 'Verduras', 'Galleta', 14.00, 20, 'No Disponible');
INSERT INTO menu VALUES (10, 'Brownie de Chocolate', 'Postre de chocolate', SYSDATE, 'Chocolate', 'Nuez', 'Helado', 7.50, 50, 'Disponible');

-- Inserción de Registros en `orders`
INSERT INTO orders VALUES (1, 1, 'Carlos', 1, SYSDATE);
INSERT INTO orders VALUES (2, 2, 'Pedro', 2, SYSDATE);
INSERT INTO orders VALUES (3, 3, 'Ana', 3, SYSDATE);
INSERT INTO orders VALUES (4, 4, 'Luis', 4, SYSDATE);
INSERT INTO orders VALUES (5, 5, 'Sofia', 5, SYSDATE);
INSERT INTO orders VALUES (6, 6, 'Diego', 6, SYSDATE);
INSERT INTO orders VALUES (7, 7, 'Valeria', 7, SYSDATE);
INSERT INTO orders VALUES (8, 8, 'Javier', 8, SYSDATE);
INSERT INTO orders VALUES (9, 9, 'Laura', 9, SYSDATE);
INSERT INTO orders VALUES (10, 10, 'Carlos', 10, SYSDATE);

-- Inserción de Registros en `order_detail`
INSERT INTO order_detail VALUES (1, 1, 1, 'Carlos', 'Efectivo');
INSERT INTO order_detail VALUES (2, 2, 2, 'Pedro', 'Tarjeta');
INSERT INTO order_detail VALUES (3, 3, 3, 'Ana', 'Efectivo');
INSERT INTO order_detail VALUES (4, 4, 4, 'Luis', 'Tarjeta');
INSERT INTO order_detail VALUES (5, 5, 5, 'Sofia', 'Efectivo');
INSERT INTO order_detail VALUES (6, 6, 6, 'Diego', 'Tarjeta');
INSERT INTO order_detail VALUES (7, 7, 7, 'Valeria', 'Efectivo');
INSERT INTO order_detail VALUES (8, 8, 8, 'Javier', 'Tarjeta');
INSERT INTO order_detail VALUES (9, 9, 9, 'Laura', 'Efectivo');
INSERT INTO order_detail VALUES (10, 10, 10, 'Carlos', 'Tarjeta');

-- Inserción de Registros en `reservation_detail`
INSERT INTO reservation_detail VALUES (1, 4, 'Pizza Margarita', 1, 15.00);
INSERT INTO reservation_detail VALUES (2, 2, 'Tacos', 2, 8.00);
INSERT INTO reservation_detail VALUES (3, 3, 'Ceviche', 1, 18.00);
INSERT INTO reservation_detail VALUES (4, 5, 'Ensalada Caesar', 1, 12.50);
INSERT INTO reservation_detail VALUES (5, 6, 'Sushi', 1, 20.00);
INSERT INTO reservation_detail VALUES (6, 7, 'Hamburguesa', 1, 11.00);
INSERT INTO reservation_detail VALUES (7, 8, 'Sopa de Verduras', 1, 9.00);
INSERT INTO reservation_detail VALUES (8, 9, 'Goulash', 1, 14.00);
INSERT INTO reservation_detail VALUES (9, 10, 'Brownie de Chocolate', 1, 7.50);
INSERT INTO reservation_detail VALUES (10, 1, 'Pasta Carbonara', 1, 10.00);

-- Inserción de Registros en `reservations`
INSERT INTO reservations VALUES (1, 1, TO_DATE('2024-10-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-20 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO reservations VALUES (2, 2, TO_DATE('2024-10-21', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-21 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO reservations VALUES (3, 3, TO_DATE('2024-10-22', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-22 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO reservations VALUES (4, 4, TO_DATE('2024-10-23', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-23 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO reservations VALUES (5, 5, TO_DATE('2024-10-24', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-24 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO reservations VALUES (6, 6, TO_DATE('2024-10-25', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-25 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 6);
INSERT INTO reservations VALUES (7, 7, TO_DATE('2024-10-26', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-26 19:30:00', 'YYYY-MM-DD HH24:MI:SS'), 7);
INSERT INTO reservations VALUES (8, 8, TO_DATE('2024-10-27', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-27 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 8);
INSERT INTO reservations VALUES (9, 9, TO_DATE('2024-10-28', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-28 21:30:00', 'YYYY-MM-DD HH24:MI:SS'), 9);
INSERT INTO reservations VALUES (10, 10, TO_DATE('2024-10-29', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-10-29 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), 10);

-- Consultas para verificar los datos

SELECT * FROM MENU;
SELECT * FROM PERSON;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_DETAIL;
SELECT * FROM RESERVATIONS;
SELECT * FROM RESERVATION_DETAIL;