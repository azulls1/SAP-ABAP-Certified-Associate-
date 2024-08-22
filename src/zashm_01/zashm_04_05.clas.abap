CLASS zashm_04_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZASHM_04_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS c_carrier_id TYPE /dmo/carrier_id       VALUE 'LH'.       "c_carrier_id = LH
    CONSTANTS c_connection_id TYPE /dmo/connection_id VALUE '0400'.     "c_connection_id = 0400

    DATA connection  TYPE REF TO lcl_connection.            "se crea una estructura
    DATA connections  TYPE TABLE OF REF TO lcl_connection.  "se crea una tabla

* Create Instance
**********************************************************************



* Call Method and Handle Exception
**********************************************************************
    out->write(  |i_carrier_id    = '{ c_carrier_id }' | ).     "imprime la constante 1
    out->write(  |i_connection_id = '{ c_connection_id }'| ).   "imprime la constante 2

    TRY.                                                        "intenta
       connection = NEW #(                                      "creamos la insntancia y guardamos el resultado en connecton
                           i_carrier_id    = 'LH'               "guardamos la variable 1 y la exportamos
                           i_connection_id = '0400'             "guardamos la variable 2 y la exportamos
                         ).                                     "fin

*        connection->set_attributes(
*          EXPORTING
*            i_carrier_id    = 'LH'
*            i_connection_id = '0400'
*        ).

           APPEND connection TO connections.                    "guardamos lo que nos regresa  e

         CATCH cx_abap_invalid_value.
           out->write( `Method call failed` ).
       ENDTRY.

* Second instance
**************************************CLASS-DATA conn_counter TYPE i VALUE 0 READ-ONLY. ********************************
       TRY.
       connection = NEW #(
                           i_carrier_id    = 'AA'
                           i_connection_id = '0017'
                         ).
           APPEND connection TO connections.

         CATCH cx_abap_invalid_value.
           out->write( `Method call failed` ).
       ENDTRY.

* Third instance
**********************************************************************
       TRY.
       connection = NEW #(
                           i_carrier_id    = 'SQ'
                           i_connection_id = '0001'
                         ).
           APPEND connection TO connections.

         CATCH cx_abap_invalid_value.
           out->write( `Method call failed` ).
       ENDTRY.

* Output
**********************************************************************
       LOOP AT connections INTO connection.
         out->write( connection->get_output( ) ).
       ENDLOOP.


  ENDMETHOD.
ENDCLASS.
