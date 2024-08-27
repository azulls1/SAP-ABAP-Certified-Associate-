CLASS zcl_06_case_differences_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_case_differences_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    SELECT FROM /dmo/customer
         FIELDS customer_id,
                title,
                CASE title
                  WHEN 'Mr.'  THEN 'Mister'
                  WHEN 'Mrs.' THEN 'Misses'
                  ELSE             ' '
               END AS title_long                "a qui se crea el ultimo campo  con la asignacion correspondiente

        WHERE country_code = 'AT'
         INTO TABLE @DATA(result_simple).       "guardamos la consulta y todos los campos en una tabala

    out->write(
      EXPORTING
        data   = result_simple                  "imprime todo el contenido de la tabla
        name   = 'RESULT_SIMPLE'                "titulo de la impresion
    ).

**********************************************************************

    SELECT FROM /DMO/flight
         FIELDS flight_date,
                seats_max,
                seats_occupied,
                CASE
                  WHEN seats_occupied < seats_max THEN 'Seats Avaliable'
                  WHEN seats_occupied = seats_max THEN 'Fully Booked'
                  WHEN seats_occupied > seats_max THEN 'Overbooked!'
                  ELSE                                 'This is impossible'
                END AS Booking_State            "se crea el ultimo campo booking_state con la ultima asignacion que se le asigna

          WHERE carrier_id    = 'LH'                  "clausulas de busqueda
            AND connection_id = '0400'                "clausulas de busqueda
           INTO TABLE @DATA(result_complex).        "guardamos la consulta y todos los campos en una tabala

    out->write(
      EXPORTING
        data   = result_complex                 "imprime todo el contenido de la tabla
        name   = 'RESULT_COMPLEX'               "titulo de la impresion
    ).


  ENDMETHOD.
ENDCLASS.
