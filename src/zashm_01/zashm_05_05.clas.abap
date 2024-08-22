CLASS zashm_05_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZASHM_05_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS c_carrier_id TYPE /dmo/carrier_id       VALUE 'LH'.       " declaramos una constante con valor LH
    CONSTANTS c_connection_id TYPE /dmo/connection_id VALUE '0400'.     " declaramos una constante con valor 0400

    DATA connection  TYPE REF TO lcl_connection.                        " creamos una variable que tenga  como referencia los datos de lcl_connection
    DATA connections  TYPE TABLE OF REF TO lcl_connection.              " creamos una variable de tipo tabala con la referencia de los datos en lcl_connection

* Create Instance
**********************************************************************



* Call Method and Handle Exception
* Método de llamada y excepción de manejo
**********************************************************************
    out->write(  |i_carrier_id    = '{ c_carrier_id }' | ).             " Imprimimos nuestras constantes
    out->write(  |i_connection_id = '{ c_connection_id }'| ).           " imprimimos nuestras constantes

    TRY.                                                                " intenta crear una istancia
       connection = NEW #(
                           i_carrier_id    = 'LH'                       " se manda el primer parametro  al metodo connection
                           i_connection_id = '0400'                     " se manda el segundo parametro al metodo connection
                         ).

*        connection->set_attributes(
*          EXPORTING
*            i_carrier_id    = 'LH'
*            i_connection_id = '0400'
*        ).

           APPEND connection TO connections.                            " los resultados que se guardaron en la instacia connection las pasaremos a connections que tiene una estructura de tabla

         CATCH cx_abap_invalid_value.                                   " cacha el error en caso de que suceda uno
           out->write( `Method call failed` ).                          " imprimi que se a sucitado un error
       ENDTRY.                                                          " finaliza el intento de llmada del metodo

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
