CLASS zcl_01_instance_itab_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_INSTANCE_ITAB_ASHM IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data connection type ref to lcl_connection. "creamos una variable de tipo referencia de la clase lcl_connection
    data connections type table of ref to lcl_connection. "creamos una variable de tipo tabla  como referencia asi la clase lcl_coonection
    connection = new #( ). "Instanciamos la clase

  connection->carrier_id = 'LH'."accedemos al componente atrabes de nuesta instancia y asignamos un valor
  CONNECTION->connection_id = '0400'.

  APPEND connection to connections."llenamos nuestra variable de tipo tabla con los valores asignados

* second instance
**********************************************************************
  connection = new #( ).

  connection->carrier_id = 'AA'.
  connection->connection_id = '0017'.

  APPEND connection to connections.

*Third instance
**********************************************************************
connection = new #( ).

connection->carrier_id = 'SQ'.
connection->connection_id = '0001'.

  APPEND connection to connections.


  ENDMETHOD.
ENDCLASS.
