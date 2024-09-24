CLASS z02_case_statements_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z02_case_statements_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_option TYPE i,
          lv_result TYPE string.

    lv_option = 2.

    CASE lv_option.
      WHEN 1.
        lv_result = 'Opción 1 seleccionada'.
      WHEN 2.
        lv_result = 'Opción 2 seleccionada'.
      WHEN 3.
        lv_result = 'Opción 3 seleccionada'.
      WHEN OTHERS.
        lv_result = 'Opción no válida'.
    ENDCASE.

    out->write(  | 'Resultado' { lv_result } | ).


  ENDMETHOD.
ENDCLASS.
