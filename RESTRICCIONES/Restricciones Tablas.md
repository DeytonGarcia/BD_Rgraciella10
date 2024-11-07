# Restricciones (Constraints) de las Tablas

## Tabla `person`
- **`pk_person`**: `PRIMARY KEY (person_id)`
- **`chk_person_names`**: `CHECK (REGEXP_LIKE(names, '^[A-Za-z\s]+$'))`  
  - *Asegura que el campo `names` contenga solo letras y espacios.*
- **`chk_person_surnames`**: `CHECK (REGEXP_LIKE(surnames, '^[A-Za-z\s]+$'))`  
  - *Asegura que el campo `surnames` contenga solo letras y espacios.*
- **`chk_person_phone`**: `CHECK (REGEXP_LIKE(phone, '^[0-9]+$'))`  
  - *Permite solo dígitos en el campo `phone`.*
- **`chk_person_dob`**: `CHECK (date_of_birth <= SYSDATE)`  
  - *Impide que `date_of_birth` sea una fecha futura.*
- **`chk_person_document_type`**: `CHECK (document_type IN ('DNI', 'PASAPORTE', 'OTRO'))`  
  - *Restringe los valores de `document_type` a `DNI`, `PASAPORTE` o `OTRO`.*
- **`uq_person_email`**: `UNIQUE (email)`  
  - *Garantiza que el `email` sea único.*
- **`uq_person_document_number`**: `UNIQUE (document_number)`  
  - *Garantiza que el `document_number` sea único.*

## Tabla `menu`
- **`pk_menu`**: `PRIMARY KEY (menu_id)`
- **`chk_menu_dish_name`**: `CHECK (dish_name IS NOT NULL)`  
  - *Asegura que el campo `dish_name` no esté vacío.*
- **`chk_menu_unit_price`**: `CHECK (unit_price > 0)`  
  - *Impone que el `unit_price` sea mayor a cero.*
- **`chk_menu_amount`**: `CHECK (amount >= 0)`  
  - *Impide que `amount` sea negativo.*
- **`chk_menu_state`**: `CHECK (state IN ('DISPONIBLE', 'NO DISPONIBLE', 'AGOTADO'))`  
  - *Restringe los valores de `state` a `DISPONIBLE`, `NO DISPONIBLE` o `AGOTADO`.*

## Tabla `orders`
- **`pk_orders`**: `PRIMARY KEY (order_id)`
- **`fk_orders_client_id`**: `FOREIGN KEY (client_id) REFERENCES person(person_id) ON DELETE CASCADE`  
  - *Relaciona `orders` con `person`, eliminando pedidos del cliente si se elimina el cliente.*
- **`fk_orders_menu_dish_id`**: `FOREIGN KEY (menu_dish_id) REFERENCES menu(menu_id)`  
  - *Relaciona `orders` con `menu`, vinculando cada pedido con un plato específico.*
- **`chk_orders_waiter_name`**: `CHECK (REGEXP_LIKE(waiter_name, '^[A-Za-z\s]+$'))`  
  - *Asegura que `waiter_name` contenga solo letras y espacios.*

## Tabla `order_detail`
- **`pk_order_detail`**: `PRIMARY KEY (detail_id)`
- **`fk_order_detail_order_id`**: `FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE`  
  - *Relaciona `order_detail` con `orders`, eliminando detalles si el pedido se elimina.*
- **`chk_order_detail_payment_type`**: `CHECK (payment_type IN ('EFECTIVO', 'TARJETA', 'TRANSFERENCIA'))`  
  - *Restringe los valores de `payment_type` a `EFECTIVO`, `TARJETA` o `TRANSFERENCIA`.*

## Tabla `reservation_detail`
- **`pk_reservation_detail`**: `PRIMARY KEY (detail_id)`
- **`chk_reservation_detail_sub_total`**: `CHECK (sub_total >= 0)`  
  - *Impide que el `sub_total` sea negativo.*

## Tabla `reservations`
- **`pk_reservations`**: `PRIMARY KEY (reservation_id)`
- **`fk_reservations_client_id`**: `FOREIGN KEY (client_id) REFERENCES person(person_id) ON DELETE CASCADE`  
  - *Relaciona `reservations` con `person`, eliminando reservas del cliente si se elimina el cliente.*
- **`fk_reservations_detalle_reserva_id`**: `FOREIGN KEY (detalle_reserva_id_detalleReserva) REFERENCES reservation_detail(detail_id) ON DELETE CASCADE`  
  - *Relaciona `reservations` con `reservation_detail`, eliminando el detalle de la reserva si la reserva se elimina.*

