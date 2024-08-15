*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition.

  public section.

  DATA carrier_id type /dmo/carrier_id.
  DATA connection_id type /dmo/connection_id.

  class-data conn_counter type i. " Usted declara atributos estáticos usando la declaración CLASS-DATA.
*  protected section.

* declaramos  o definimos los metodos para saber que datos estaran importando exportando cambiando etc
  METHODS set_attributes "agregamos crtrl + 1, para poder agregar la implementacion de los metodos  creados
  IMPORTING "Importing Parameters son valores que el método recibe del llamante.
*   Un método puede tener cualquier número de parámetros de importación.
  i_carrier type /dmo/carrier_id OPTIONAL "agreganmos i al inicio para referenciar que es importing
  i_connection_id type /dmo/connection_id. "agregamos i mas la nombre de la variable dar a entender que es una variable de importing

  METHODS get_attributes
  IMPORTING"Importing Parameters son valores que el método recibe del llamante.
*   Un método puede tener cualquier número de parámetros de importación.
  i_carrier_id type /dmo/carrier_id OPTIONAL
  i_connection_id type /dmo/connection_id.


  protected section.
  private section.

endclass.

class lcl_connection implementation.

  method get_attributes. "implementacion del metodo definido en la seccion de arriba

  endmethod.

  method set_attributes.

  endmethod.

endclass.
