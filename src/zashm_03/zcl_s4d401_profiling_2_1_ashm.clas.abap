CLASS zcl_s4d401_profiling_2_1_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_S4D401_PROFILING_2_1_ASHM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA(connections) = lcl_data=>get_connections( ).

    SORT connections BY carrier_id connection_id ASCENDING.

    LOOP AT connections INTO DATA(connection).
      DATA(city_from) = lcl_data=>get_airport_city( connection-airport_from_id ).
      DATA(city_to) = lcl_data=>get_airport_city( connection-airport_to_id ).
      DATA(text) = | Flight { connection-carrier_id } { connection-connection_id }|  && | from { city_from } to { city_to } |.
      out->write( '-----------------------' ).
      out->write( text ).
    ENDLOOP.


  ENDMETHOD.
ENDCLASS.
