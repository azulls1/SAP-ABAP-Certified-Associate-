CLASS zcl_04_global_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_04_global_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


   DATA carrier_id TYPE /dmo/carrier_id.
   DATA connection_id TYPE /dmo/connection_id.

  DATA connection type ref to lcl_connection.
  data connections type table of ref to lcl_connection.


  connection = new #( ).

  connection->set_attributes(
  EXPORTING
  i_carrier_id = 'LH'
  i_connection_id = '0400' ).

APPEND connection TO connections.

connection = new #( ).

connection->set_attributes(
  EXPORTING
  i_carrier_id = 'AA'
  i_connection_id = '0017' ).

APPEND connection TO connections.

LOOP AT connections into connection.
  connection->get_attributes(
  IMPORTING
  e_carrier_id  =  carrier_id
  e_connection_id = connection_id ).

out->write( |flight connection { carrier_id } { connection_id }|  ).

ENDLOOP.
   APPEND connection TO connections.


  ENDMETHOD.
ENDCLASS.
