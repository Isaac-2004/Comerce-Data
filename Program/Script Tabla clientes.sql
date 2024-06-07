-- CREATE DATABASE prueba 
CREATE TABLE CLIENTES (
   CLICODIGO INT AUTO_INCREMENT PRIMARY KEY, -- CLICODIGO es la clave primaria, es un número entero que se incrementa automáticamente con cada nuevo registro.
   CliNOMBRE1 CHAR(60) NOT NULL, -- NOMBRE1 es el primer nombre del cliente y no puede ser nulo.
   CLINOMBRE2 CHAR(60), -- NOMBRE2 es el segundo nombre del cliente y puede ser nulo.
   CliAPELLIDO1 CHAR(60) NOT NULL, -- APELLIDO1 es el primer apellido del cliente y no puede ser nulo.
   CliAPELLIDO2 CHAR(60), -- APELLIDO2 es el segundo apellido del cliente y puede ser nulo.
   CLINOMBRE CHAR(60) NOT NULL, -- CLINOMBRE es el nombre completo del cliente y no puede ser nulo.
   CLIIDENTIFICACION CHAR(10) NOT NULL UNIQUE, -- CLIIDENTIFICACION es la identificación del cliente, no puede ser nulo y debe ser único.
   CLIDIRECCION CHAR(60) NOT NULL, -- CLIDIRECCION es la dirección del cliente y no puede ser nulo.
   CLITELEFONO CHAR(9) NOT NULL, -- CLITELEFONO es el teléfono del cliente y no puede ser nulo.
   CLICELULAR CHAR(10) NOT NULL, -- CLICELULAR es el celular del cliente y no puede ser nulo.
   CLIEMAIL CHAR(60), -- CLIEMAIL es el email del cliente y puede ser nulo.
   CLITIPO CHAR(3) NOT NULL, -- CLITIPO es el tipo de cliente y no puede ser nulo.
   CLISTATUS CHAR(3) NOT NULL, -- CLISTATUS es el estado del cliente y no puede ser nulo.
   CLIIMAGEN BLOB, -- CLIIMAGEN es la columna para almacenar la imagen del cliente.

   -- Constraint para verificar que CLITELEFONO tenga exactamente 9 caracteres y solo contenga dígitos.
   CONSTRAINT CK_CLITELEFONO CHECK (CHAR_LENGTH(CLITELEFONO) = 9 AND CLITELEFONO REGEXP '^[0-9]+$'), 

   -- Constraint para verificar que CLICELULAR tenga exactamente 10 caracteres y solo contenga dígitos.
   CONSTRAINT CK_CLICELULAR CHECK (CHAR_LENGTH(CLICELULAR) = 10 AND CLICELULAR REGEXP '^[0-9]+$'), 

   -- Constraint para verificar que CLIEMAIL tenga un formato válido de email si no es nulo.
   CONSTRAINT CK_CLIEMAIL CHECK (CLIEMAIL IS NULL OR (CHAR_LENGTH(CLIEMAIL) <= 60 AND CLIEMAIL REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$')), 

   -- Constraint para asegurar que CLITIPO sea uno de los valores permitidos ('VIP', 'NOR', 'EMP').
   CONSTRAINT CK_CLITIPO CHECK (CLITIPO IN ('VIP', 'NOR', 'EMP')), 

   -- Constraint para asegurar que CLISTATUS sea uno de los valores permitidos ('ACT', 'INA').
   CONSTRAINT CK_CLISTATUS CHECK (CLISTATUS IN ('ACT', 'INA')) 
);
ALTER TABLE CLIENTES MODIFY COLUMN CLIIMAGEN LONGBLOB;

SELECT * FROM clientes
