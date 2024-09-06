CLASS zcl_28_exception_classes_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_28_exception_classes_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA number1 TYPE i VALUE 2000000000. " Declaración de una variable entera con valor 2 mil millones
    DATA number2 TYPE p LENGTH 2 DECIMALS 1 VALUE '0.5'. " Declaración de un número con decimales, valor inicial 0.5
    DATA result TYPE i. " Declaración de una variable entera para almacenar el resultado de las divisiones

    " Primer bloque TRY-CATCH para capturar errores específicos
    TRY.
        result = number1 / number2. " Intento de dividir number1 entre number2
      CATCH cx_sy_arithmetic_overflow. " Captura la excepción de desbordamiento aritmético
        out->write( 'Arithmetic Overflow' ).
      CATCH cx_sy_zerodivide. " Captura la excepción de división por cero
        out->write( 'Division by zero' ).
    ENDTRY.

    " Cambiamos el valor de number2 a 0 para forzar una división por cero
    number2 = 0.
    TRY.
        result = number1 / number2. " Intento de división por cero
      CATCH cx_sy_arithmetic_overflow. " Captura el desbordamiento aritmético (no ocurrirá aquí)
        out->write( 'Arithmetic Overflow' ).
      CATCH cx_sy_zerodivide. " Captura la división por cero
        out->write( 'Division by zero' ).
    ENDTRY.

    " Uso de un bloque TRY-CATCH combinado para capturar múltiples excepciones
    TRY.
        result = number1 / number2.
      CATCH cx_sy_arithmetic_overflow cx_sy_zerodivide. " Captura cualquiera de las dos excepciones
        out->write( 'Arithmetic overflow or division by zero' ).
    ENDTRY.

    " Uso de una excepción de superclase para capturar cualquier error aritmético
    TRY.
        result = number1 / number2.
      CATCH cx_sy_arithmetic_error. " Captura cualquier error aritmético (incluye desbordamiento y división por cero)
        out->write( 'Caught both exceptions using their common superclass' ).
    ENDTRY.

    " Uso de CX_ROOT para capturar cualquier excepción
    TRY.
        result = number1 / number2.
      CATCH cx_root. " Captura cualquier excepción derivada de CX_ROOT (la superclase de todas las excepciones en ABAP)
        out->write( 'Caught any exception using CX_ROOT' ).
    ENDTRY.

    " Uso de INTO para obtener el objeto de excepción y manejarlo
    TRY.
        result = number1 / number2.
      CATCH cx_root INTO DATA(Exception). " Captura cualquier excepción y la asigna a la variable Exception
        out->write( 'Used INTO to intercept the exception object' ).
        out->write( 'The get_Text( ) method returns the following error text: ' ).
        out->write( Exception->get_text( ) ). " Muestra el texto de la excepción usando el método get_text()
    ENDTRY.


  ENDMETHOD.
ENDCLASS.
