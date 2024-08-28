CLASS zcl_12_order_by DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_order_by IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* codigo modificado con orden by
    SELECT FROM /dmo/flight
         FIELDS carrier_id,
                connection_id,
                flight_date,
                seats_max - seats_occupied AS seats
          WHERE carrier_id     = 'AA'
            AND plane_type_id  = 'A320-200'
       ORDER BY seats_max - seats_occupied DESCENDING,
                flight_date                ASCENDING
           INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).

**********************************************************************
* Codigo original  sin orden by
*    SELECT FROM /dmo/flight
*         FIELDS carrier_id,
*                connection_id,
*                flight_date,
*                seats_max - seats_occupied AS seats
*          WHERE carrier_id     = 'AA'
*            AND plane_type_id  = 'A320-200'
*           INTO TABLE @DATA(result).
*
*    out->write(
*      EXPORTING
*        data   = result
*        name   = 'RESULT'
*    ).


  ENDMETHOD.
ENDCLASS.
