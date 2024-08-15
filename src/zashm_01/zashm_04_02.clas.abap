CLASS zashm_04_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zashm_04_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Example 1 : Motivation for Structured Variables
* Example 1 : Motivación para variables estructuradas
**********************************************************************

    DATA connection_full TYPE /DMO/I_Connection.    "creamos una variable que tendra una forma  de estructura de la tabla

    SELECT SINGLE                                   " Instrucción Open SQL utilizada para leer un registro de una tabla de base de datos
     FROM   /dmo/I_Connection                       " Tabla
   FIELDS   AirlineID, ConnectionID,                " 2 campos
            DepartureAirport, DestinationAirport,   " 2 campos
            DepartureTime, ArrivalTime,             " 2 campos
            Distance, DistanceUnit                  " 2 campos
    WHERE AirlineId    = 'LH'                       " Donde se enceuntre LH
      AND ConnectionId = '0400'                     " Donde se encuentre 0400
     INTO @connection_full.                         " Guardamos en la estructura creada anteriormente

    out->write(  `--------------------------------------` ).
    out->write(  `Example 1: CDS View as Structured Type` ).
    out->write( connection_full ).                  " Imprimimos nuestra variable(estructura)

* Example 2: Global Structured Type
* Ejemplo 2: Tipo estructurado global
**********************************************************************

    DATA message TYPE symsg.

    out->write(  `---------------------------------` ).
    out->write(  `Example 2: Global Structured Type` ).
    out->write( message ).

* Example 3 : Local Structured Type
* Ejemplo 3: Tipo estructurado local
**********************************************************************

    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    DATA connection TYPE st_connection.

    SELECT SINGLE
      FROM /DMO/I_Connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
     WHERE AirlineID = 'LH'
       AND ConnectionID = '0400'
      INTO @connection.

    out->write(  `---------------------------------------` ).
    out->write(  `Example 3: Local Structured Type` ).
    out->write( connection ).

* Example 4 : Nested Structured Type
* Ejemplo 4: Tipo estructurado anidado
**********************************************************************

    TYPES: BEGIN OF st_nested,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             message         TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_nested.

    DATA connection_nested TYPE st_nested.

    out->write(  `---------------------------------` ).
    out->write(  `Example 4: Nested Structured Type` ).
    out->write( connection_nested ).


  ENDMETHOD.
ENDCLASS.
