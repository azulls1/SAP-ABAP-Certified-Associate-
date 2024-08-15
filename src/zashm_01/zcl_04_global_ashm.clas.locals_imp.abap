*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition.

  public section.

  DATA carrier_id type /dmo/carrier_id.
  DATA connection_id type /dmo/connection_id.
*  DATA i_carrier_id type /dmo/carrier_id.
*  DATA i_connection_id type /dmo/connection_id.
*  DATA e_carrier_id type /dmo/carrier_id.
*  DATA e_connection_id type /dmo/connection_id.


* Definiccion de metodos
  METHODS set_attributes
  IMPORTING
  i_carrier_id type /dmo/carrier_id OPTIONAL "agreganmos i al inicio para referenciar que es importing
  i_connection_id type /dmo/connection_id. "agregamos i mas la nombre de la variable dar a entender que es una variable de importing

  METHODS get_attributes
  EXPORTING
  e_carrier_id type /dmo/carrier_id "agreganmos i al inicio para referenciar que es importing
  e_connection_id type /dmo/connection_id. "agregamos i mas la nombre de la variable dar a entender que es una variable de importing



  protected section.
  private section.

endclass.

class lcl_connection implementation.


*aplicacion de los metodos
  method get_attributes.

    e_carrier_id = carrier_id.
    e_connection_id = connection_id.

  endmethod.

  method set_attributes.

  if i_carrier_id is initial or i_connection_id is initial.

  RAISE EXCEPTION type cx_abap_invalid_value.

  ENDIF.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.

  endmethod.

endclass.
