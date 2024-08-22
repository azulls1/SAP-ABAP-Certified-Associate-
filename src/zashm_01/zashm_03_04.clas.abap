CLASS zashm_03_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZASHM_03_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*   CONSTANTS c_carrier_id TYPE /dmo/carrier_id       VALUE 'LH'.
*    CONSTANTS c_connection_id TYPE /dmo/connection_id VALUE '0400'.

    DATA connection  TYPE REF TO lcl_connection.
    DATA connections  TYPE TABLE OF REF TO lcl_connection.

* First instance and Create Instance
**************************************CLASS-DATA conn_counter TYPE i VALUE 0 READ-ONLY. ********************************
    TRY.
       connection = NEW #(
                           i_carrier_id    = 'LH'
                           i_connection_id = '0400'
                         ).

*        connection->set_attributes(
*          EXPORTING
*            i_carrier_id    = 'LH'
*            i_connection_id = '0400'
*        ).

           APPEND connection TO connections.

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
