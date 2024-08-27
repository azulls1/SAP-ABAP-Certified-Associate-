CLASS zcl_09_date_processing_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_09_date_processing_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Función IS.VALID( ) no es una función booleana real.
* Devuelve el valor entero 1 para la verdad
* y 0 para falso.

    SELECT FROM /dmo/travel
         FIELDS begin_date,                                             " dia de inicio en la tabla   /dmo/travel
                end_date,                                               " dia de fin en la tabla /dmo/travel
                is_valid( begin_date  )              AS valid,          " funcion is_valid( )  valida que sea una fecha si es verdad manda un true que es 1 si fuera falso

                add_days( begin_date, 7 )            AS add_7_days,     " funcion add_days(fecha 1, dias_que se agregaran )
                add_months(  begin_date, 3 )         AS add_3_months,   " funcion add_months(fecha 1, mes_que se agregaran )
                days_between( begin_date, end_date ) AS duration,       " funcion days_between(fecha 1, fecha 2 )  nos retorna la canitdad de dia entre las dos fechas contenidas

                weekday(  begin_date  )              AS weekday,        " funcion weekday(  fecha 1 ) determina el si es dia entre semana o no y cual es
                extract_month(  begin_date )         AS month,          " funcion extract_month (fecha 1) extra el mes de la fecha contenida dentro de la funcion
                dayname(  begin_date )               AS day_name        " funcion dayname( fecha 1 ) nos retorna el nombre del dia en ingles de la fecha contenida

          WHERE customer_id = '000001'                                  " clausula de busqueda 1
            AND days_between( begin_date, end_date ) > 10               " clausula de busqueda 2 donde la funcion determina la cantidad de dias entre la fecha de inicio y la fecha de fin y si es mayor que 10  se cumple la condicion de busqueda

           INTO TABLE @DATA(result).                                    " guardamos la consulta  en una tabla

    out->write(                                                         " imprmimos los resultados de la consulta
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).


  ENDMETHOD.
ENDCLASS.
