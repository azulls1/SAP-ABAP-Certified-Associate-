*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.


    CLASS-DATA conn_counter TYPE i VALUE 0 READ-ONLY.   " creamos una variable estatica de tipo i

    CLASS-METHODS class_constructor.                    " creamos un metodo estatico llamaddo class_constructor


    METHODS constructor                                 " metodo constructor incializacion
      IMPORTING                                         " metodo importing para recibir los datos de class global
        i_carrier_id TYPE /dmo/carrier_id               " recibe el primer  parametro
        i_connection_id TYPE /dmo/connection_id         " recibe el segundo parametro
      RAISING CX_ABAP_INVALID_VALUE.                    " en caso de una exepcion

    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.

* Methods
*    METHODS set_attributes
*      IMPORTING
*        i_carrier_id    TYPE /dmo/carrier_id  DEFAULT 'LH'
*        i_Connection_id TYPE /dmo/connection_id
*      RAISING
*        cx_abap_invalid_value.
  PRIVATE SECTION.

* Attributes
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
*    DATA airport_from_id TYPE /dmo/airport_from_id.
*    DATA airport_to_id TYPE /dmo/airport_to_id.
*    DATA carrier_name TYPE /dmo/carrier_name.

    TYPES:
        BEGIN OF st_details,                                " inicio primera estructura con nombre  st_details
            DepartureAirport TYPE /dmo/airport_from_id,     " campo 1
            DestinationAirport TYPE /dmo/airport_to_id,     " campo 2
            AirlineName TYPE /dmo/carrier_name,             " campo 3
        END OF st_details.                                  " finalizamos la inicializacion de la estructura

    DATA details TYPE st_details.                           " creamos una variable que contendra la estrucutra declarada anteriormente

    TYPES:
        BEGIN OF st_airport,                                " incio de una segunda estrctura con nombre st_airport
            AirportID TYPE /dmo/airport_id,                 " campo 1
            Name TYPE /dmo/airport_name,                    " campo 2
        END OF st_airport.                                  " fin de la segunda estructura

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport WITH NON-UNIQUE DEFAULT KEY.    " declaramos la forma que tendra nuestra estructura  y como se guardaran los datos
    CLASS-DATA airports TYPE tt_airports.                                               " creamos una  variable estatica que tendra la forma de la estructura local


ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

  ENDMETHOD.

  METHOD constructor.                                                       " metodo constructor implementado

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.               " validamos  si los parametros pasados estan inicializados
      RAISE EXCEPTION TYPE cx_abap_invalid_value.                           " en caso de que no esten inicailizados  regresara un error
    ENDIF.                                                                  " fin de la estructura if

    SELECT SINGLE                                                           " selecciona solo un registro
    FROM /dmo/I_Connection                                                  " referenciamos a la tabla
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name             " seleccionamos 3 campos para mostrar
    WHERE AirlineID    = @i_carrier_id AND ConnectionID = @i_connection_id  " donde se encuntre los valores pasados en la tabla de referencia
    INTO @details.                                                          " y guardamos nuestro resultado en @details  la cual contendra  3 campos

    IF sy-subrc <> 0.                                                       " si  la consulta es diferente a 0 la cual indica que fue correcta salta este bloque
        RAISE EXCEPTION TYPE cx_abap_invalid_value.                         " regresara una excepcion
    ENDIF.                                                                  " fin de la validacion para la consulta

    me->carrier_id = i_carrier_id.                                          " igualamos el primer parametro pasados a carrier_id
    me->connection_id = i_connection_id.                                    " igualamos el segundo parametro pasado a connection_id
    conn_counter += 1.                                                      " la variable estatica creada en la parte superior sera un contador que ira sumandose 1 cada vesz que se ejecute este proceso (constructor)


     SELECT FROM /DMO/I_Airport                                             " seleccionamos todo de la tabla /DMO/I_Airport
          FIELDS AirportID, Name                                            " seleccionamos dos campos
            INTO TABLE @airports.                                           " guardamos  el resultado  en @airports declarada en la parte de arriba


  ENDMETHOD.                                                                " fin de nuestro metodo constructor

*  METHOD set_attributes.

*    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
*      RAISE EXCEPTION TYPE cx_abap_invalid_value.
*    ENDIF.
*
*    carrier_id    = i_carrier_id.
*    connection_id = i_connection_id.

*  ENDMETHOD.

  METHOD get_output.


    DATA(departure)   = airports[ airportID = details-departureairport ].

    DATA(destiantion)   = airports[ airportID = details-destinationairport   ].


    APPEND |------------------------------|                 TO r_output.
    APPEND |Carrier:     { carrier_id } { details-airlinename }|   TO r_output.
    APPEND |Connection:  { connection_id }|                 TO r_output.
    APPEND |Departure airport:     { details-departureairport }|     TO r_output.
    APPEND |Destination airport:  { details-destinationairport }|        TO r_output.

    APPEND |Departure:   { details-departureairport   } | TO r_output.
    APPEND |Destination: { details-destinationairport } | TO r_output.


  ENDMETHOD.

ENDCLASS.
