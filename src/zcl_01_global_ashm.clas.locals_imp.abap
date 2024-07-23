*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition.
* contiene la definición y declaración de todos los
*elementos de la clase, es decir, los tipos, las constantes,
*los atributos y los métodos

  public section.

  DATA CARRIER_ID TYPE /DMO/CARRIER_ID.
  DATA CONNECTION_ID TYPE /DMO/CONNECTION_ID.

  CLASS-DATA CONN_COUNTER TYPE I.". Usted declara atributos estáticos usando la declaración CLASS-DATA.
*  protected section.

*  private section.

endclass.

class lcl_connection implementation.

endclass.
