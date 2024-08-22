CLASS zcl_02_global_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_02_GLOBAL_ASHM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection type ref to lcl_connection.
  DATA connections type TABLE of ref to lcl_connection.

  connection = NEW #( ).
   APPEND connection TO connections.
  connection = NEW #( ).
  APPEND connection TO connections.


  ENDMETHOD.
ENDCLASS.
