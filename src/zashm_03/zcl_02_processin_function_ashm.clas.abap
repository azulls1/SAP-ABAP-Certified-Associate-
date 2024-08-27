CLASS zcl_02_processin_function_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_processin_function_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*                                '012345678911111111122222222223'
*                                           01234567891234567890
DATA text TYPE string      VALUE ` SAP BTP,   ABAP Environment  `.

* Change Case of characters
* Cambiar caso de caracteres
**********************************************************************
* TO-UPPER( )   transforma todas en letras mayúsculas
* TO_LOWER( )   transforma todas en letras minusculas
* TO_MIXED( )   traduce la cadena en una mezcla de mayúsculas y minúsculas,
*               transforma el primer carácter en mayúscula. los demás caracteres se transforman en minúsculas.
* FROM_MIXED( ) inserta el primer carácter especificado en sep antes de cada letra mayúscula
*               (de izquierda a derecha y desde la segunda posición). El valor predeterminado para el
*               separador sep es un guión bajo (_).
    out->write( |TO_UPPER         = {   to_upper(  text ) } | ).
    out->write( |TO_LOWER         = {   to_lower(  text ) } | ).
    out->write( |TO_MIXED         = {   to_mixed(  text ) } | ).
    out->write( |FROM_MIXED       = { from_mixed(  text ) } | ).


* Change order of characters
* Cabiar el orden de los caracteres
**********************************************************************
* REVERSE( ) devuelve los caracteres en orden inverso.
* SHIFT-LEFT( ) PLACES especifica los lugares de parámetros N(NUMEROS). Por lo tanto, los caracteres
*               se eliminan del resultado leyendo el strin de izquierda a derecha
*SHIFT_RIGHT( ) PLACES especifica los lugares de parámetros N(NUMEROS). Por lo tanto, los caracteres
*               se eliminan del resultado leyendo el strin de derecha a izquierda
* SHIFT-LEFT( ) CIRCULAR del numero de caracteres especidicado de izquierda a derecha. no se eliminan sino trasladados al final.
* SHIFT-LEFT( ) CIRCULAR del numero de caracteres especidicado de derecha a izquierda. no se eliminan sino trasladados al inicio.
    out->write( |REVERSE             = {  reverse( text ) } | ).
    out->write( |SHIFT_LEFT  (places)= {  shift_left(  val = text places   = 3  ) } | ).
    out->write( |SHIFT_RIGHT (places)= {  shift_right( val = text places   = 3  ) } | ).
    out->write( |SHIFT_LEFT  (circ)  = {  shift_left(  val = text circular = 3  ) } | ).
    out->write( |SHIFT_RIGHT (circ)  = {  shift_right( val = text circular = 3  ) } | ).


* Extract a Substring
* Extraer una subcadena
**********************************************************************
* SUBSTRING( ) extrae una subcadena inicia en el caracter 4 (off = 4)
*              y lee 10 caracteres despues del desplasamiento (len = 10).
* SUBSTRING-AFTER( ) busca subcadena "ABAP" y devuelve a todos los caracteres después de encontrar la cadena.
* SUBSTRING_FROM( ) hace lo mismo, pero el resultado contiene substring "ABAP" también.
* SUBSTRING_TO ( ) seleeciona todos los caracteres incluyendo ABAP
* SUBSTRING_BEFORE ( ) selecciona todos los caracteres antes de abap
    out->write( |SUBSTRING       = {  substring(        val = text off = 4 len = 10 ) } | ).
    out->write( |SUBSTRING_FROM  = {  substring_from(   val = text sub = 'ABAP'     ) } | ).
    out->write( |SUBSTRING_AFTER = {  substring_after(  val = text sub = 'ABAP'     ) } | ).
    out->write( |SUBSTRING_TO    = {  substring_to(     val = text sub = 'ABAP'     ) } | ).
    out->write( |SUBSTRING_BEFORE= {  substring_before( val = text sub = 'ABAP'     ) } | ).


* Condense, REPEAT and Segment
**********************************************************************
* CONDENSE se usa para eliminar los espacios iniciales y finales de una cadena
* REPEAT repite la cadena de texto las veces que se introdusca en occ
* SEGMENT1 devuelve en el primer segmento antes de la coma
* SEGMENT2 devuelve la segunda parte en adelante de la coma
    out->write( |CONDENSE         = {   condense( val = text ) } | ).
    out->write( |REPEAT           = {   repeat(   val = text occ = 2 ) } | ).

    out->write( |SEGMENT1         = {   segment(  val = text sep = ',' index = 1 ) } |  ).
    out->write( |SEGMENT2         = {   segment(  val = text sep = ',' index = 2 ) } |  ).


  ENDMETHOD.
ENDCLASS.





