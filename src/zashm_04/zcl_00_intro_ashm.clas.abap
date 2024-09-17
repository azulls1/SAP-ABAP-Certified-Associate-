CLASS zcl_00_intro_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
TYPES:
      BEGIN OF st_address,
        street       TYPE /dmo/street,
        postal_code  TYPE /dmo/postal_code,
        city         TYPE /dmo/city,
        country_code TYPE land1,
        status       TYPE c LENGTH 1,
      END OF st_address.

    TYPES:
      BEGIN OF st_person,
        first_name TYPE /dmo/first_name,
        last_name  TYPE /dmo/last_name.

        INCLUDE    TYPE st_address.
    TYPES:
      END OF st_person.

    TYPES:
        tt_addresses   TYPE STANDARD TABLE OF st_address.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_intro_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA var TYPE /dmo/airport.

    SELECT FROM /dmo/airport
        FIELDS *
            INTO TABLE @DATA(result).


* Declarations
*    DATA travel TYPE /dmo/travel_id.
*    DATA travel TYPE /dmo/s_travel_key.
*    DATA travel TYPE /dmo/travel.
    DATA travel TYPE /dmo/t_travel.

* Assignments
*    travel = '123'.                              "elementary
*    travel = VALUE #(     travel_id = '123'   ). "structure
    travel = VALUE #(  (  travel_id = '123' ) ). "table


**********************************************************************
* Path Expressions in ABAP SQL - Data selection
**********************************************************************

    SELECT FROM /dmo/i_connection_R
         FIELDS Airlineid,
                connectionid,

*                 _Airline.Name,
*                \_Airline-Name,
*                 _Airline-Name,
*                 _Airline~Name,
*                \_Airline~Name,
*
*                \_Airline-_Currency-CurrencyISOCode,
*                \_Airline-\_Currency-CurrencyISOCode,
*                \_Airline\_Currency-CurrencyISOCode,
*                \_Airline~\_Currency~CurrencyISOCode,
*                \_Airline\_Currency~CurrencyISOCode,
*
                \_Airline\_Currency\_Text[                     Language = 'E' ]-CurrencyShortName AS CurrencyNameEN,
*                \_Airline\_Currency\_Text[   MANY TO ONE WHERE Language = 'D' ]-CurrencyShortName AS CurrencyNameDE,
*                \_Airline\_Currency\_Text[                     Language = 'E' ]-CurrencyShortName AS CurrencyNameEN,
*                \_Airline-\_Currency-\_Text[ MANY TO ONE WHERE Language = 'D' ]-CurrencyShortName AS CurrencyNameDE,
*                \_Airline~\_Currency~\_Text[ 1:                Language = 'E' ]-CurrencyShortName AS CurrencyNameEN,
                DepartureAirport,
                DestinationAirport

         INTO TABLE @DATA(result1).

* Output
**********************************************************************
    out->write( lines( result1 ) ).

    out->write(  data = result1
                 name = 'Selection result' ).

**********************************************************************
    SELECT FROM zjx_c_employquery
        FIELDS EmployeeId,
               FirstName,
               LastName,
               DepartmentId,
               DepartmentDescription,
               \_Department\_Assistant-FirstName AS assistantfirstname
        INTO TABLE @DATA(result2).

    out->write(  data = result2
                 name = 'Query result' ).


  ENDMETHOD.
ENDCLASS.
