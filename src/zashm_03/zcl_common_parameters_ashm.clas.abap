CLASS zcl_common_parameters_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_common_parameters_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA text   TYPE string VALUE `  Let's talk about ABAP  `.
    DATA result TYPE i.

    out->write(  text ).                    "imprimimos todo el valor
*   '0123456789111111111122222'     |
*   '          012345678901234'     v
*   `  Let's talk about ABAP  `

**********************************************************************
"Notas
* VAL       :   Pasa la cadena de texto para ser procesada por la función al parámetro val.
* SUB       :   El sub de parámetros se utiliza para pasar una cadena de caracteres cuyos caracteres deben ser buscados o insertados.
* CASO      :   Las búsquedas y comparaciones en las funciones de cadena son sensibles a los casos por defecto, pero esto puede ser
*               anocado si es necesario, mediante el uso de la caja del parámetro.
*               La funda del parámetro requiere la entrada de tipo abap-bool (C LENGTH 1) con el valor de las constantes
*               abap-true ('X') la búsqueda es sensible a los casos
*               abap-false ('). la búsqueda no es sensible a los casos
* OCC       :   En funciones de cuerda donde se realizan búsquedas, el parámetro ocutor especifica la ocurrencia de una coincidencia.
*               Si el ocuto es positivo, las ocurreciones se cuentan desde la izquierda;
*               si el ocupante es negativo, se cuentan desde la derecha.
* OFF y LEN :   El parámetro off se utiliza para pasar un desplazamiento y la lente de parámetro se utiliza para pasar una longitud.
* NUMOFCHAR( )  y STRLEN( . La mayoría de las veces, las dos funciones devuelven el mismo resultado.
* NUMOFCHAR( ): Si el argumento es de cadena tipo y contiene uno o más espacios en blanco al final, el resultado de STRLEN( ) incluye aquellos en blanco
* STRLEN( )   : los ignora.
* COUNT...( ) : devolver el número total de ocurreciones de un argumento de búsqueda.
* FIND( ) y las funciones que comienzan con FIND-( ) devuelven la posición (desconjunto) de una ocurrencia particular de un argumento de búsqueda
**********************************************************************

    result = find( val = text sub = 'A' ).      "regresa el valor de la cadena cuando encuentre la primera A e ignora todo lo demas, rsultado 19
*
*    result = find( val = text sub = 'A' case = abap_false ).  " resultado 9, valida que A sea falsa encuentra la primera a minuscula y devuelve el valor
*
*    result = find( val = text sub = 'A' case = abap_false occ =  -1 ). " resultado 21, cuenta el string y del ultimo caracter resta uno y regresa el valor correspondiente
*    result = find( val = text sub = 'A' case = abap_false occ =  -2 ).  " resultado 19, cuneta el string y el segundo valor con A  regresa el valor correspondiente
*    result = find( val = text sub = 'A' case = abap_false occ =   2 ).  " resultado 13, encuentra el segundo a del string de izquierda a derecha y es una a minuscula y regresa el resultado
*
*    result = find( val = text sub = 'A' case = abap_false occ = 2 off = 10 ).   " resultado 19,
*    result = find( val = text sub = 'A' case = abap_false occ = 2 off = 10 len = 4 ).   " resultado -1,

    out->write( |RESULT = { result } | ).


  ENDMETHOD.
ENDCLASS.
