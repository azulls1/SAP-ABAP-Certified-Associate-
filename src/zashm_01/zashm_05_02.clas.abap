CLASS zashm_05_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZASHM_05_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES tt_connections TYPE STANDARD TABLE OF   st_connection
                              WITH NON-UNIQUE KEY carrier_id
                                                  connection_id.

    DATA connections TYPE tt_connections.

    TYPES: BEGIN OF st_carrier,
             carrier_id    TYPE /dmo/carrier_id,
             carrier_name  TYPE /dmo/carrier_name,
             currency_code TYPE /dmo/currency_code,
           END OF st_carrier.

    TYPES tt_carriers TYPE STANDARD TABLE OF st_carrier
                          WITH NON-UNIQUE KEY carrier_id.

    DATA carriers TYPE tt_carriers.

* Example 1: APPEND with structured data object (work area)
* Ejemplo 1: APPEND con objeto de datos estructurados (área de trabajo)
**********************************************************************

*    DATA connection  TYPE st_connection.

    " Declare the work area with LIKE LINE OF
    " Declare el área de trabajo con LIKE LINE OF
    DATA connection LIKE LINE OF connections.
* LIKE LINE OF significa que la variable será del tipo de línea de tabla.
* LIKE significa que la variable será exactamente del mismo tipo que la que sesiona después de esta palabra clave.


*    connection-carrier_id       = 'NN'.
*    connection-connection_id    = '1234'.
*    connection-airport_from_id  = 'ABC'.
*    connection-airport_to_id    = 'XYZ'.
*    connection-carrier_name     = 'My Airline'.

    " Use VALUE #( ) instead assignment to individual components
    " Utilice VALUE #( ) en lugar de asignar componentes individuales
    connection = VALUE #( carrier_id       = 'NN'
                          connection_id    = '1234'
                          airport_from_id  = 'ABC'
                          airport_to_id    = 'XYZ'
                          carrier_name     = 'My Airline' ).

    APPEND connection TO connections.

    out->write(  `--------------------------------` ).
    out->write(  `Example 1: APPEND con área de trabajo` ).
    out->write(  connections ).

* Example 2: APPEND with VALUE #( ) expression
* Ejemplo 2: APPEND con expresión VALUE #( )
**********************************************************************

    APPEND VALUE #( carrier_id       = 'NN'
                    connection_id    = '1234'
                    airport_from_id  = 'ABC'
                    airport_to_id    = 'XYZ'
                    carrier_name     = 'My Airline'
                  )
       TO connections.

    out->write(  `----------------------------` ).
    out->write(  `Ejemplo 2: APPEND con VALUE` ).
    out->write(  connections ).

* Example 3: Filling an Internal Table with Several Rows
* Ejemplo 3: Llenar una tabla interna con varias filas
**********************************************************************

    carriers = VALUE #(  (  carrier_id = 'AA' carrier_name = 'American Airlines' )
                         (  carrier_id = 'JL' carrier_name = 'Japan Airlines'    )
                         (  carrier_id = 'SQ' carrier_name = 'Singapore Airlines' )
                      ).

    out->write(  `-----------------------------------------` ).
    out->write(  `Ejemplo 3: llenar la tabla interna con VALUE` ).
    out->write(  carriers ).

* Example 4: Filling one Internal Table from Another
* Ejemplo 4: Llenar una tabla interna a partir de otra
**********************************************************************

    connections = CORRESPONDING #( carriers ).

    out->write(  `--------------------------------------------` ).
    out->write(  `Ejemplo 4: CORRESPONDING para Tablas Internas` ).
    out->write(  data = carriers
                 name = `Tabla de origen CARRIERS:` ).
    out->write(  data = connections
                 name = `Tabla de destino CONNECTIONS:` ).


  ENDMETHOD.
ENDCLASS.
