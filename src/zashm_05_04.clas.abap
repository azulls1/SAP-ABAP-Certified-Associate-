CLASS zashm_05_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zashm_05_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_airport,                 " Inicio de la declaracion de la estructura st_airport
             airportid TYPE /dmo/airport_id,    " campo 1
             name      TYPE /dmo/airport_name,  " campo 2
           END OF st_airport.                   " Fin de la declaracion de la estructura  st_airport

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport     " asignamos a tt_airports la tabla local le damos forma estandar con clave explícita no única
                          WITH NON-UNIQUE KEY airportid.    " declaramos una llave primaria que no es unica que se pueden repetir parametros

    DATA airports TYPE tt_airports.             " creamos una variable que viene siento una tabla interna y tendra la forma de la estructura tt_airports


* Example 1: Structured Variables in SELECT SINGLE ... INTO ...
* Ejemplo 1: Variables estructuradas en SELECT SINGLE... INTO...
**********************************************************************

    DATA airport_full TYPE /DMO/I_Airport.      " declaramos una variable que tendra la forma de /DMO/I_Airport

    SELECT SINGLE                               " seleccionamos solo un registro o fila en este caso
      FROM /DMO/I_Airport                       " de la tabla /DMO/I_Airport
    FIELDS AirportID, Name, City, CountryCode   " de los siguientes 4 campos (coumna)
     WHERE City = 'Zurich'                      " donde city sea igual a Zurich
      INTO @airport_full.                       " y el resultado lo guardamos en airport_full no se debe olvidar el @

    out->write(  `-----------------------------------------------------------------` ).
    out->write(  `Example 1: SELECT SINGLE ... INTO ...` ).
    out->write(  data = airport_full
                 name = `Uno de los aeropuertos de Zurich (Estructura):` ).

* Example 2: Internal Tables in SELECT ... INTO TABLE ...
* Ejemplo 2: Tablas Internas en SELECT...INTO TABLE...
**********************************************************************

    DATA airports_full TYPE STANDARD TABLE OF /DMO/I_Airport    " creamos una tabla de que sera de tipo standar de la tala /DMO/I_Airport
                            WITH NON-UNIQUE KEY AirportID.      " que tendra como llave primaria que puede tener duplicados

    SELECT                                      " selecciona todo
      FROM /DMO/I_Airport                       " en la tabla /DMO/I_Airport
    FIELDS airportid, Name, City, CountryCode   " seleccionamos 4 campos de la tabla
     WHERE City = 'London'                      " donde se encuentre  london en la ciudad
      INTO TABLE @airports_full.                " y guarda el dato en airports_full

    out->write( '.' ).
    out->write(  `------------------------------------------------------------------` ).
    out->write(  `Example 2: SELECT ... INTO TABLE ...` ).
    out->write(  data = airports_full
                 name = `Todos los aeropuertos de Londres (Tabla interna)::` ).

* Example 3: FIELDS * and INTO CORRESPONDING FIELDS OF TABLE
* Ejemplo 3: CAMPOS * y EN LOS CAMPOS CORRESPONDIENTES DE LA TABLA
**********************************************************************

    SELECT                  " selecciona
      FROM /DMO/I_Airport   " de la tabla /DMO/I_Airport
    FIELDS *                " seleccionamos todos los campos (columnas )
     WHERE City = 'London'  " dodne ciudad sea london
      INTO CORRESPONDING FIELDS OF TABLE @airports. "y guardalo en sus lugares que les corresponde  en airports

    out->write( '.' ).
    out->write(  `----------------------------------------------------------` ).
    out->write(  `Example 3: FIELDS * and INTO CORRESPONDING FIELDS OF TABLE` ).
    out->write(  data = airports
                 name = `Internal Table AIRPORTS:` ).

* Example 4: Inline Declaration
* Ejemplo 4: Declaración en línea
**********************************************************************

    SELECT
      FROM /DMO/I_airport
    FIELDS AirportID, Name AS AirportName
     WHERE City = 'London'
     INTO TABLE @DATA(airports_inline).

    out->write( '.' ).
    out->write(  `----------------------------------------------------------` ).
    out->write(  `Example 4: Inline Declaration after INTO TABLE` ).
    out->write(  data = airports_inline
                 name = `Internal Table AIRPORTS_INLINE:` ).

** Example 4: ORDER BY and DISTINCT
** Ejemplo 4: ORDENAR POR y DISTINTO
***********************************************************************
*
*    SELECT
*      FROM /DMO/I_Airport
*    FIELDS DISTINCT CountryCode
*     ORDER BY CountryCode
*     INTO TABLE @DATA(countryCodes).
*
*    out->write(  countryCodes ).

* Example 5: UNION (ALL)
* Ejemplo 5: UNIÓN (TODOS)
**********************************************************************

    SELECT FROM /DMO/I_Carrier
           FIELDS 'Airline' AS type, AirlineID AS Id, Name
           WHERE CurrencyCode = 'GBP'

    UNION ALL

    SELECT FROM /DMO/I_Airport
           FIELDS 'Airport' AS type, AirportID AS Id,  Name
           WHERE City = 'London'
*    ORDER BY type, Id
    INTO TABLE @DATA(names).

    out->write( '.' ).
    out->write(  `----------------------------------------------` ).
    out->write(  `Example 5: UNION ALL of Airlines and Airports ` ).
    out->write(  data = names
                 name = `ID and Name of Airlines and Airports:` ).

**********************************************************************
 DATA tablaCompleta type table of /DMO/I_Airport.

 select *
 from /DMO/I_Airport
 into  table @tablaCompleta.


    out->write( '.' ).
    out->write(  `----------------------------------------------` ).
    out->write(  `Example 6: contenido de tabla I_Airport ` ).
    out->write(  data = tablaCompleta
             name = `prueba de la tabla  I_Airport` ).

  ENDMETHOD.
ENDCLASS.
