CLASS zcl_s4d401_profiling_1_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_S4D401_PROFILING_1_ASHM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA(flights) = lcl_data=>get_flights( ).

    SORT flights BY flight_date DESCENDING.

    out->write(
        name = 'list of all flights'
        data = flights ).


  ENDMETHOD.
ENDCLASS.
