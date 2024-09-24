CLASS zcl_ashm_01_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ASHM_01_HELLO_WORLD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write( 'Hello World' ).
  out->write( | Hello World! | ).


  ENDMETHOD.
ENDCLASS.
