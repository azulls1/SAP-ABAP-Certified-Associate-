CLASS zcl_14_added_features_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_14_added_features_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*SUM( sql.exp )
* Determina la suma de los resultados de la expresión SQL sql-exp en un conjunto de filas.
* El tipo de datos del conjunto de resultados es el tipo de expresión SQL.
* El tipo de resultado de la expresión SQL sql-exp debe ser de tipo numérico.

*MIN( sql.exp ) y MAX (sql.exp )
* Determina el valor máximo o el valor mínimo de los resultados de la expresión SQL sql-exp en un conjunto de filas.
* El tipo de datos del resultado es el tipo del resultado de la expresión SQL.
* El resultado de la expresión SQL sql-exp debe ser de tipo numérico. Si se especifica una sola columna
* para la expresión, esta columna también puede tener cualquier tipo de datos.

*AVG( col [ AS dtype ])
* Determina el valor promedio del contenido de una columna col en una fila establecida.
* Por defecto, el tipo de resultado es FLTP. Adicional opcional AS dtype se puede utilizar para definir
* el tipo de resultado explícitamente. El tipo de datos de la columna debe ser numérico.

*Nota
*Las expresiones SQL no pueden especificarse como argumentos para AVG.

*COUNT( * ) o COUNT (*)
* Las dos ortaciones tienen el mismo significado y producen el número de filas en una fila establecida.
* En la mayoría de los casos, el tipo de resultado es INT4. El tipo de resultado es INT8 si COUNT( * ) o COUNT(*)
* es el único elemento en la lista de campo.

*COUNTDODO DISTINCT sql.exp )
* Determina el número de valores distintos de los resultados de la expresión SQL sql.
* exp en un conjunto de filas. El tipo de datos del resultado es INT4
*


    SELECT FROM /dmo/connection
         FIELDS carrier_id,
                connection_id,
                airport_from_id,
                distance
          WHERE carrier_id = 'LH'
           INTO TABLE @DATA(result_raw).


    out->write(
      EXPORTING
        data   = result_raw
        name   = 'RESULT_RAW'
    ).

*********************************************************************

    SELECT FROM /dmo/connection
         FIELDS MAX( distance ) AS max,
                MIN( distance ) AS min,
                SUM( distance ) AS sum,
                AVG( distance ) AS average,
                COUNT( * ) AS count,
                COUNT( DISTINCT airport_from_id ) AS count_dist

          WHERE carrier_id = 'LH'
           INTO TABLE @DATA(result_aggregate).

    out->write(
      EXPORTING
        data   = result_aggregate
        name   = 'RESULT_AGGREGATED'
    ).


  ENDMETHOD.
ENDCLASS.
