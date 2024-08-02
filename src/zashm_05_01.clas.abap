CLASS zashm_05_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zashm_05_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES:
           BEGIN OF st_connection,                          " Creamos una estructura con nombre st_connection
             carrier_id      TYPE /dmo/carrier_id,          " campo 1
             connection_id   TYPE /dmo/connection_id,       " campo 2
             airport_from_id TYPE /dmo/airport_from_id,     " campo 3
             airport_to_id   TYPE /dmo/airport_to_id,       " campo 4
             carrier_name    TYPE /dmo/carrier_name,        " finalizamos la creacion de la estructura st_connection
           END OF st_connection.


* Example 1 : Simple and Complex Internal Table
* Ejemplo 1: Tabla interna simple y compleja
**********************************************************************

    " simple table (scalar row type)
    " tabla simple (tipo fila escalar)
    DATA numbers TYPE TABLE OF i.                                   " variable que es una tabla de tipo i

    append 1234 to numbers.
    append 456 to numbers.
    append 12 to numbers.
    append 8976 to numbers.
    append 27 to numbers.
    append 789 to numbers.


    "Ejemplo de la tabla simple

*       ----------------|
*       |    1234       |   |
*       |---------------|   |
*       |    456        |   |
*       |---------------|   |
*       |    12         |   |
*       |---------------|   |
*       |    8976       |   |
*       |---------------|   |
*       |    27         |   |
*       |---------------|   |
*       |    789        |   v
*       |---------------|
*
**********************************************************************

    " complex table (structured row type)
    " tabla compleja (tipo de fila estructurada)
    DATA connections TYPE TABLE OF st_connection.                   " variable que es una tabla compleja que tiene la forma de la estructura

        APPEND value #(  carrier_id         = 'NN'
                         connection_id      = '1234'
                         airport_from_id    = 'ABC'
                         airport_to_id      = 'XYZ'
                         carrier_name       = 'JAPAN AIRLINES '
                         )
                to connections.

        APPEND value #(  carrier_id         = 'AA'
                         connection_id      = '0017'
                         airport_from_id    = 'MIA'
                         airport_to_id      = 'HAV'
                         carrier_name       = 'AMERICAN AIRLINES'
                         )
                to connections.

         APPEND value #( carrier_id         = 'SQ'
                         connection_id      = '0001'
                         airport_from_id    = 'SFO'
                         airport_to_id      = 'SIN'
                         carrier_name       = 'SINGAPORE AIRLNES '
                         )
                to connections.

         APPEND value #( carrier_id         = 'LH'
                         connection_id      = '0400'
                         airport_from_id    = 'FRA'
                         airport_to_id      = 'JFK'
                         carrier_name       = 'DEUTSCHE LUFTHANSA'
                         )
                to connections.

*   carrier_id  |connection_id  |airport_from_id    |airport_to_id  |carrier_name
*   -----------------------------------------------------------------------------------------
*   |  JL       |   0408        |  FRA              |   NRT         | JAPAN AIRLINES        |
*   -----------------------------------------------------------------------------------------
*   |  AA       |   0017        |  MIA              |   HAV         | AMERICAN AIRLINES     |
*   -----------------------------------------------------------------------------------------
*   |  SQ       |   0001        |  SFO              |   SIN         | SINGAPORE AIRLNES     |
*   -----------------------------------------------------------------------------------------
*   |  LH       |   0400        |  FRA              |   JFK         | DEUTSCHE LUFTHANSA    |
*   -----------------------------------------------------------------------------------------


*   Impresion
**********************************************************************
    out->write(  `--------------------------------------------` ).
    out->write(  `Ejemplo 1: tabla interna simple y compleja` ).
    out->write( data = numbers
                name = `Tabla de NÚMEROS simples:` ).
    out->write(  `--------------------------------------------` ).
    out->write(  `Ejemplo 2: tabla interna simple y compleja` ).
    out->write( data = connections
                name = `Tabla compleja CONEXIONES::` ).

* Example 2 : Complex Internal Tables
* Ejemplo 2: Tablas internas complejas
**********************************************************************

    " standard table with non-unique standard key (short form)
    " tabla estándar con clave estándar no única (forma abreviada)
    DATA connections_1 TYPE TABLE OF st_connection.


    " standard table with non-unique standard key (explicit form)
    " tabla estándar con clave estándar no única (forma explícita)
    DATA connections_2 TYPE STANDARD TABLE OF st_connection
                            WITH NON-UNIQUE DEFAULT KEY.

    " sorted table with non-unique explicit key
    " tabla ordenada con clave explícita no única
    DATA connections_3  TYPE SORTED TABLE OF st_connection
                             WITH NON-UNIQUE KEY airport_from_id
                                                 airport_to_id.

    " sorted hashed with unique explicit key
    " ordenado con hash con clave explícita única
    DATA connections_4  TYPE HASHED TABLE OF st_connection
                             WITH UNIQUE KEY carrier_id
                                             connection_id.

* Example 3 : Local Table Type
* Ejemplo 3: Tipo de tabla local
**********************************************************************

    TYPES tt_connections TYPE SORTED TABLE OF st_connection
                              WITH UNIQUE KEY carrier_id
                                              connection_id.


    DATA connections_5 TYPE tt_connections.

* Example 4 : Global Table Type
* Ejemplo 4: Tipo de tabla global
**********************************************************************

    DATA flights  TYPE /dmo/t_flight.

    out->write(  `------------------------------------------` ).
    out->write(  `Example 4: Global Table TYpe /DMO/T_FLIGHT` ).
    out->write(  data = flights
                 name = `Internal Table FLIGHTS:` ).


  ENDMETHOD.
ENDCLASS.
