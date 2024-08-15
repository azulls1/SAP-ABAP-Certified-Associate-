CLASS zashm_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zashm_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Data Objects with Built-in Types
* Objetos ata con tipos incorporados
**********************************************************************

    " comment/uncomment the following declarations and check the output
    "comenta/descomenta las siguientes declaraciones y comprueba el resultado
     DATA variable TYPE string.                     "Resultado1: N/A                Resultado2: 19891109
*    DATA variable TYPE i.                           "Resultado1: 0                 Resultado2: 19891109
*    DATA variable TYPE d.                          "Resultado1: 0000-00-00         Resultado2: 1989-11-09
*    DATA variable TYPE c LENGTH 10.                "Resultado1: N/A                Resultado2: 19891109
*    DATA variable TYPE n LENGTH 10.                "Resultado1: 0000000000         Resultado2: 0019891109
*    DATA variable TYPE p LENGTH 8 DECIMALS 2.      "Resultado1: 0.0                 Resultado2: 19891109.0

* Output
* Producción
**********************************************************************

    out->write(  'Resultado con valor inicial)' ).
    out->write(   variable ).
    out->write(  '---------' ).

    variable = '19891109'.

    out->write(  'Resultado con valor 19891109' ).
    out->write(   variable ).
    out->write(  '---------' ).

* Data Objects with Built-in Types
**********************************************************************

    " comment/uncomment the following declarations and check the output
    DATA variable1 TYPE string.
*    DATA variable1 TYPE i.
*    DATA variable1 TYPE d.
*    DATA variable1 TYPE c LENGTH 10.
*    DATA variable1 TYPE n LENGTH 10.
*    DATA variable1 TYPE p LENGTH 8 DECIMALS 2.

* Output
**********************************************************************

    out->write(  'Result with Initial Value)' ).
    out->write(   variable ).
    out->write(  '---------' ).

    variable = '19891109'.

    out->write(  'Result with Value 19891109' ).
    out->write(   variable ).
    out->write(  '---------' ).


  ENDMETHOD.
ENDCLASS.
