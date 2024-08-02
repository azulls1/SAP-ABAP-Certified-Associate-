*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.

    CLASS-DATA conn_counter TYPE i VALUE 0 READ-ONLY. "creamos una variable(atributo) de tipo estatico


    METHODS constructor                             "Inicio del metodo constructor
        IMPORTING                                   "define los parametros de entrada los datos que resiviran
        i_carrier_id TYPE /dmo/carrier_id           "variable 1 que se resive y se guarda en i_carrier_id
        i_connection_id TYPE /dmo/connection_id     "variable 2 que se resive y se guarda en i_connection_id
      RAISING CX_ABAP_INVALID_VALUE.                "para errores

    METHODS get_output                              "metodo para obtener los datos de impresion
      RETURNING VALUE(r_output) TYPE string_table.

  PRIVATE SECTION.
* Attributes
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    TYPES:
        BEGIN OF st_details,
            DepartureAirport TYPE /dmo/airport_from_id,
            DestinationAirport TYPE /dmo/airport_to_id,
            AirlineName TYPE /dmo/carrier_name,
        END OF st_details.
    DATA details TYPE st_details.


ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.       "si los campos no estan iniciados (vacios entra)
      RAISE EXCEPTION TYPE cx_abap_invalid_value.                   "regresa un error
    ENDIF.                                                          "fin continua si estan iniciados los datos

    SELECT SINGLE                                                   "selecciona un campo
    FROM /dmo/I_Connection                                          "de la tabla /dmo/I_Connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name     "seleccionamos 3 campos
    WHERE AirlineID    = @i_carrier_id                              "donde la variable 1 que pasaron se encuentre en la tabla
    AND ConnectionID = @i_connection_id                             "donde la variable 2 que pasaron se encuentre en la tabla
    INTO @details.                                                  "guarda los datos en @details

    IF sy-subrc <> 0.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.
    conn_counter += 1.

  ENDMETHOD.


  METHOD get_output.

    APPEND |------------------------------|                 TO r_output.
    APPEND |Carrier:     { carrier_id } { details-airlinename }|   TO r_output.
    APPEND |Connection:  { connection_id }|                 TO r_output.
    APPEND |Departure airport:     { details-departureairport }|     TO r_output.
    APPEND |Destination airport:  { details-destinationairport }|        TO r_output.

  ENDMETHOD.

ENDCLASS.


*Constructor de instancia = El constructor es un método de instancia especial en una clase y siempre se llama CONSTRUCTOR.
*El constructor se llama automáticamente en tiempo de ejecución con la instrucción CREATE OBJECT.
*Algunos puntos importantes sobre el constructor:
*Cada clase puede tener solo un constructor.
*El constructor debe definirse en la SECCIÓN PÚBLICA.
*La firma del constructor solo puede tener parámetros de importación y excepciones.
*Cuando se generan excepciones en el constructor, las instancias no se crean y no se ocupa memoria principal.
*Constructor estático = Este es un método estático especial en una clase y siempre se llama CLASS_CONSTRUCTOR.
*Se ejecuta una vez por programa. Este constructor se llama automáticamente antes de que la clase sea accedida por primera vez,
*pero antes de que se ejecuten cualquiera de las siguientes acciones por primera vez:
*Crear una instancia de esta clase (CREATE OBJECT)
*Acceder a un atributo estático de esta clase.
*Llamar a un método estático de esta clase.
*Registrar un método controlador de eventos para un evento en esta clase.
*Algunos puntos importantes:
*Cada clase tiene solo un constructor estático.
*Este constructor debe definirse en la SECCIÓN PÚBLICA.
*La firma del constructor no puede tener parámetros de importación o excepciones.
*El constructor estático no puede ser llamado explícitamente.
*
