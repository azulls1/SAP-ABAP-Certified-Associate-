CLASS zcl_18_table_comprehensio_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_18_table_comprehensio_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


TYPES: BEGIN OF t_connection,
carrier_id TYPE /dmo/carrier_id,
connection_id TYPE /dmo/connection_id,
departure_airport TYPE /dmo/airport_from_id,
departure_airport_Name TYPE /dmo/airport_Name,
END OF t_connection.


TYPES t_connections TYPE STANDARD TABLE OF t_connection WITH NON-UNIQUE KEY carrier_id connection_id.


DATA connections TYPE TABLE OF /dmo/connection.
DATA airports TYPE TABLE OF /dmo/airport.
DATA result_table TYPE t_connections.


* Aim of the method:
* Read a list of connections from the database and use them to fill an internal table result_table.
* This contains some data from the table connections and adds the name of the departure airport.

* Objetivo del método:
* Leer una lista de conexiones de la base de datos y utilizarlas para llenar una tabla interna result_table.
* Contiene algunos datos de la tabla de conexiones y agrega el nombre del aeropuerto de salida.

SELECT FROM /dmo/airport FIELDS * INTO TABLE @airports.
SELECT FROM /dmo/connection FIELDS * INTO TABLE @connections.




out->write( 'Connection Table' ).
out->write( 'Tabla de conexiones' ).
out->write( '________________' ).
out->write( connections ).
out->write( ` ` ).




* The VALUE expression iterates over the table connections. In each iteration, the variable line
* accesses the current line. Inside the parentheses, we build the next line of result_table by
* copying the values of line-carrier_Id, line-connection_Id and line-airport_from_id, then
* loooking up the airport name in the internal table airports using a table expression

* La expresión VALOR itera sobre las conexiones de la tabla. En cada iteración, la línea variable
* accede a la línea actual. Dentro del paréntesis, construimos la siguiente línea de result_table por
* copiando los valores de line-carrier_Id, line-connection_Id y line-airport_from_id, luego
* buscar el nombre del aeropuerto en la tabla interna de aeropuertos usando una expresión de tabla


result_table = VALUE #( FOR line IN connections ( carrier_Id = line-carrier_id
connection_id = line-connection_id
departure_airport = line-airport_from_id
departure_airport_name = airports[ airport_id = line-airport_from_id ]-name ) ).


out->write( 'Results' ).
out->write( '_______' ).
out->write( result_table ).



  ENDMETHOD.
ENDCLASS.
