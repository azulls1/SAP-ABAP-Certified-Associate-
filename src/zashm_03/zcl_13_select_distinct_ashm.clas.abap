CLASS zcl_13_select_distinct_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_select_distinct_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Addition DISTINCT le permite eliminar duplicados del conjunto de resultados de una instrucción SELECT.
* La adición debe colocarse justo antes del primer elemento de la lista de campo.

**********************************************************************
* codigo modirficado con DISTINCT
 SELECT FROM /dmo/connection
    FIELDS
*           DISTINCT
           airport_from_id,
           distance_unit

  ORDER BY airport_from_id
      INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).

**********************************************************************
* codigo orifinal sin DISTINCT
* SELECT FROM /dmo/connection
*    FIELDS
*           airport_from_id,
*           distance_unit
*
*  ORDER BY airport_from_id
*      INTO TABLE @DATA(result).
*
*    out->write(
*      EXPORTING
*        data   = result
*        name   = 'RESULT'
*    ).


  ENDMETHOD.
ENDCLASS.
