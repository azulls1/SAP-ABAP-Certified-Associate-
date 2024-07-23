CLASS zcl_03_global_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_global_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection type ref to lcl_connection.   "creamos una variable de referencia que contenta nuestros datos de lcl_connection
  data connections type table of ref to lcl_connection. "creamos una tabla  en la variable de connections

  connection = new #( ). "instanciamos nuestra  variable
  append connection to connections. "asignamos los valores a nuestra tabla
  connection = new #( ).
  append connection to connections.

  ENDMETHOD.
ENDCLASS.
