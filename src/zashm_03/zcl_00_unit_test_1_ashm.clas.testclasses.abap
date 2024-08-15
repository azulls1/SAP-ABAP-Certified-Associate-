*"* use this source file for your ABAP unit test classes
class ltcl_test definition final for testing
  duration short
  risk level harmless.

  private section.

    methods:
    test_success for testing raising cx_static_check.
    methods test_exception for testing.

 endclass.


class ltcl_test implementation.

  method test_success.
* Preparation: Read an arbitrary carrier_idfrom DB
    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    INTO @DATA(carrier_id).
    IF sy-subrc <> 0.
        cl_abap_unit_assert=>fail( msg = ' Inapropriate excepion'
        detail = ' Test requires at least one entry in DB table /DMO/CARRIER ' ).

    ENDIF.

    TRY.
        DATA(carrier) = lcl_data=>get_carrier(  carrier_id ).
    CATCH cx_abap_invalid_value.
        cl_abap_unit_assert=>fail( msg = 'Inapropriate exception'
        detail = ' Method lcl_ata=>get_carrier( ) raises an exception when it should not ' ).
    ENDTRY.
  endmethod.

  method test_exception.
    CONSTANTS c_wrong_carrier_id type /DMO/Carrier_id value 'XX'.

    SELECT SINGLE
    FROM /dmo/carrier
    FIELDS carrier_id
    WHERE carrier_id = 'XX'
    INTO @DATA(carrier_id).

    IF sy-subrc = 0.
    "carrier exists in DB table /DMO/CARRIER, stop testing
        cl_abap_unit_assert=>fail( msg = |Carrier {  c_wrong_carrier_id } exists in /DMO/CARRIER|
                                   level = if_abap_unit_constant=>severity-high
                                   quit = if_abap_unit_constant=>quit-test
                                   detail = 'If DB table /DMO/CARRIER contains an entry' && |with carrier_id = ' { c_wrong_carrier_id }'| && 'it is not possible to test the exception' ).
    ENDIF.

    TRY.
        DATA(carrier) = lcl_data=>get_carrier( carrier_id ).
        cl_abap_unit_assert=>fail( msg = 'No exception'
        detail = 'Methd lcl_data=>get_carrier( ) does not raise an exceptionwhen it should do so' ).
    CATCH cx_abap_invalid_value.
    ENDTRY.

  endmethod.

endclass.
