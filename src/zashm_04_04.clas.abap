CLASS zashm_04_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zashm_04_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,                          " creacion de primera estructura st_connection
             airport_from_id TYPE /dmo/airport_from_id,     " campo 1
             airport_to_id   TYPE /dmo/airport_to_id,       " campo 2
             carrier_name    TYPE /dmo/carrier_name,        " campo 3
           END OF st_connection.                            " fin de la estructura st_connection

    TYPES: BEGIN OF st_connection_short,                    " creacion de la segunda estructura st_connection_short
             DepartureAirport   TYPE /dmo/airport_from_id,  " campo 1
             DestinationAirport TYPE /dmo/airport_to_id,    " campo 2
           END OF st_connection_short.                      " fin de la estructura st_connection_short


    DATA connection TYPE st_connection.                     " variable connection con forma de la primera estrcutura

    DATA connection_short TYPE st_connection_short.         " variable connection_short con forma de la segunda estrcutura

    DATA connection_full TYPE /DMO/I_Connection.            " variable connection_full con forma de la estrctura /DMO/I_Connection

* Example 1: Correspondence between FIELDS and INTO
* Ejemplo 1: Correspondencia entre FIELDS y INTO
**********************************************************************

    SELECT SINGLE                                                   " selecciona solo un registro
       FROM /DMO/I_Connection                                       " donde la tabla sea
     FIELDS DepartureAirport, DestinationAirport, \_Airline-Name    " selecciona 3 campos
      WHERE AirlineID = 'LH'                                        " donde se encuentre LH
        AND ConnectionID = '0400'                                   " y se encuentre 0400
       INTO @connection.                                            " guardalo la consulta en @connection

    out->write(  `------------------------------` ).
    out->write(  `Example 1: Field List and INTO` ).
    out->write( connection ).                                        " imprime solo 3 campos

* Example 2: FIELDS *
* Ejemplo 2: CAMPOS *
**********************************************************************

    SELECT SINGLE                                           " seleciona un registro
      FROM /DMO/I_Connection                                " donde la tabla sea
    FIELDS *                                                " el * sirve para referenciar todo los campos seleccionar todos los campos
     WHERE AirlineID = 'LH'                                 " donde se encuentre lh
       AND ConnectionID = '0400'                            " y se encuentre 0400
      INTO @connection_full.                                " guardamos la consulta en @connection_full

    out->write(  `----------------------------` ).
    out->write(  `Example 2: FIELDS * and INTO` ).
    out->write( connection_full ).                          " imprime 8 campos de la estructura completa

* Example 3: INTO CORRESPONDING FIELDS
* Ejemplo 3: EN LOS CAMPOS CORRESPONDIENTES
**********************************************************************

    SELECT SINGLE                                           " selecciona un campo
      FROM /DMO/I_Connection                                " donde la tabla sea
    FIELDS *                                                " seleccion de todos los campos(columnas)
     WHERE AirlineID    = 'LH'                              " donde conisida LH
       AND ConnectionID = '0400'                            " y tenga 0400
      INTO CORRESPONDING FIELDS OF @connection_short.       " guardalos en su campo correspondiente en la estructura @connection_short

    out->write(  `----------------------------------------------------` ).
    out->write(  `Example 3: FIELDS * and INTO CORRESPONDING FIELDS OF` ).
    out->write( connection_short ).                         " imprime 2 camnpos ordenados

* Example 4: Alias Names for Fields
* Ejemplo 4: Nombres de alias para campos
**********************************************************************

    CLEAR connection.                                       " limpiamos la estrcutra

    SELECT SINGLE                                           " seleccionamos un registro
      FROM /DMO/I_Connection                                " donde la tabla sea
    FIELDS DepartureAirport AS airport_from_id,             " selecciona las campos (columas) y usamos as como nombre de alias
           \_Airline-Name   AS carrier_name                 " usamos el alias para  cambair el nombre del campo
     WHERE AirlineID    = 'LH'                              " donde se ecmiemtre LH
       AND ConnectionID = '0400'                            " y tenga 0400
      INTO CORRESPONDING FIELDS OF @connection.             " guarda en sus campos correspondientes en la estrctura  @connection.

    out->write(  `---------------------------------------------------` ).
    out->write(  `Example 4: Aliases and INTO CORRESPONDING FIELDS OF` ).
    out->write( connection ).                               " imprime 3 campos

* Example 5: Inline Declaration
* Ejemplo 5: Declaración en línea
**********************************************************************

    SELECT SINGLE                                           " seleccionamos un registro
      FROM /DMO/I_Connection                                " donde la tabla sea
    FIELDS DepartureAirport,                                " seleccionamos los campos (columas)
           DestinationAirport AS ArrivalAirport,            " seleccionamos los campos (columas) y cambiamos el alias
           \_Airline-Name     AS carrier_name               " seleccionamos los campos (columas) y cambiamos el alias
     WHERE AirlineID    = 'LH'                              " donde se encuentre LH
       AND ConnectionID = '0400'                            " donde se encuentre 0400
      INTO @DATA(connection_inline).                        " guardamos toda la consulta en una sola linea  creando la variable en el momento

    out->write(  `-----------------------------------------` ).
    out->write(  `Example 5: Aliases and Inline Declaration` ).
    out->write( connection_inline ).                        " imprime 3 campos  que estan contenidos en una sola linea o variable

* Example 6: Joins
* Ejemplo 6: Uniones
**********************************************************************

    SELECT SINGLE                                           " selecciona un registro
      FROM (  /dmo/connection AS c                          " donde la tabla 1 se identifique como C
      LEFT OUTER JOIN /dmo/airport AS f                     " unimos la tabla 2 se identifique como F
        ON c~airport_from_id = f~airport_id )               " El propósito de la cláusula ON es especificar las condiciones de unión, es decir, definir cómo se deben unir las tablas.
      LEFT OUTER JOIN /dmo/airport AS t                     " unimos la tabla 3 se identifique como t
        ON c~airport_to_id = t~airport_id                   " El propósito de la cláusula ON es especificar las condiciones de unión, es decir, definir cómo se deben unir las tablas.
    FIELDS c~airport_from_id, c~airport_to_id,              " seleccionamos los campos de las tablas con sus identificadores correspondientes
           f~name AS airport_from_name, t~name AS airport_to_name   " cambiamos el alias de los campos
     WHERE c~carrier_id    = 'LH'                           " donde se encuentre LH
       AND c~connection_id = '0400'                         " donde se encuentre 0400
      INTO @DATA(connection_join).                          " guardamos toda la consulta en una sola linea  creando la variable en el momento

    out->write(  `------------------------------------------` ).
    out->write(  `Example 6: Join of Connection and Airports` ).
    out->write(  `Ejemplo 6: Unión de Conexión y Aeropuertos` ).
    out->write( connection_join ).                          " imprime 4 campos  que estan contenidos en una sola linea o variable

* Nota LEFT JOIN
* se una operación LEFT JOIN para crear una combinación externa izquierda.
* Estas combinaciones incluyen todos los registros de la primera (izquierda) de dos tablas,
* incluso si no hay valores coincidentes para los registros en la segunda tabla (derecha).

"
  ENDMETHOD.
ENDCLASS.
