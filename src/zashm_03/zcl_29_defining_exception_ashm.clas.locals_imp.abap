*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
" Definición de la clase de excepción lcx_no_connection que hereda de cx_static_check
CLASS lcx_no_connection DEFINITION INHERITING FROM cx_static_Check.
  PUBLIC SECTION.
    INTERFACES if_t100_message. " Implementa la interfaz estándar de manejo de mensajes T100

    " Definición del método constructor para inicializar la excepción
    METHODS constructor
      IMPORTING
        textid           LIKE if_t100_message=>t100key OPTIONAL " ID del mensaje opcional
        previous         LIKE previous OPTIONAL          " Excepción previa opcional
        airlineid        TYPE /dmo/carrier_id OPTIONAL   " ID de la aerolínea opcional
        connectionnumber TYPE /dmo/connection_id OPTIONAL. " Número de conexión opcional

    " Definición de constantes relacionadas con los mensajes
    CONSTANTS:
      BEGIN OF lcx_no_connection,
        msgid TYPE symsgid VALUE 'ZS4D401_EXCEPTI_ASHM', " ID del mensaje (custom)
        msgno TYPE symsgno VALUE '001',                  " Número del mensaje
        attr1 TYPE scx_attrname VALUE 'AIRLINEID',       " Atributo 1: ID de la aerolínea
        attr2 TYPE scx_attrname VALUE 'CONNECTIONNUMBER', " Atributo 2: Número de conexión
        attr3 TYPE scx_attrname VALUE 'attr3',           " Atributo adicional 3
        attr4 TYPE scx_attrname VALUE 'attr4',           " Atributo adicional 4
      END OF lcx_no_connection.

    " Declaración de datos de la clase para almacenar el ID de la aerolínea y el número de conexión
    DATA airlineid TYPE /dmo/carrier_id READ-ONLY. " ID de la aerolínea (solo lectura)
    DATA connectionnumber TYPE /dmo/connection_id READ-ONLY. " Número de conexión (solo lectura)

ENDCLASS.

" Implementación de la clase lcx_no_connection
CLASS lcx_no_Connection IMPLEMENTATION.

  " Implementación del método constructor
  METHOD constructor.
    " Llamada al constructor de la clase base (superclase)
    super->constructor( previous = previous ).

    " Asignar los valores de airlineid y connectionnumber
    me->airlineid = airlineid.
    me->connectionnumber = connectionnumber.

    " Limpiar el campo textid
    CLEAR me->textid.
    " Si no se proporciona un ID de mensaje, usar el ID de mensaje por defecto
    IF textid IS INITIAL.
      if_t100_message~t100key = lcx_no_connection.
    ELSE.
      " Si se proporciona un ID de mensaje, asignarlo
      if_t100_message~t100key = textid.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

" Definición de la clase lcl_connection para manejar conexiones de aerolíneas
CLASS lcl_connection DEFINITION.
  PUBLIC SECTION.
    " Método constructor para inicializar una conexión
    METHODS constructor
      IMPORTING
                i_airlineid        TYPE /dmo/carrier_id       " ID de la aerolínea
                i_connectionnumber TYPE /dmo/connection_id    " Número de conexión
      RAISING   lcx_no_connection.                           " Puede lanzar una excepción si no encuentra conexión

  PRIVATE SECTION.
    " Variables privadas para almacenar datos de la conexión
    DATA AirlineId TYPE /dmo/carrier_id.              " ID de la aerolínea
    DATA ConnectionNumber TYPE /dmo/connection_id.    " Número de conexión
    DATA fromAirport TYPE /dmo/airport_from_id.       " Aeropuerto de origen
    DATA toAirport TYPE /dmo/airport_to_id.           " Aeropuerto de destino
ENDCLASS.

" Implementación de la clase lcl_connection
CLASS lcl_Connection IMPLEMENTATION.

  " Implementación del método constructor
  METHOD constructor.
    DATA fromairport TYPE /dmo/airport_from_Id. " Variable local para almacenar el aeropuerto de origen
    DATA toairport TYPE /dmo/airport_to_id.     " Variable local para almacenar el aeropuerto de destino

    " Intentar seleccionar los datos de la conexión desde la base de datos
    SELECT SINGLE FROM /dmo/connection
    FIELDS airport_from_id, airport_to_id
    WHERE carrier_id = @i_airlineid
    AND connection_id = @i_connectionnumber
    INTO ( @fromairport, @toairport ).

    " Si no se encuentra la conexión (sy-subrc diferente de 0), lanzar una excepción
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE lcx_no_connection
        EXPORTING
          airlineid        = i_airlineid        " Pasar el ID de la aerolínea
          connectionnumber = i_connectionnumber. " Pasar el número de conexión
    ELSE.
      " Si la conexión se encuentra, asignar los valores a los atributos de la clase
      me->connectionnumber = i_connectionnumber.
      me->fromairport = fromairport.
      me->toairport = toairport.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
