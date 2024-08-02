CLASS zashm_05_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zashm_05_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  TYPES: BEGIN OF st_connection,                            " declaracion de una estructura local st_connection
             carrier_id      TYPE /dmo/carrier_id,          " campo 1
             connection_id   TYPE /dmo/connection_id,       " campo 2
             airport_from_id TYPE /dmo/airport_from_id,     " campo 3
             airport_to_id   TYPE /dmo/airport_to_id,       " campo 4
             carrier_name    TYPE /dmo/carrier_name,        " campo 5
           END OF st_connection.                            " fin de la estrctura st_connection

    TYPES tt_connections TYPE SORTED TABLE OF   st_connection       " asignamos a tt_conection la tabla local le damos forma ordenada con clave explícita no única
                              WITH NON-UNIQUE KEY carrier_id        " que las llaves primarias no sean unicas  permite duplicados de estos campos
                                                  connection_id.    " permite que halla duplicado en estos campos y son llaves primarias

    DATA connections TYPE tt_connections.                   " creamos una variable que viene siento una tabla interna y tendra la forma de la estructura tt_connections
    DATA connection  LIKE LINE OF connections.              " LIKE LINE OF significa que la variable será del tipo de línea de tabla, es una area de trabajo.

    TYPES: BEGIN OF st_carrier,
             carrier_id    TYPE /dmo/carrier_id,
             currency_code TYPE /dmo/currency_code,
           END OF st_carrier.

    DATA carriers TYPE STANDARD TABLE OF st_carrier
                       WITH NON-UNIQUE KEY carrier_id.

    DATA carrier LIKE LINE OF carriers.


   DATA: text TYPE string.

* Preparation: Fill internal tables with data
* Preparación: Llenar tablas internas con datos
**********************************************************************
    connections = VALUE #(  ( carrier_id      = 'JL'
                              connection_id   = '0408'
                              airport_from_id = 'FRA'
                              airport_to_id   = 'NRT'
                              carrier_name    = 'Japan Airlines'
                            )
                            ( carrier_id      = 'AA'
                              connection_id   = '0017'
                              airport_from_id = 'MIA'
                              airport_to_id   = 'HAV'
                              carrier_name    = 'American Airlines'
                            )
                            ( carrier_id      = 'SQ'
                              connection_id   = '0001'
                              airport_from_id = 'SFO'
                              airport_to_id   = 'SIN'
                              carrier_name    = 'Singapore Airlines'
                            )
                            ( carrier_id      = 'UA'
                              connection_id   = '0078'
                              airport_from_id = 'SFO'
                              airport_to_id   = 'SIN'
                              carrier_name    = 'United Airlines'
                            )
                           ).

    carriers = VALUE #(  (  carrier_id    = 'SQ'
                            currency_code = ' '
                         )
                         (  carrier_id    = 'JL'
                            currency_code = ' '
                         )
                         (  carrier_id    = 'AA'
                            currency_code = ' '
                         )
                         (  carrier_id    = 'UA'
                            currency_code = ' '
                         )
                      ).

* Example 1: Table Expression with Key Access
* Ejemplo 1: Expresión de tabla con acceso clave
**********************************************************************
    out->write(  `***********************************************` ).
    out->write(  `Ejemplo 1: expresiones de tabla con acceso clave` ).

    out->write(  data = connections
                 name = `Internal Table CONNECTIONS: ` ).

    " with key fields
    " con campos clave
    out->write(  ` ` ).
    out->write(  `--------------------------------------------` ).
    out->write(  `Ejemplo 1.1: con campos clave` ).
    connection = connections[ carrier_id    = 'SQ'
                              connection_id = '0001' ].
    out->write(  data = connection
                 name = `CARRIER_ID = 'SQ' AND CONNECTION_ID = '001':` ).

    " with non-key fields
    " con campos no clave
    out->write(  ` ` ).
    out->write(  `--------------------------------------------` ).
    out->write(  `Ejemplo 1.2: con campos no clave` ).
    connection = connections[ airport_from_id = 'SFO'
                              airport_to_id   = 'SIN' ].
    out->write(  data = connection
                 name = `AIRPORT_FROM_ID = 'SFO' AND AIRPORT_TO_ID = 'SIN':` ).

* Example 2: LOOP with key access
**********************************************************************
    out->write(  ` ` ).
    out->write(  `********************************************` ).
    out->write(  `Example 2: LOOP en acceso clave` ).

    LOOP AT connections INTO connection                 " recorremos nuestra tabla y guardamos el resultado en connection que solo representa una fila
                       WHERE airport_from_id <> 'MIA'.  " donde airport_from_id sea diferente de MIA lo cual  descartara esa fila de la tabla


      "do something with the content of connection
      "hacer algo con el contenido de la conexión
      out->write(  ` ` ).                                " imprimimos un campo con espacio
*      out->write(  |`Example 2.`{ sy-index }  | ).       "
*SY-INDEX se utiliza para describir el número de iteración en el DO..ENDDO, WHILE...ENDWHILE....
*SY-TABIX se utiliza para definir la iteración con la tabla interna como entre LOOP AT y ENDLOOP.

      out->write( data = connection
                  name = |Este es el número de fila. { sy-tabix }: | ).

    ENDLOOP.

* Example 3: MODIFY TABLE (key access)
* Ejemplo 3: MODIFICAR TABLA (acceso clave)
**********************************************************************

    out->write(  ` ` ).
    out->write(  `*******************************************` ).
    out->write(  `Example 3: MODIFICAR TABLA (acceso clave` ).

    out->write(  data = carriers
                 name = `Tabla CARRRIERS antes de MODIFICAR la TABLA:` ).

    carrier = carriers[  carrier_id = 'JL' ].           " encontramos su campo con clave jl
    carrier-currency_code = 'JPY'.                      " en el campo currency_code le asignamos un valor jpy
    MODIFY TABLE carriers FROM carrier.                 " modifcamos la tabla carriers

    out->write(  ` ` ).
    out->write(  data = carriers
                 name = `Tabla CARRRIERS despues de MODIFICAR la TABLA:` ).

* Example 4: MODIFY (index access)
* Ejemplo 4: MODIFICAR (acceso al índice)
**********************************************************************

    out->write(  ` ` ).
    out->write(  `******************************************` ).
    out->write(  `Example 4: MODIFICAR (acceso al índice)` ).

    carrier-carrier_id    = 'LH'.
    carrier-currency_code = 'EUR'.
    MODIFY carriers FROM carrier INDEX 1.                   " modificaremos el carriers con los valores de carrier en la tabla de su indice 1(fila 1)

    out->write(  data = carriers
                 name = `Tabla CARRRIERS después de MODIFICAR:` ).

* Example 5: MODIFY in a LOOP
* Ejemplo 5: MODIFICAR en un BUCLE
**********************************************************************
    out->write(  ` ` ).
    out->write(  `*******************************************` ).
    out->write(  `Example 5: MODIFICAR en un LOOP` ).

    LOOP AT carriers INTO carrier
                    WHERE currency_code IS INITIAL.   "detectamos los campos currency_code que no este inicializados

      carrier-currency_code = 'USD'.                  " asignamos valor al campo
      MODIFY carriers FROM carrier.                   " modificamos la tabla

    ENDLOOP.

    out->write(  data = carriers
                 name = `Tabla CARRRIERS después del LOOP:` ).


  ENDMETHOD.
ENDCLASS.
