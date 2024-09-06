CLASS zcl_29_defining_exception_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_29_defining_exception_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

" Declaración de variables para el manejo de conexiones y excepciones
DATA connection TYPE REF TO lcl_connection. " Definición de una referencia al objeto de clase 'lcl_connection'
DATA exception TYPE REF TO lcx_no_connection. " Definición de una referencia al objeto de excepción 'lcx_no_connection'

TRY.
  " Intento de crear una nueva conexión utilizando los parámetros i_airlineid e i_connectionnumber
  connection = NEW #( i_airlineid = 'XX' i_connectionnumber = '0000' ).

  " Si ocurre una excepción del tipo 'lcx_no_connection', se captura aquí
  CATCH lcx_no_connection INTO exception.
    " Escribimos el texto del error almacenado en la excepción
    out->write( exception->get_text( ) ).
ENDTRY.



  ENDMETHOD.
ENDCLASS.
