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



