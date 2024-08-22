CLASS zcl_01_text_elements_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_text_elements_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* OUT->write( TEXT-001 ).

  OUT->write( 'Hello World!'(001) ).
  OUT->write( text-hau ).

  ENDMETHOD.
ENDCLASS.
