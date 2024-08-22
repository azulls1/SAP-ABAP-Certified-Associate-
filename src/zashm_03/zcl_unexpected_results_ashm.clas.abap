CLASS zcl_unexpected_results_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_UNEXPECTED_RESULTS_ASHM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


DATA var_date TYPE d.
DATA var_int TYPE i.
DATA var_string TYPE string.
DATA var_n TYPE n LENGTH 4.

var_date = cl_abap_context_info=>get_system_date( ).
var_int = var_date.

out->write( |Date as date| ).
out->write( |fecha como fecha| ).
out->write( var_date ).

out->write( |'   '| ).
out->write( |Date assigned to integer| ).
out->write( |Fecha asignada al número entero| ).
out->write( var_int ).
out->write( '   ' ).
var_string = `R2D2`.
var_n = var_string.

out->write( |String| ).
out->write( |Cadena| ).
out->write( var_string ).

out->write(  '' ).
out->write( |String assigned to type N| ).
out->write( |Cadena asignada al tipo N| ).
out->write( var_n ).


  ENDMETHOD.
ENDCLASS.
