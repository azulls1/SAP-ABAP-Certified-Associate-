CLASS zcl_01_global_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_GLOBAL_ASHM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection type REF TO lcl_connection. "creamos una variable de referencia para
*  acceder a los componentes de una instancia
  DATA connection2 type REF TO lcl_connection.
  connection = new #( ). "creamos una instancia a nuestra clase local

  connection->carrier_id = 'LH'. "instanciamos nuestro variable de referencia  y accedemos al componente para asignar un valor
  connection->connection_id = '0400'.

    connection2 = connection.

  ENDMETHOD.
ENDCLASS.
