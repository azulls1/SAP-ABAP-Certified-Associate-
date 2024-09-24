CLASS z03_do_endoo_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z03_do_endoo_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS: c_number0 TYPE i VALUE 3.

    out->write( '---------------------------------' ).
    out->write( 'Example 1: DO...ENDDO with TIMES' ).
    out->write( '---------------------------------' ).

    DO c_number0 TIMES.
      out->write( 'Hello World' ).
    ENDDO.

    out->write( '---------------------------------' ).
    out->write( 'Example 2: DO...ENDDO ' ).
    out->write( '---------------------------------' ).
    DATA: lv_counter TYPE i,           "Contador para el bucle
          lt_numbers TYPE TABLE OF i,   "Tabla interna para almacenar números
          lv_number  TYPE i.             "Variable para el número actual

    CLEAR: lv_counter.
    DO 5 TIMES.                         "Se ejecuta 5 veces
      lv_counter = lv_counter + 1.      "Incrementamos el contador
      lv_number = lv_counter.           "Asignamos el contador al número actual
      APPEND lv_number TO lt_numbers.   "Añadimos el número a la tabla interna
    ENDDO.

    " Mostramos el contenido de la tabla interna
    LOOP AT lt_numbers INTO lv_number.
      out->write(  | 'Número:'  {  lv_number }| ).
    ENDLOOP.


    out->write( '---------------------------------' ).
    out->write( 'Example 3: DO...ENDDO WITH CONIDITION  EXIT' ).
    out->write( '---------------------------------' ).

CONSTANTS: c_number TYPE i VALUE 3.    "Constante que almacena el valor 3
DATA: lv_numberr TYPE i.               "Variable entera para el cálculo

lv_numberr = c_number * c_number.      "Multiplicamos el valor de la constante por sí mismo (3 * 3 = 9)

* Contar hacia atrás desde lv_numberr (9) hasta c_number (3)
DO.
  "Muestra el índice del bucle (sy-index) y el valor actual de lv_numberr
  out->write( |{ sy-index }: Value of lv_numberr: { lv_numberr }| ).

  lv_numberr = lv_numberr - 1.         "Decrementa el valor de lv_numberr en 1 en cada iteración

* Condición de salida del bucle
  IF lv_numberr <= c_number.           "Si lv_numberr es menor o igual a 3, salimos del bucle
    EXIT.                              "Se detiene el bucle cuando lv_numberr alcanza 3
  ENDIF.
ENDDO.


  ENDMETHOD.
ENDCLASS.
