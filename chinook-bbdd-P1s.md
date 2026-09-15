Hoy

Hola Copilot!

¡Hola Rita! 🌞 Qué gusto saludarte desde Barcelona. ¿Cómo amaneciste hoy? Estoy lista para lo que necesites: ideas creativas, ayuda con tus proyectos, una charla divertida… o simplemente para compartir curiosidades que te alegren el día. ¿Por dónde empezamos?

¿Conoces la Base de Datos Chinook?

¡Claro que sí! La base de datos **Chinook** es una base de ejemplo muy popular en el mundo del SQL y el desarrollo de aplicaciones. Fue diseñada para simular una tienda de música digital, como si fuera una versión antigua de iTunes 🎵.

### 🧠 ¿Qué contiene Chinook?

Incluye 11 tablas que representan distintos aspectos de una tienda de medios:

- **Artists**: los músicos o bandas.

- **Albums**: los discos que pertenecen a los artistas.

- **Tracks**: las canciones individuales.

- **Genres**: los géneros musicales (rock, jazz, metal…).

- **MediaTypes**: formatos de archivo (MP3, AAC…).

- **Customers**: los clientes que compran música.

- **Invoices** e **InvoiceItems**: las facturas y sus detalles.

- **Employees**: quienes trabajan en la tienda.

- **Playlists** y **PlaylistTrack**: listas de reproducción y sus canciones.

### 🛠️ ¿Para qué se usa?

Es ideal para:

- Practicar consultas SQL.

- Probar herramientas de bases de datos.

- Aprender sobre relaciones entre tablas.

- Hacer demostraciones en cursos o presentaciones.

Puedes encontrarla en distintos formatos como SQLite, SQL Server, MySQL, PostgreSQL, entre otros2.

Si quieres, te puedo ayudar a descargarla, visualizar su diagrama o incluso crear consultas para practicar. ¿Te gustaría trabajar con ella?

Editar en una página

Ok Esa Base de Datos no está normalizada, cierto?
¿Cómo podría normalizarse?

¡Buena observación, Rita! 💡 La base de datos **Chinook** está *parcialmente normalizada*, pero no cumple estrictamente con todas las formas normales, especialmente si la analizamos con lupa académica. Vamos a desmenuzar esto:

### 📚 ¿Qué significa que esté “normalizada”?

La **normalización** busca reducir la redundancia y mejorar la integridad de los datos. Se hace en etapas llamadas **formas normales** (1FN, 2FN, 3FN, etc.). Chinook cumple con algunas, pero tiene áreas que podrían mejorarse.

### 🔍 Problemas comunes en Chinook

Aquí algunos puntos donde Chinook podría no estar completamente normalizada:

- **Redundancia en nombres**: Por ejemplo, en la tabla `Invoices`, el país, ciudad y dirección del cliente se repiten en cada factura, aunque ya están en `Customers`.

- **Datos multivaluados**: Las listas de reproducción (`Playlists`) y sus canciones (`PlaylistTrack`) están bien separadas, pero podrían tener más atributos normalizados (como el orden de reproducción).

- **Dependencias transitivas**: Algunas columnas dependen de otras indirectamente. Por ejemplo, en `Tracks`, el `GenreId` y `MediaTypeId` podrían depender del tipo de archivo, no directamente del track.

### 🛠️ ¿Cómo podrías normalizarla más?

Aquí te dejo una propuesta paso a paso:

#### ✅ 1FN (Primera Forma Normal)

- Asegúrate de que **todas las columnas sean atómicas** (sin listas ni valores compuestos).

- Chinook ya cumple esto bastante bien.

#### ✅ 2FN (Segunda Forma Normal)

- Elimina **dependencias parciales** en claves compuestas.

- Ejemplo: Si una tabla tiene clave compuesta, asegúrate de que cada columna dependa de toda la clave, no solo de una parte.

#### ✅ 3FN (Tercera Forma Normal)

- Elimina **dependencias transitivas**.

- En `Invoices`, podrías mover `BillingAddress`, `BillingCity`, `BillingCountry` a una tabla separada de direcciones, y referenciarla desde `Customers`.

#### 🧩 Otras mejoras

- Crear una tabla `Address` para reutilizar direcciones entre empleados, clientes y facturas.

- Separar `Employee` en roles o departamentos si hay jerarquías.

- Añadir una tabla `OrderStatus` si se quiere manejar estados de facturas (pendiente, pagada, cancelada…).

### 🎯 ¿Vale la pena normalizarla más?

Depende del objetivo. Para enseñanza y práctica de SQL, Chinook está bien como está. Pero si quisieras usarla en producción o como base para una app real, sí sería recomendable normalizarla más para evitar inconsistencias y facilitar mantenimiento.

¿Quieres que te ayude a rediseñar alguna tabla como ejemplo? Podemos hacerlo juntas.

¿Y qué opinas del campo Composer en Track y Artist? ¿Se trata del mismo contenido?

¡Qué buena pregunta, Rita! 🎼 El campo **Composer** en la tabla `Track` y el campo **Name** en la tabla `Artist` *parecen* similares a primera vista, pero en realidad **no representan lo mismo** ni están directamente relacionados en la estructura de Chinook.

### 🎹 Diferencias clave entre `Composer` y `Artist.Name`

| Campo      | Tabla    | ¿Qué representa?                   | Ejemplo típico              |
| ---------- | -------- | ---------------------------------- | --------------------------- |
| `Composer` | `Track`  | Persona que **compuso** la canción | "Ludwig van Beethoven"      |
| `Name`     | `Artist` | Nombre del **intérprete o banda**  | "London Symphony Orchestra" |

### 🧠 ¿Por qué no son lo mismo?

- Un **compositor** puede escribir música que luego es interpretada por múltiples artistas. Por ejemplo, Bach compuso obras que han sido grabadas por cientos de orquestas distintas.

- Un **artista** en Chinook es quien aparece como el intérprete principal del álbum. No necesariamente escribió la música.

### 🔍 ¿Está bien modelado?

Desde el punto de vista de normalización, el campo `Composer` es un **texto libre**, lo que significa que:

- No está vinculado a una tabla de compositores.

- Puede haber errores tipográficos o inconsistencias ("Mozart" vs "W.A. Mozart").

- No se puede hacer fácilmente una consulta para ver todos los tracks de un compositor específico sin limpiar los datos.

### 🛠️ ¿Cómo se podría mejorar?

Si quisieras normalizarlo más, podrías:

1. Crear una tabla `Composer` con un `ComposerId` y su nombre.

2. Enlazar `Track` con `ComposerId` en lugar de texto libre.

3. Permitir múltiples compositores por track si es necesario (relación muchos a muchos).

Si quieres, puedo ayudarte a rediseñar esa parte del esquema o incluso crear una consulta que detecte compositores repetidos con nombres similares. ¿Te gustaría explorar eso?

No, está bien...

Perfecto, Rita 😊. Me alegra que te haya servido la explicación. Si en algún momento quieres seguir explorando Chinook, practicar consultas SQL, o incluso rediseñar parte del modelo para hacerlo más robusto, aquí estaré para ayudarte.

Y si hoy te apetece cambiar de tema—¿te gustaría que te proponga un reto de lógica, una curiosidad musical, o algo totalmente distinto? Tengo ideas para todos los gustos.

Hola!
¿Qué hace ésta instrucción?
update mytable
set mycolumn = str_to_date(
concat(
 floor(1 + rand() * (12-1)), '-',
 floor(1 + rand() * (28-1)), '-',
 floor(1 + rand() * (2007-1940) + 1940)),'%m-%d-%Y');

¡Hola Rita! 🌟 Esa instrucción SQL está haciendo algo bastante curioso: está **actualizando una columna con fechas aleatorias**. Vamos a descomponerla paso a paso para que veas qué está ocurriendo:

### 🧩 ¿Qué hace exactamente?

sql

```
UPDATE mytable
SET mycolumn = STR_TO_DATE(  CONCAT(    FLOOR(1 + RAND() * (12 - 1)), '-',       -- Mes aleatorio (1 a 11)
    FLOOR(1 + RAND() * (28 - 1)), '-',       -- Día aleatorio (1 a 27)
    FLOOR(1 + RAND() * (2007 - 1940) + 1940) -- Año aleatorio (1940 a 2006)
  ),  '%m-%d-%Y'
);
```

### 🔍 Paso a paso

1. `RAND()` genera un número decimal aleatorio entre 0 y 1.

2. `FLOOR(1 + RAND() * (12 - 1))` → genera un número entero entre 1 y 11 (mes).

3. `FLOOR(1 + RAND() * (28 - 1))` → genera un día entre 1 y 27 (evita problemas con febrero).

4. `FLOOR(1 + RAND() * (2007 - 1940) + 1940)` → año entre 1940 y 2006.

5. `CONCAT(...)` une los tres valores en formato `MM-DD-YYYY`.

6. `STR_TO_DATE(..., '%m-%d-%Y')` convierte ese string en un valor de tipo `DATE`.

7. `UPDATE mytable SET mycolumn = ...` actualiza *todas las filas* de `mytable` con una **nueva fecha aleatoria**.

### ⚠️ Cosas a tener en cuenta

- **Todas las filas recibirán la misma fecha**, porque `RAND()` se evalúa una sola vez por instrucción en algunas versiones de MySQL. Si quieres una fecha distinta por fila, necesitas usar una subconsulta o función que se evalúe por fila.

- No hay validación de fechas reales (por ejemplo, no se contempla el día 31 ni años bisiestos).

- Si `mycolumn` no es de tipo `DATE`, puede fallar o truncar el valor.

¿Quieres que te ayude a modificarla para que cada fila tenga una fecha distinta? O quizá limitarla a un rango más reciente, como entre 1990 y 2020. Tú mandas 😄

Ok ayudame a modificarla para que cada fila tenga una fecha distinta

¡Vamos allá, Rita! 😄 Para que **cada fila** tenga una **fecha distinta**, necesitamos asegurarnos de que la función `RAND()` se evalúe **por fila**, no una sola vez para toda la instrucción. En MySQL, esto se logra fácilmente usando una **subconsulta** o aplicando `RAND()` directamente dentro de una `UPDATE` con una **tabla derivada**.

Aquí tienes una versión modificada que genera una fecha aleatoria distinta para cada fila:

### 🛠️ Versión con fechas aleatorias por fila

sql

```
UPDATE mytable
SET mycolumn = STR_TO_DATE(  CONCAT(    LPAD(FLOOR(1 + RAND() * 12), 2, '0'), '-',     -- Mes (01–12)
    LPAD(FLOOR(1 + RAND() * 28), 2, '0'), '-',     -- Día (01–28)
    FLOOR(1940 + RAND() * (2007 - 1940))           -- Año (1940–2006)
  ),  '%m-%d-%Y'
);
```

### ✅ ¿Qué cambia?

- `RAND()` **se evalúa por fila**: MySQL lo hace automáticamente en este contexto.

- `LPAD(..., 2, '0')` asegura que el mes y día tengan dos dígitos (`01`, `02`, ..., `12`), lo cual es importante para que `STR_TO_DATE` funcione correctamente.

- **Fechas válidas**: Al limitar los días a 28, evitamos problemas con meses cortos como febrero.

### 🧪 ¿Quieres probarlo primero?

Si prefieres no afectar todos los datos de golpe, puedes hacer un `SELECT` para ver cómo quedarían las fechas:

sql

```
SELECT STR_TO_DATE(  CONCAT(    LPAD(FLOOR(1 + RAND() * 12), 2, '0'), '-',    LPAD(FLOOR(1 + RAND() * 28), 2, '0'), '-',    FLOOR(1940 + RAND() * (2007 - 1940))  ),  '%m-%d-%Y'
) AS random_date
FROM mytable;
```

Esto te mostrará una columna con fechas aleatorias generadas por fila, sin modificar nada aún.

¿Quieres ajustar el rango de años o incluir días hasta el 31? También podemos hacerlo, aunque habría que validar los meses para evitar fechas inválidas. Tú decides 😄

Ok! Quería hacer ésto...
Tomando como base la estructura original de la BBDD Chinook

1. Relacionar las tablas de la Base de Datos y al crear las claves foráneas, agregar las cláusulas ON UPDATE y ON DELETE pertinentes, justificando con un comentario cada decisión.
2. Crear una tabla Address para reutilizar direcciones entre empleados, clientes y facturas, agregando un Id (autonumérico) y AddressType (enum) con los valores Customer, Employee, Billing. Sustituir las direcciones pertinentes en las tablas por el Id de la dirección de la tabla Address.
3. Crear los siguiente campos en la tabla customer: VIP (enum: sí, no; default: no), birthdate (date), username (VARCHAR(12)) y pwd (VARCHAR(12)).
4. Crear los siguientes campos: discount (decimal(5,2)) y SubTotal (decimal(10,2)) en la tabla InvoiceLine; y SameAsCustomer (enum: sí, no) en la tabla Invoice
5. Crear una restricción de tipo CHECK al campo Quantity de la tabla invoiceline que controle que no se puedan introducir cantidades menores a 1.
6. Crear una restricción de tipo CHECK al campo HireDate de la tabla employee que controle que el valor del campo HireDate, sea mayor al valor del campo Birthday.
7. Crear una restricción de tipo UNIQUE al campo PlayListName de la tabla PlayList. 
8. La siguiente instrucción:
   UPDATE mytable
   SET mycolumn = STR_TO_DATE(
   CONCAT(
   LPAD(FLOOR(1 + RAND() * 12), 2, '0'), '-', -- Mes (01–12)
   LPAD(FLOOR(1 + RAND() * 28), 2, '0'), '-', -- Día (01–28)
   FLOOR(1940 + RAND() * (2007 - 1940)) -- Año (1940–2006)
   ),
   '%m-%d-%Y'
   );
   permite actualizar un campo fecha de una tabla con fechas aleatorias (en este caso el año de nacimiento estaría en el rango 2007-1940, y los días entre 1 y 28).
   La función LPAD, asegura que el mes y día tengan dos dígitos.
   Actualizar con ella, el campo birthdate de la tabla customer (recién creado).
9. Actualizar el campo discount de la tabla invoiceLine utilizando la función rand() de MySQL para que tome valores entre 0% y 10%. Eliminar el campo Subtotal y volverlo a crear como un campo autogenerado que muestre el precio de la línea tomando en cuenta cantidad (Quantity) y el descuento (discount) previamente actualizado.
10. Actualizar (UPDATE ) el campo username de la tabla customer de la siguiente manera: inicial de su nombre en minúsculas + las tres primeras letras de su apellido en minusculas + id de su Representante de Ventas + un guión de subrayado + las dos primeras letras de su país en mayúsculas. (Una sola instrucción debe actualizar toda la tabla)
11. Actualizar el campo pwd con el contenido del campo username previamente actualizado.
12. Crear dos disparadores para que al intentar cambiar un registro de la tabla customer (BEFORE UPDATE) o se intente incluir un nuevo cliente, revise si el campo pwd longitud es mayor a 7 caracteres y su contenido contiene mayúsculas, minúsculas, digitos y alguno de los siguientes símbolos: -_#@. De no ser así, mostrar un mensaje de error (SQLSTATE) y no permitir la operación.
13. Diseñar dos disparadores que prevenga que el campo email de la tabla employee tenga un formato correcto al actualizar o insertar un nuevo email.
    ¿Lo ves todo viable? 
    ¿Podrías generarme un modelo relacional final despues de haber aplicado todos estos cambios?

¡Rita, esto es una propuesta brillante! 🌟 Has planteado una transformación profunda y bien pensada del modelo Chinook, orientada a mejorar la normalización, integridad y funcionalidad. Y sí: **todo lo que propones es viable**, aunque algunos puntos requieren atención especial por las limitaciones de MySQL (como los `CHECK` y validaciones en triggers). Vamos a desglosarlo y luego te presento el **modelo relacional final**.

## ✅ Viabilidad general

| Punto                                            | ¿Es viable? | Comentario                                                     |
| ------------------------------------------------ | ----------- | -------------------------------------------------------------- |
| 1. Claves foráneas con `ON UPDATE` / `ON DELETE` | ✅           | Totalmente viable. Requiere análisis por tabla.                |
| 2. Tabla `Address`                               | ✅           | Mejora la normalización. Perfecto.                             |
| 3. Nuevos campos en `Customer`                   | ✅           | Sin problema.                                                  |
| 4. Nuevos campos en `InvoiceLine` e `Invoice`    | ✅           | Requiere lógica para `SubTotal` como campo calculado.          |
| 5. `CHECK` en `Quantity`                         | ⚠️          | MySQL lo permite desde versión 8.0.                            |
| 6. `CHECK` en `HireDate > Birthday`              | ⚠️          | Se puede hacer con triggers si el `CHECK` no es suficiente.    |
| 7. `UNIQUE` en `PlayListName`                    | ✅           | Muy recomendable.                                              |
| 8. Actualización de `birthdate`                  | ✅           | Ya lo hicimos antes.                                           |
| 9. `discount` aleatorio + `SubTotal` calculado   | ✅           | Se puede usar columna generada (`GENERATED ALWAYS`).           |
| 10. Actualización de `username`                  | ✅           | Requiere `UPDATE` con funciones de texto.                      |
| 11. Validación de `pwd` en triggers              | ✅           | Requiere lógica con expresiones regulares y `SIGNAL SQLSTATE`. |
| 12. Validación de `email` en `Employee`          | ✅           | Similar al anterior, con regex.                                |

## 🧩 Modelo Relacional Final (resumen estructural)

### 🔗 Relaciones y claves foráneas

sql

```
-- Ejemplo: relación entre Album y Artist
ALTER TABLE Album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId)
ON UPDATE CASCADE
ON DELETE RESTRICT; -- No se permite borrar artistas si tienen álbumes
```

> Justificación: `CASCADE` en actualizaciones para mantener consistencia, `RESTRICT` en borrado para evitar pérdida de datos dependientes.

Esto se aplica a todas las relaciones: `Track → Album`, `Invoice → Customer`, `InvoiceLine → Invoice`, etc.

### 🏠 Tabla Address

sql

```
CREATE TABLE Address (  AddressId INT AUTO_INCREMENT PRIMARY KEY,  Street VARCHAR(70),  City VARCHAR(40),  Country VARCHAR(40),  PostalCode VARCHAR(10),  AddressType ENUM('Customer', 'Employee', 'Billing')
);
```

Se elimina la dirección directa en `Customer`, `Employee` e `Invoice`, y se reemplaza por `AddressId`.

### 👤 Tabla Customer (modificada)

sql

```
ALTER TABLE Customer
ADD COLUMN VIP ENUM('sí', 'no') DEFAULT 'no',
ADD COLUMN Birthdate DATE,
ADD COLUMN Username VARCHAR(12),
ADD COLUMN Pwd VARCHAR(12),
ADD COLUMN AddressId INT,
ADD FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
ON UPDATE CASCADE ON DELETE SET NULL;
```

### 🧾 Tabla InvoiceLine (modificada)

sql

```
ALTER TABLE InvoiceLine
ADD COLUMN Discount DECIMAL(5,2),
DROP COLUMN SubTotal,
ADD COLUMN SubTotal DECIMAL(10,2) GENERATED ALWAYS AS (  UnitPrice * Quantity * (1 - Discount)
) STORED,
ADD CHECK (Quantity >= 1);
```

### 🧾 Tabla Invoice (modificada)

sql

```
ALTER TABLE Invoice
ADD COLUMN SameAsCustomer ENUM('sí', 'no'),
ADD COLUMN AddressId INT,
ADD FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
ON UPDATE CASCADE ON DELETE SET NULL;
```

### 👥 Tabla Employee (modificada)

sql

```
ALTER TABLE Employee
ADD COLUMN Birthdate DATE,
ADD COLUMN AddressId INT,
ADD FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
ON UPDATE CASCADE ON DELETE SET NULL,
ADD CHECK (HireDate > Birthdate);
```

### 🎶 Tabla Playlist

sql

```
ALTER TABLE Playlist
ADD CONSTRAINT unique_playlist_name UNIQUE (Name);
```

### 🔄 Actualizaciones masivas

sql

```
-- Birthdate aleatoria
UPDATE Customer
SET Birthdate = STR_TO_DATE(  CONCAT(    LPAD(FLOOR(1 + RAND() * 12), 2, '0'), '-',    LPAD(FLOOR(1 + RAND() * 28), 2, '0'), '-',    FLOOR(1940 + RAND() * (2007 - 1940))  ),  '%m-%d-%Y'
);

-- Discount aleatorio
UPDATE InvoiceLine
SET Discount = ROUND(RAND() * 0.10, 2);

-- Username
UPDATE Customer
SET Username = CONCAT(  LOWER(LEFT(FirstName, 1)),  LOWER(LEFT(LastName, 3)),  SupportRepId,  '_',  UPPER(LEFT(Country, 2))
);

-- Pwd igual a Username
UPDATE Customer
SET Pwd = Username;
```

### 🔐 Triggers para validar `pwd`

sql

```
CREATE TRIGGER check_pwd_before_insert
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
  IF LENGTH(NEW.Pwd) < 8 OR
     NEW.Pwd NOT REGEXP '.*[A-Z].*' OR
     NEW.Pwd NOT REGEXP '.*[a-z].*' OR
     NEW.Pwd NOT REGEXP '.*[0-9].*' OR
     NEW.Pwd NOT REGEXP '.*[-_#@].*' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Contraseña inválida: debe tener al menos 8 caracteres, mayúsculas, minúsculas, dígitos y símbolos (-_#@)';  END IF;
END;
```

> Se repite para `BEFORE UPDATE`.

### 📧 Triggers para validar email en Employee

sql

```
CREATE TRIGGER check_email_before_insert
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
  IF NEW.Email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Email inválido';  END IF;
END;
```

> También se replica para `BEFORE UPDATE`.

¿Quieres que te lo represente como un diagrama relacional visual (tipo ERD)? O si prefieres, puedo ayudarte a generar el script completo para ejecutarlo en MySQL paso a paso. Tú eliges cómo seguimos 💡

Prefiero el script completo para ejecutarlo en MySQL paso a paso.

¡Perfecto, Rita! 🌟 Aquí tienes el **script completo paso a paso** para transformar la base de datos Chinook según tus especificaciones. Está organizado por secciones para facilitar su ejecución y comprensión. Puedes copiarlo directamente en tu entorno MySQL 8.0+.

## 🧱 1. Claves foráneas con `ON UPDATE` / `ON DELETE`

sql

```
-- Album → Artist
ALTER TABLE Album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId)
ON UPDATE CASCADE ON DELETE RESTRICT;

-- Track → Album
ALTER TABLE Track
ADD CONSTRAINT fk_track_album
FOREIGN KEY (AlbumId) REFERENCES Album(AlbumId)
ON UPDATE CASCADE ON DELETE RESTRICT;

-- Track → Genre
ALTER TABLE Track
ADD CONSTRAINT fk_track_genre
FOREIGN KEY (GenreId) REFERENCES Genre(GenreId)
ON UPDATE CASCADE ON DELETE SET NULL;

-- Track → MediaType
ALTER TABLE Track
ADD CONSTRAINT fk_track_mediatype
FOREIGN KEY (MediaTypeId) REFERENCES MediaType(MediaTypeId)
ON UPDATE CASCADE ON DELETE SET NULL;

-- Invoice → Customer
ALTER TABLE Invoice
ADD CONSTRAINT fk_invoice_customer
FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
ON UPDATE CASCADE ON DELETE CASCADE;

-- InvoiceLine → Invoice
ALTER TABLE InvoiceLine
ADD CONSTRAINT fk_invoiceline_invoice
FOREIGN KEY (InvoiceId) REFERENCES Invoice(InvoiceId)
ON UPDATE CASCADE ON DELETE CASCADE;

-- InvoiceLine → Track
ALTER TABLE InvoiceLine
ADD CONSTRAINT fk_invoiceline_track
FOREIGN KEY (TrackId) REFERENCES Track(TrackId)
ON UPDATE CASCADE ON DELETE SET NULL;

-- Customer → Employee (SupportRep)
ALTER TABLE Customer
ADD CONSTRAINT fk_customer_employee
FOREIGN KEY (SupportRepId) REFERENCES Employee(EmployeeId)
ON UPDATE CASCADE ON DELETE SET NULL;
```

## 🏠 2. Crear tabla `Address` y sustituir direcciones

sql

```
CREATE TABLE Address (
  AddressId INT AUTO_INCREMENT PRIMARY KEY,  
  Street VARCHAR(70),  
  City VARCHAR(40),  
  Country VARCHAR(40),  
  PostalCode VARCHAR(10),  
  AddressType ENUM('Customer', 'Employee', 'Billing')
);

-- Customer
ALTER TABLE Customer
ADD COLUMN AddressId INT,
ADD FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
ON UPDATE CASCADE ON DELETE SET NULL;

-- Employee
ALTER TABLE Employee
ADD COLUMN AddressId INT,
ADD FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
ON UPDATE CASCADE ON DELETE SET NULL;

-- Invoice
ALTER TABLE Invoice
ADD COLUMN AddressId INT,
ADD FOREIGN KEY (AddressId) REFERENCES Address(AddressId)
ON UPDATE CASCADE ON DELETE SET NULL;
```

## 👤 3. Nuevos campos en `Customer`

sql

```
ALTER TABLE Customer
ADD COLUMN VIP ENUM('sí', 'no') DEFAULT 'no',
ADD COLUMN Birthdate DATE,
ADD COLUMN Username VARCHAR(12),
ADD COLUMN Pwd VARCHAR(12);
```

## 🧾 4. Nuevos campos en `InvoiceLine` e `Invoice`

sql

```
ALTER TABLE InvoiceLine
ADD COLUMN Discount DECIMAL(5,2);

ALTER TABLE Invoice
ADD COLUMN SameAsCustomer ENUM('sí', 'no');
```

## ✅ 5. Restricción `CHECK` en `Quantity`

sql

```
ALTER TABLE InvoiceLine
ADD CHECK (Quantity >= 1);
```

## 📅 6. Restricción `CHECK` en `HireDate > Birthdate`

sql

```
ALTER TABLE Employee
ADD COLUMN Birthdate DATE,
ADD CHECK (HireDate > Birthdate);
```

## 🎶 7. Restricción `UNIQUE` en `Playlist.Name`

sql

```
ALTER TABLE Playlist
ADD CONSTRAINT unique_playlist_name UNIQUE (Name);
```

## 🎲 8. Actualizar `Birthdate` con fechas aleatorias

sql

```
UPDATE Customer
SET Birthdate = STR_TO_DATE(  CONCAT(    LPAD(FLOOR(1 + RAND() * 12), 2, '0'), '-',    LPAD(FLOOR(1 + RAND() * 28), 2, '0'), '-',    FLOOR(1940 + RAND() * (2007 - 1940))  ),  '%m-%d-%Y'
);
```

## 💸 9. Actualizar `Discount` y crear `SubTotal` calculado

sql

```
-- Actualizar Discount
UPDATE InvoiceLine
SET Discount = ROUND(RAND() * 0.10, 2);

-- Eliminar y crear SubTotal como campo calculado
ALTER TABLE InvoiceLine
DROP COLUMN SubTotal;

ALTER TABLE InvoiceLine
ADD COLUMN SubTotal DECIMAL(10,2) GENERATED ALWAYS AS (  UnitPrice * Quantity * (1 - Discount)
) STORED;
```

## 👥 10. Actualizar `Username` y `Pwd`

sql

```
-- Username: inicial nombre + 3 letras apellido + SupportRepId + _ + país
UPDATE Customer
SET Username = CONCAT(  LOWER(LEFT(FirstName, 1)),  LOWER(LEFT(LastName, 3)),  SupportRepId,  '_',  UPPER(LEFT(Country, 2))
);

-- Pwd = Username
UPDATE Customer
SET Pwd = Username;
```

## 🔐 11. Triggers para validar `Pwd`

sql

```
CREATE TRIGGER check_pwd_before_insert
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
  IF LENGTH(NEW.Pwd) < 8 OR
     NEW.Pwd NOT REGEXP '.*[A-Z].*' OR
     NEW.Pwd NOT REGEXP '.*[a-z].*' OR
     NEW.Pwd NOT REGEXP '.*[0-9].*' OR
     NEW.Pwd NOT REGEXP '.*[-_#@].*' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Contraseña inválida: debe tener al menos
     8 caracteres, mayúsculas, minúsculas, dígitos y símbolos (-_#@)';  
  END IF;
END;

CREATE TRIGGER check_pwd_before_update
BEFORE UPDATE ON Customer
FOR EACH ROW
BEGIN
  IF LENGTH(NEW.Pwd) < 8 OR
     NEW.Pwd NOT REGEXP '.*[A-Z].*' OR
     NEW.Pwd NOT REGEXP '.*[a-z].*' OR
     NEW.Pwd NOT REGEXP '.*[0-9].*' OR
     NEW.Pwd NOT REGEXP '.*[-_#@].*' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Contraseña inválida: debe tener al menos 
     8 caracteres, mayúsculas, minúsculas, dígitos y símbolos (-_#@)';  
  END IF;
END;
```

## 📧 12. Triggers para validar formato de `Email` en `Employee`

sql

```
CREATE TRIGGER check_email_before_insert
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
  IF NEW.Email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Email inválido';  END IF;
END;

CREATE TRIGGER check_email_before_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
  IF NEW.Email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Email inválido';  END IF;
END;
```

¿Quieres que te ayude a probarlo en un entorno local o generar datos de ejemplo para la tabla `Address`? También puedo ayudarte a crear vistas o consultas para verificar que todo esté funcionando correctamente. ¡Tú mandas, Rita!

<mark>Faltaría remover las columnas de dirección en Invoice, Customer y Employee
Y el modelo relacional final, porque lo que me has dado son las instrucciones para realizar los cambios, no?</mark>

¡Exactamente, Rita! 👌 Lo has captado al vuelo. Lo que te di antes fue el **script paso a paso** para aplicar los cambios, pero ahora vamos a cerrar el círculo con dos cosas:

## 🧹 1. Remover las columnas de dirección originales

Ya que ahora usamos la tabla `Address`, eliminamos los campos redundantes en `Customer`, `Employee` e `Invoice`:

sql

```
-- Customer
ALTER TABLE Customer
DROP COLUMN Address,
DROP COLUMN City,
DROP COLUMN Country,
DROP COLUMN PostalCode;

-- Employee
ALTER TABLE Employee
DROP COLUMN Address,
DROP COLUMN City,
DROP COLUMN Country,
DROP COLUMN PostalCode;

-- Invoice
ALTER TABLE Invoice
DROP COLUMN BillingAddress,
DROP COLUMN BillingCity,
DROP COLUMN BillingCountry,
DROP COLUMN BillingPostalCode;
```

## 🧬 2. Modelo Relacional Final (post-normalización)

Aquí tienes una **representación textual del modelo relacional** con claves primarias (PK), foráneas (FK), tipos de datos y relaciones. Es como un mini-ERD en texto:

### 🎨 `Artist`

- `ArtistId` INT PK

- `ArtistName` VARCHAR

### 💿 `Album`

- `AlbumId` INT PK

- `Title` VARCHAR

- `ArtistId` INT FK → Artist

### 🎵 `Track`

- `TrackId` INT PK

- `TrackName` VARCHAR

- `AlbumId` INT FK → Album

- `MediaTypeId` INT FK → MediaType

- `GenreId` INT FK → Genre

- `Composer` VARCHAR

- `Milliseconds`, `Bytes`, `UnitPrice`

### 📁 `MediaType`

- `MediaTypeId` INT PK

- `MediaTypeName` VARCHAR

### 🎼 `Genre`

- `GenreId` INT PK

- `GenreName` VARCHAR

### 📋 `Playlist`

- `PlaylistId` INT PK

- `Name` VARCHAR UNIQUE

### 🔗 `PlaylistTrack`

- `PlaylistId` INT FK → Playlist

- `TrackId` INT FK → Track

### 🏠 `Address`

- `AddressId` INT PK

- `Street`, `City`, `Country`, `PostalCode`

- `AddressType` ENUM('Customer', 'Employee', 'Billing')

### 👤 `Customer`

- `CustomerId` INT PK

- `FirstName`, `LastName`, `Company`, `Phone`, `Email`

- `SupportRepId` INT FK → Employee

- `AddressId` INT FK → Address

- `VIP` ENUM('sí', 'no')

- `Birthdate` DATE

- `Username` VARCHAR(12)

- `Pwd` VARCHAR(12)

### 👥 `Employee`

- `EmployeeId` INT PK

- `FirstName`, `LastName`, `Title`, `ReportsTo`, `Email`

- `Birthdate` DATE

- `HireDate` DATE CHECK(HireDate > Birthdate)

- `AddressId` INT FK → Address

### 🧾 `Invoice`

- `InvoiceId` INT PK

- `CustomerId` INT FK → Customer

- `InvoiceDate`, `Total`

- `SameAsCustomer` ENUM('sí', 'no')

- `AddressId` INT FK → Address

### 📦 `InvoiceLine`

- `InvoiceLineId` INT PK

- `InvoiceId` INT FK → Invoice

- `TrackId` INT FK → Track

- `UnitPrice`, `Quantity` CHECK(Quantity ≥ 1)

- `Discount` DECIMAL(5,2)

- `SubTotal` DECIMAL(10,2) GENERATED ALWAYS AS (UnitPrice * Quantity * (1 - Discount))

Este modelo es mucho más limpio, reutiliza direcciones, mejora la seguridad de contraseñas, y permite lógica comercial como descuentos y clientes VIP. Es una versión “enterprise-ready” de Chinook, y tú la diseñaste 😎

¿Quieres que te ayude a crear vistas para consultar fácilmente los datos, o generar inserts de ejemplo para poblar la tabla `Address`? También podemos documentar este modelo como si fuera parte de un proyecto profesional.

Para poblar la tabla Address pensé en hacerlo con los datos de las tres tablas involucradas a las que se les eliminaron las direcciones. 
Creo que antes de borrar las columnas, deberían llevarse a una tabla nueva donde además se indique su origen ¿no crees?

¡Totalmente de acuerdo, Rita! 🧠 Esa es una decisión excelente desde el punto de vista de integridad histórica y trazabilidad. Antes de eliminar las columnas de dirección en `Customer`, `Employee` e `Invoice`, lo ideal es **migrar esos datos a la nueva tabla** `Address`, incluyendo un campo que indique su **origen** (tipo de dirección).

Esto no solo preserva la información, sino que permite reutilizarla y mantener una estructura más limpia y normalizada.

## 🛠️ Estrategia para poblar la tabla `Address`

### 1. Insertar direcciones desde `Customer`

sql

```
INSERT INTO Address (Street, City, Country, PostalCode, AddressType)
SELECT Address, City, Country, PostalCode, 'Customer'
FROM Customer;
```

### 2. Insertar direcciones desde `Employee`

sql

```
INSERT INTO Address (Street, City, Country, PostalCode, AddressType)
SELECT Address, City, Country, PostalCode, 'Employee'
FROM Employee;
```

### 3. Insertar direcciones desde `Invoice` (Billing)

sql

```
INSERT INTO Address (Street, City, Country, PostalCode, AddressType)
SELECT BillingAddress, BillingCity, BillingCountry, BillingPostalCode, 'Billing'
FROM Invoice;
```

## 🔗 Actualizar las tablas originales con el `AddressId` correspondiente

Aquí es donde se pone interesante: como los datos pueden repetirse, lo ideal sería hacer una **asignación inteligente** para evitar duplicados. Pero si no te importa tener direcciones repetidas en `Address`, puedes hacer algo como esto:

### Customer → AddressId

sql

```
UPDATE Customer c
JOIN Address a ON c.Address = a.Street AND c.City = a.City AND c.Country = a.Country AND c.PostalCode = a.PostalCode AND a.AddressType = 'Customer'
SET c.AddressId = a.AddressId;
```

### Employee → AddressId

sql

```
UPDATE Employee e
JOIN Address a ON e.Address = a.Street AND e.City = a.City AND e.Country = a.Country AND e.PostalCode = a.PostalCode AND a.AddressType = 'Employee'
SET e.AddressId = a.AddressId;
```

### Invoice → AddressId

sql

```
UPDATE Invoice i
JOIN Address a ON i.BillingAddress = a.Street AND i.BillingCity = a.City AND i.BillingCountry = a.Country AND i.BillingPostalCode = a.PostalCode AND a.AddressType = 'Billing'
SET i.AddressId = a.AddressId;
```

## 🧹 Y ahora sí: eliminar las columnas originales

Una vez que los `AddressId` estén correctamente asignados, puedes proceder a eliminar las columnas antiguas sin perder información.

¿Quieres que te ayude a deduplicar direcciones antes de insertarlas, o prefieres mantenerlas tal cual para conservar fidelidad con los datos originales? También puedo ayudarte a crear una vista que muestre todas las direcciones con su origen, por si quieres hacer auditoría o análisis.

Y si hubiese direcciones repetidas? La idea es reutilizar direcciones, no?

Exactamente, Rita. 💡 Si hay direcciones repetidas, lo más lógico y eficiente es **reutilizarlas** en lugar de duplicarlas en la tabla `Address`. Esa es la esencia de la normalización: evitar redundancia y mantener consistencia.

## 🧠 ¿Cómo manejar direcciones repetidas?

En lugar de insertar todas las direcciones tal cual, lo ideal es:

1. **Detectar direcciones únicas** combinando `Street`, `City`, `Country`, `PostalCode`, y `AddressType`.

2. **Insertar solo las distintas** en la tabla `Address`.

3. **Asignar el** `AddressId` **correcto** a cada fila de `Customer`, `Employee` e `Invoice` según su dirección.

## 🛠️ Paso a paso para reutilizar direcciones

### 1. Insertar direcciones únicas

sql

```
INSERT INTO Address (Street, City, Country, PostalCode, AddressType)
SELECT DISTINCT Address, City, Country, PostalCode, 'Customer'
FROM Customer
WHERE Address IS NOT NULL;

INSERT INTO Address (Street, City, Country, PostalCode, AddressType)
SELECT DISTINCT Address, City, Country, PostalCode, 'Employee'
FROM Employee
WHERE Address IS NOT NULL;

INSERT INTO Address (Street, City, Country, PostalCode, AddressType)
SELECT DISTINCT BillingAddress, BillingCity, BillingCountry, BillingPostalCode, 'Billing'
FROM Invoice
WHERE BillingAddress IS NOT NULL;
```

> Esto asegura que cada combinación única se inserte una sola vez.

### 2. Asignar `AddressId` reutilizando coincidencias

sql

```
-- Customer
UPDATE Customer c
JOIN Address a ON
  c.Address = a.Street AND
  c.City = a.City AND
  c.Country = a.Country AND
  c.PostalCode = a.PostalCode AND
  a.AddressType = 'Customer'
SET c.AddressId = a.AddressId;

-- Employee
UPDATE Employee e
JOIN Address a ON
  e.Address = a.Street AND
  e.City = a.City AND
  e.Country = a.Country AND
  e.PostalCode = a.PostalCode AND
  a.AddressType = 'Employee'
SET e.AddressId = a.AddressId;

-- Invoice
UPDATE Invoice i
JOIN Address a ON
  i.BillingAddress = a.Street AND
  i.BillingCity = a.City AND
  i.BillingCountry = a.Country AND
  i.BillingPostalCode = a.PostalCode AND
  a.AddressType = 'Billing'
SET i.AddressId = a.AddressId;
```

### 3. Eliminar columnas originales (una vez verificado)

Después de verificar que todos los `AddressId` están correctamente asignados, puedes eliminar las columnas antiguas sin perder información.

Este enfoque no solo reutiliza direcciones, sino que también permite que múltiples clientes, empleados o facturas compartan la misma dirección sin duplicarla. ¿Quieres que te ayude a crear una vista que muestre cuántas entidades comparten cada dirección? Puede ser útil para análisis o auditoría.

Y si en Invoices hubiera un BillingAddress que existe como Address en customer?

¡Muy buena observación, Rita! 👏 Eso que planteas es justo el tipo de detalle que marca la diferencia entre una normalización superficial y una realmente eficaz.

## 🧠 ¿Qué implica que `BillingAddress` en `Invoice` coincida con una dirección en `Customer`?

Significa que **la misma dirección física** está siendo usada por dos entidades distintas: el cliente como su domicilio, y la factura como dirección de facturación. En un modelo bien normalizado, **esa dirección debería existir una sola vez en la tabla** `Address`, y ambas entidades deberían referenciarla mediante su `AddressId`.

## 🛠️ ¿Cómo manejarlo correctamente?

En lugar de insertar direcciones por tipo (`Customer`, `Employee`, `Billing`) como si fueran independientes, lo ideal sería:

### 1. Insertar **direcciones únicas** sin importar el origen

sql

```
INSERT INTO Address (Street, City, Country, PostalCode, AddressType)
SELECT DISTINCT Address, City, Country, PostalCode, 'General'
FROM (  SELECT Address, City, Country, PostalCode FROM Customer  UNION
  SELECT Address, City, Country, PostalCode FROM Employee  UNION
  SELECT BillingAddress AS Address, BillingCity AS City, BillingCountry AS Country, BillingPostalCode AS PostalCode FROM Invoice
) AS all_addresses;
```

> Aquí usamos `'General'` como tipo genérico, o podrías omitir `AddressType` si prefieres que sea solo informativo.

### 2. Asignar `AddressId` reutilizando coincidencias

sql

```
-- Customer
UPDATE Customer c
JOIN Address a ON
  c.Address = a.Street AND
  c.City = a.City AND
  c.Country = a.Country AND
  c.PostalCode = a.PostalCode
SET c.AddressId = a.AddressId;

-- Employee
UPDATE Employee e
JOIN Address a ON
  e.Address = a.Street AND
  e.City = a.City AND
  e.Country = a.Country AND
  e.PostalCode = a.PostalCode
SET e.AddressId = a.AddressId;

-- Invoice
UPDATE Invoice i
JOIN Address a ON
  i.BillingAddress = a.Street AND
  i.BillingCity = a.City AND
  i.BillingCountry = a.Country AND
  i.BillingPostalCode = a.PostalCode
SET i.AddressId = a.AddressId;
```

## 🧩 ¿Y el campo `AddressType`?

Podrías mantenerlo si quieres saber **quién usó esa dirección primero**, o si quieres auditar el uso. Pero en términos de normalización, **la dirección es una entidad independiente**, y su uso se define por la tabla que la referencia.

## ✅ Ventajas de este enfoque

- Evita duplicar direcciones que son físicamente iguales.

- Permite que múltiples entidades compartan una misma dirección.

- Facilita auditorías y análisis (por ejemplo, “¿cuántas facturas usan la dirección del cliente?”).

- Reduce el tamaño de la base de datos y mejora la integridad referencial.

Si quieres, puedo ayudarte a crear una vista que muestre todas las entidades que comparten una misma dirección, o incluso generar estadísticas de reutilización. Esto puede ser útil si estás documentando el modelo para un proyecto profesional o académico.
