CLASS z00_join_chains_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z00_join_chains_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
*       PRIMER EJERCICIO
**********************************************************************
    DATA: lv_full_name  TYPE string VALUE 'Stan Wilson',  " Cadena con nombre completo
          lv_first_name TYPE string,                     " Variable para el primer nombre
          lv_last_name  TYPE string.                      " Variable para el apellido

    " Dividimos el nombre completo usando el espacio como delimitador y asignamos los resultados
    SPLIT lv_full_name AT ' ' INTO lv_first_name lv_last_name.

    " Escribimos el primer nombre con un texto fijo antes
    out->write( |user { lv_first_name }| ).  " Mostrará "user Stan"

**********************************************************************
*       SEGUNDO EJERCICIO
**********************************************************************

* Declaramos tres variables: dos enteros para cantidades y una cadena
* para almacenar un código de moneda con valor inicial 'EUR'.
DATA: lv_amount1   TYPE i,                         " Variable para almacenar la primera cantidad (entero)
      lv_amount2   TYPE i,                         " Variable para almacenar la segunda cantidad (entero)
      lv_curr_code TYPE string VALUE 'EUR'.        " Código de moneda con valor 'EUR'

* Asignamos valores a las variables enteras.
lv_amount1 = 3.                                    " Asignamos el valor 3 a lv_amount1
lv_amount2 = 6.                                    " Asignamos el valor 6 a lv_amount2

* Salidas impresas:
out->write( |hello world!| ).                      " Imprime 'hello world!' en la salida
out->write( |{ lv_amount1 + lv_amount2 }| ).       " Suma lv_amount1 y lv_amount2, imprime el resultado (9)
out->write( |{ lv_amount1 + lv_amount2 } MX | ).   " Imprime la suma seguida del texto ' MX'
out->write( |{ lv_amount1 + lv_curr_code } | ).    " Imprime la suma seguida del código de moneda 'EUR'

**********************************************************************
*       TERCER EJERCICIO
**********************************************************************

* Declaramos tres variables de tipo cadena.
DATA: result TYPE string,                          " Variable para almacenar el resultado concatenado
      part1  TYPE string VALUE 'HELLO',            " Primera parte de la cadena, valor 'HELLO'
      part2  TYPE string VALUE 'WORLD'.            " Segunda parte de la cadena, valor 'WORLD'

* Concatenamos sin espacio entre las palabras y asignamos a result.
result = part1 && part2.                           " Concatenación sin espacios 'HELLOWORLD'
out->write( result ).                              " Imprime el resultado 'HELLOWORLD'

* Concatenamos con un espacio en medio.
result = part1 && | | && part2.                    " Concatenación con espacio 'HELLO WORLD'
out->write( result ).                              " Imprime el resultado 'HELLO WORLD'

* Concatenamos con un espacio y comillas.
result = part1 && | "..." | && part2.              " Concatenación con comillas 'HELLO "..." WORLD'
out->write( result ).                              " Imprime el resultado 'HELLO "..." WORLD'

* Concatenamos con comillas sin espacio extra.
result = part1 && |"..."| && part2.                " Concatenación con comillas sin espacios 'HELLO"..."WORLD'
out->write( result ).                              " Imprime el resultado 'HELLO"..."WORLD'



  ENDMETHOD.
ENDCLASS.
