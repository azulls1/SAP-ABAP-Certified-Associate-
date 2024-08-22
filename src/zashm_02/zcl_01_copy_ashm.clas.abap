CLASS zcl_01_copy_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_COPY_ASHM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



 dATA:
        lt_data TYPE TABLE of /dmo/connection,
        ls_data type /dmo/connection,
        lsz_data TYPE z03aflgt_ashm,
        ltz_data TYPE TABLE of z03aflgt_ashm.

        SELECT *  FROM /dmo/connection INTO TABLE @lt_data.

        loop at lt_data into lsz_data.

            APPEND lsz_data to ltz_data.

        ENDLOOP.

        INSERT z03aflgt_ashm FROM TABLE @ltz_data.

*      SELECT * FROM /dmo/connection INTO TABLE @Z02AFLGT.


      COMMIT WORK.
*


ENDMETHOD.
ENDCLASS.
