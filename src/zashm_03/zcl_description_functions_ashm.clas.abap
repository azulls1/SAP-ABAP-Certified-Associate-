CLASS zcl_description_functions_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_description_functions_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

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
* OFF y LEN :   El parámetro off se utiliza para pasar un desplazamiento y la len te de parámetro se utiliza para pasar una longitud.
* NUMOFCHAR( )  y STRLEN( . La mayoría de las veces, las dos funciones devuelven el mismo resultado.
* NUMOFCHAR( ): Si el argumento es de cadena tipo y contiene uno o más espacios en blanco al final, el resultado de STRLEN( ) incluye aquellos en blanco
* STRLEN( )   : los ignora.
* COUNT...( ) : devolver el número total de ocurreciones de un argumento de búsqueda.
* FIND( ) y las funciones que comienzan con FIND-( ) devuelven la posición (desconjunto) de una ocurrencia particular de un argumento de búsqueda
**********************************************************************

    DATA result TYPE i.

    DATA text    TYPE string VALUE `  ABAP  `.
    DATA substring TYPE string VALUE `AB`.
    DATA offset    TYPE i      VALUE 1.

* `01234567`
* `  ABAP  `

* Call different description functions
******************************************************************************
*    result = strlen(     text ).
*    result = numofchar(  text ).

**********************************************************************
*    result = count(             val = text sub = substring off = offset ). " val = `  ABAP  ` ,  sub = `AB`, off = 1.
* Count devolvera el total de ocurrencias  de AB despues de caracter 1
* Resultado 1
* print1 : Text      = `  ABAP  `
* print2 : Substring = `AB`
* print3 : Offset    = 1
* print4 : Result    = 1    total de ocurrencias 1
**********************************************************************
*    result = find(             val = text sub = substring off = offset ). " val = `  ABAP  ` ,  sub = `AB`, off = 1.
* fin devpñvera la posicion del valor encontrado  AB despues del caracter  1 el resultado sera 2
* Resultado 2
* print1 : Text      = `  ABAP  `
* print2 : Substring = `AB`
* print3 : Offset    = 1
* print4 : Result    = 2    caracter donde empieza la ocurrencia
**********************************************************************

    result = count_any_of(     val = text sub = substring off = offset ). " val = `  ABAP  ` ,  sub = `AB`, off = 1.
* count_any_of
* Resultado 3
* print1 : Text      = `  ABAP  `
* print2 : Substring = `AB`
* print3 : Offset    = 1
* print4 : Result    = 3
**********************************************************************
*    result = find_any_of(      val = text sub = substring off = offset ). " val = `  ABAP  ` ,  sub = `AB`, off = 1.
* Resultado 4
* print1 : Text      = `  ABAP  `
* print2 : Substring = `AB`
* print3 : Offset    = 1
* print4 : Result    = 2
**********************************************************************

*    result = count_any_not_of( val = text sub = substring off = offset ). " val = `  ABAP  ` ,  sub = `AB`, off = 1.
* Resultado 5
* print1 : Text      = `  ABAP  `
* print2 : Substring = `AB`
* print3 : Offset    = 1
* print4 : Result    = 4
**********************************************************************
*    result = find_any_not_of(  val = text sub = substring off = offset ). " val = `  ABAP  ` ,  sub = `AB`, off = 1.
* Resultado 6
* print1 : Text      = `  ABAP  `
* print2 : Substring = `AB`
* print3 : Offset    = 1
* print4 : Result    = 1
**********************************************************************

    out->write( |Text      = `{ text }`| ).
    out->write( |Substring = `{ substring }` | ).
    out->write( |Offset    = { offset } | ).
    out->write( |Result    = { result } | ).


  ENDMETHOD.
ENDCLASS.
