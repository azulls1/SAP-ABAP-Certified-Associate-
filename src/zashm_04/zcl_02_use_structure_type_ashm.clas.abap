CLASS zcl_02_use_structure_type_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_use_structure_type_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA PERSON TYPE Z01_PERSON.

 person-country_code = 'US'.
 person-address-country_code = 'US'.
*  PERSON-address-country_code = 'US'.
*
*DATA person TYPE z1person.
*    DATA employee TYPE zrap_employee_id.
*
*    employee-street = 'Savur'.
*
*    person-adress-city = 'ISTANBUL'.
*    person-adress-country_code = 'TUR'.
*
*    IF person-adress-city = 'ISTANBUL'.
*    out->write( 'Şehir olarak İstanbul' ).
*    ELSE.
*    out->write( 'Şehir olarak İstanbulda değil' ).
*    ENDIF.
*
*
*
**  Bir tane table type oluşturdum ve aşağıda da o tipte bir 'addresses' internal table'ı oluşturdum sonra 'adr' adında tek satır tutcak bir değişken oluşgturdum.
*
*    DATA addresses TYPE ztable_type.         " bu bir internal table'dır bu yüzden select ifadesi ile okuyamayız !!
*    DATA adr TYPE LINE OF ztable_type.
*
*
*    addresses = VALUE #(
*                         (
*                          street = 'savur sokak'
*                          postal_code = 34500
*                          city = 'Istanbul'
*                          country_code = 'TUR'
*                         )
*                         (
*                          street = 'meşe sokak'
*                          postal_code = 34500
*                          city = 'Gaziantep'
*                          country_code = 'TUR'
*                         )
*                        ).
*
*       LOOP AT addresses INTO adr.
*       out->write( |Street : { adr-street }| ).
*       out->write( |Street : { adr-postal_code }| ).
*       out->write( |Street : { adr-city }| ).
*       out->write( |Street : { adr-country_code }| ).
*       ENDLOOP.
*
*


  ENDMETHOD.
ENDCLASS.
