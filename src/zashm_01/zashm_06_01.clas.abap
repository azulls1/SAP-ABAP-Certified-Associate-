CLASS zashm_06_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZASHM_06_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
" CONSULTAR INFORMACION
" https://learning.sap.com/learning-journeys/acquire-core-abap-skills/using-the-entity-manipulation-language_b378f225-0471-45bf-8b7a-f48d00e1bccb

* Lenguaje de manipulación de entidades (EML) EML consta de declaraciones que puede
* utilizar para manipular los datos de un objeto comercial .

  DATA UPDATE_TAB TYPE TABLE FOR UPDATE /DMO/R_AGENCYTP.    "Si desea actualizar los datos,
* declara una tabla interna con TYPE TABLE FOR UPDATE. Esto contiene todos los campos
* del objeto de negocio y también la estructura %control.

  UPDATE_TAB = VALUE #( ( AGENCYID = '070015' NAME = 'MODIFIED AGENCY'  ) ).
  "GUARDAMOS LOS VALORES QUE ASIGNAMOS A CADA VARIABLE  EN UPDATE_TAB


* EXISTEN  4  FORMAS DE MANIPULAR UN EML
* READ ENTITIES             =   LEER UNA ENTIDAD
* MODIFY ENTITIES UPDATE    =   ACTULIZAR UNA ENTIDAD
* MODIFY ENTITIES CREATE    =   CREAR UNA ENTIDAD
* MODIFY ENTITIES DELETE    =   ELIMINAR UNA ENTIDAD


* La declaración MODIFY ENTITIES actualiza los datos en el buffer transaccional.
* En la adición FIELDS, se especifica qué campos deben ser cambiados. En el Condición,
* pasas la tabla interna que contiene los datos que deseas actualizar.
  MODIFY ENTITIES OF /DMO/R_AGENCYTP        " NOMBRE DE LA DEFINICIÓN DE COMPORTAMIENTO
  ENTITY /DMO/AGENCY         "(ALIAS-) NOMBRE DE LA ENTIDAD DEFINIDA EN LA DEFINICIÓN DE COMPORTAMIENTO
  UPDATE FIELDS ( NAME )     " CAMPO QUE SE MODIFICARA O MODIFICARAN
  WITH UPDATE_TAB.           " TABLA CON DATOS PARA ACTUALIZACIÓN


  COMMIT ENTITIES.              " la declaración COMMIT ENTITIES para activar la secuencia
                                " de guardar y persistir los datos en la base de datos.


* PRESIONAR F9 PARA CORRER EL PROGRAMA
  ENDMETHOD.
ENDCLASS.
