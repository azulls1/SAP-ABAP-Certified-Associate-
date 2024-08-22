CLASS zashm_06_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZASHM_06_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.
    agencies_upd = VALUE #( ( agencyid = '070015' name = 'Toller name' ) ).

    MODIFY ENTITIES OF /DMO/I_AgencyTP ENTITY /DMO/Agency UPDATE FIELDS ( name ) WITH agencies_upd.
    COMMIT ENTITIES.
    out->write( 'Method execution finished!' ).


  ENDMETHOD.
ENDCLASS.
