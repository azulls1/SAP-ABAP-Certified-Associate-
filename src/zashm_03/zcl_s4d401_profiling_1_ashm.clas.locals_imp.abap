*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_data DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      get_flights
        RETURNING VALUE(lt_flights) TYPE tt_flights.

ENDCLASS.

CLASS lcl_data IMPLEMENTATION.

  METHOD get_flights.

    SELECT
        FROM /dmo/flight
        FIELDS *
        INTO TABLE @lt_flights.
  ENDMETHOD.
ENDCLASS.
