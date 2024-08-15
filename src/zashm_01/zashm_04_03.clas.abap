CLASS zashm_04_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zashm_04_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,                          " primera estructura st_connection
             airport_from_id TYPE /dmo/airport_from_id,     " campo 1
             airport_to_id   TYPE /dmo/airport_to_id,       " campo 2
             carrier_name    TYPE /dmo/carrier_name,        " campo 3
           END OF st_connection.                            " primera estructura st_connection

    TYPES: BEGIN OF st_connection_nested,                   " segunda estructura st_connection_nested
             airport_from_id TYPE /dmo/airport_from_id,     " campo 1
             airport_to_id   TYPE /dmo/airport_to_id,       " campo 2
             message         TYPE symsg,                    " campo 3 contiene una estructura dentro de esta estructura
             carrier_name    TYPE /dmo/carrier_name,        " campo 4
           END OF st_connection_nested.                     " segunda estructura st_connection_nested

    DATA connection TYPE st_connection.                     " variable que tiene la forma de la primera estructura
    DATA connection_nested TYPE st_Connection_nested.       " variable que tiene la forma de la segunda estructura

* Example 1: Access to structure components
* Ejemplo 1: acceso a los componentes de la estructura
**********************************************************************

    connection-airport_from_id = 'ABC'.                     " asginamos un dato al campo 1
    connection-airport_to_id   = 'XYZ'.                     " asginamos un dato al campo 2
    connection-carrier_name    = 'My Airline'.              " asginamos un dato al campo 3

    "Access to sub-components of nested structure
    "Acceso a subcomponentes de estructura anidada
    connection_nested-message-msgty = 'E'.                  " asginamos un dato al campo 3 en su campo 1
    connection_nested-message-msgid = 'ABC'.                " asginamos un dato al campo 3 en su campo 2
    connection_nested-message-msgno = '123'.                " asginamos un dato al campo 3 en su campo 3

* Example 2: Filling a structure with VALUE #(    ).
* Ejemplo 2: Rellenar una estructura con value #( ).
**********************************************************************

  CLEAR connection.                                         " limpiamos nuestra variable que contiene nuestra estructura

    connection = VALUE #( airport_from_id = 'ABC'           " asignamos una dato al campo 1
                          airport_to_id   = 'XYZ'           " asignamos una dato al campo 2
                          carrier_name    = 'My Airline'    " asignamos una dato al campo 3
                        ).

    " Nested VALUE to fill nested structure
    " Nested VALUE para llenar la estructura anidada        (un value dentro de otro value para acceder a la otra estructura)
    connection_nested = VALUE #( airport_from_id = 'ABC'                    " asignamos una dato al campo 1
                                 airport_to_id   = 'XYZ'                    " asignamos una dato al campo 2
                                 message         = VALUE #( msgty = 'E'         " asignamos un dato al campo 3 en su campo 1
                                                            msgid = 'ABC'       " asignamos un dato al campo 3 en su campo 2
                                                            msgno = '123' )     " asignamos un dato al campo 3 en su campo 3
                                 carrier_name    = 'My Airline'             " asignamos una dato al campo 4
                         ).

* Example 3: Wrong result after direct assignment
* Ejemplo 3: resultado incorrecto después de la asignación directa
**********************************************************************

    connection_nested = connection.     "error no se asinga en sus campos correspondientes

    out->write(  `-------------------------------------------------------------` ).
    out->write(  `Example 3: Resultado incorrecto después de la asignación directa` ).

    out->write( data = connection
                name = `Source Structure:` ).

    out->write( |Component connection_nested-message-msgid: { connection_nested-message-msgid }| ).
    out->write( |Component connection_nested-carrier_name : { connection_nested-carrier_name  }| ).

* Example 4: Assigning Structures using CORRESPONDING #( )
* Ejemplo 4: Asignación de estructuras usando # CORRESPONDIENTE ( )
**********************************************************************
    CLEAR connection_nested.
    connection_nested = CORRESPONDING #(  connection ).  "asingna los valores en sus campos correspondientes

    out->write(  `-------------------------------------------------------------` ).
    out->write(  `Example 4: Resultado correcto después de la asignación con CORRESPONDIENTE` ).

    out->write( data = connection
                name = `Source Structure:` ).

    out->write( |Component connection_nested-message-msgid: { connection_nested-message-msgid }| ).
    out->write( |Component connection_nested-carrier_name : { connection_nested-carrier_name  }| ).

  ENDMETHOD.
ENDCLASS.
