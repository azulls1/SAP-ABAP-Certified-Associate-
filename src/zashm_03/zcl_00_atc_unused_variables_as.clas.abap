CLASS zcl_00_atc_unused_variables_as DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_00_ATC_UNUSED_VARIABLES_AS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*   DATA: carrier_list TYPE TABLE OF /dmo/carrier.          "#EC NEEDED
    DATA: connection_list TYPE TABLE OF /dmo/connection ##needed.

    SELECT FROM /DMO/connection
    FIELDS *
    INTO TABLE @DATA(connections).

*    connection_list = connection_list.

    out->write( connections ).


  ENDMETHOD.
ENDCLASS.
