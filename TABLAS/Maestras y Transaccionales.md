# TABLAS MAESTRAS Y TRANSACCIONALES

## TABLA MAESTRA PERSON
Almacena información personal sobre los individuos asociados con el restaurante, como clientes o empleados. Incluye detalles como tipo de persona, nombres, apellidos, dirección, teléfono, email, fecha de nacimiento, tipo y número de documento.

![Captura de pantalla 2024-11-07 091617](https://github.com/user-attachments/assets/38d686e5-92a0-4c96-a775-4c7c16daa939)


## TABLA MAESTRA MENU 
Contiene información sobre los platos disponibles en el restaurante. Guarda el nombre del plato, descripción, fecha de registro, entrada, segundo plato, postre, precio unitario, cantidad, y estado (por ejemplo, disponible o no).

![Captura de pantalla 2024-11-07 091807](https://github.com/user-attachments/assets/7b3fa763-c6eb-4fe6-8008-fd1e605efdc4)

## TABLA TRANSACCIONAL ORDENES  
Registra los pedidos realizados por los clientes. Incluye el identificador del cliente, nombre del camarero, plato del menú pedido y fecha del pedido. Esta tabla se vincula con person para identificar al cliente y con menu para detallar el plato ordenado.

![Captura de pantalla 2024-11-07 091852](https://github.com/user-attachments/assets/42fc50ee-48a0-4b48-a2dc-61092673bf18)

## TABLA TRANSACCIONAL ORDENES DETALLE 
Proporciona detalles adicionales de cada pedido. Incluye el tipo de menú solicitado, responsable del pedido y el tipo de pago. Está relacionada con la tabla orders para asociar los detalles específicos con el pedido correspondiente.

![Captura de pantalla 2024-11-07 092046](https://github.com/user-attachments/assets/e413d740-52fe-456e-b41d-dbfa54ec0fe7)

## TABLA TRANSACCIONAL RESERVA DETALLE
Almacena información específica sobre los detalles de una reserva, como la cantidad de platos, el tipo de menú solicitado, y el subtotal de la reserva. Cada detalle de reserva se vincula con una reserva en reservations.

![Captura de pantalla 2024-11-07 092139](https://github.com/user-attachments/assets/3bfd8ab6-5b6a-4c79-8d31-5f5ca2b40e0b)

## TABLA TRANSACCIONAL RESERVA 
Gestiona las reservas de los clientes. Incluye el cliente, la fecha y hora de la reserva, y un vínculo a los detalles de la reserva en reservation_detail, para especificar los menús reservados y su cantidad.

![image](https://github.com/user-attachments/assets/bc79e1cc-4d95-4327-b0f6-428b85a96f17)

