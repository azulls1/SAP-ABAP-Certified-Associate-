CLASS zcl_join_syntax_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_join_syntax_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*Las condiciones de unión comienzan con la palabra clave ON y definen las relaciones
*entre las columnas de las fuentes de datos.

*El tipo de unión se define mediante la palabra clave correspondiente.
*En ABAP SQL, los tipos de unión admitidos son INNER JOIN, LEFT OUTER JOIN y
*RIGHT OUTER JOIN.
**********************************************************************
*                   Version con alias
*    SELECT FROM /dmo/carrier INNER JOIN /dmo/connection
    SELECT FROM /dmo/carrier AS a INNER JOIN /dmo/connection AS c
             ON a~carrier_id = c~carrier_id "define la union entre dos campos de las tablas y esto sirve apara unirlas

         FIELDS a~carrier_id,
                a~name AS carrier_name,
                c~connection_id,
                c~airport_from_id,
                c~airport_to_id

          WHERE a~currency_code = 'EUR'
           INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).

**********************************************************************
*               ORIGINAL
*    SELECT FROM /dmo/carrier INNER JOIN /dmo/connection
*    SELECT FROM /dmo/carrier AS a INNER JOIN /dmo/connection AS c
*             ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id
*
*         FIELDS /dmo/carrier~carrier_id,
*                /dmo/carrier~name AS carrier_name,
*                /dmo/connection~connection_id,
*                /dmo/connection~airport_from_id,
*                /dmo/connection~airport_to_id
*
*          WHERE /dmo/carrier~currency_code = 'EUR'
*           INTO TABLE @DATA(result).
*
*    out->write(
*      EXPORTING
*        data   = result
*        name   = 'RESULT'
*    ).

  ENDMETHOD.
ENDCLASS.
