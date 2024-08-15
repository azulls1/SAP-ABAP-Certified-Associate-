CLASS zcl_06_global_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_06_global_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


   DATA connection  TYPE REF TO lcl_connection.
   DATA connections  TYPE TABLE OF REF TO lcl_connection.

* Create Instance
* Creamos una instancia
**********************************************************************

    connection = NEW #(  ).

    connection->set_attributes(
      EXPORTING
        i_carrier_id    = 'LH'
        i_connection_id = '0400'
    ).

    APPEND connection TO connections.

* Calling Functional Method
* llamamos el metodo funcional
**********************************************************************
    " in a value assignment (with inline declaration for result)
    " en una asignación de valor (con declaración en línea para el resultado)
    DATA(result) = connection->get_output( ).

    " in logical expression
    " en expresión lógica
    IF connection->get_output(  ) IS NOT INITIAL.

      " as operand in a statement
      " como operando en una declaración
      LOOP AT connection->get_output(  ) INTO DATA(line).

      ENDLOOP.

      "  to supply input parameter of another method
      " para suministrar el parámetro de entrada de otro método
      out->write( data = connection->get_output( )
                  name = `ASHM` ).

    ENDIF.


  ENDMETHOD.
ENDCLASS.
