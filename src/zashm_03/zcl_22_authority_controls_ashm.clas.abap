CLASS zcl_22_authority_controls_ashm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_authority_controls_ashm IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   " Declaración de la tabla interna LDT_AIRPORTS para almacenar los registros de aeropuertos
    DATA LDT_AIRPORTS TYPE STANDARD TABLE OF /DMO/AIRPORT WITH NON-UNIQUE KEY AIRPORT_ID.

    " Verificación de la autorización del usuario para acceder a los datos de los aeropuertos
    AUTHORITY-CHECK
      OBJECT '/DMO/TRVL' " Objeto de autorización para viajes
          ID 'CNTRY' FIELD 'DE' " Campo de país, específico para 'DE' (Alemania)
          ID 'ACTVT' FIELD '03'. " Actividad 03, generalmente para leer datos

    " Si el usuario tiene la autorización correcta (SY-SUBRC = 0), se realiza la selección de datos
    IF SY-SUBRC = 0.
      SELECT
        FROM /DMO/AIRPORT
      FIELDS *
      WHERE COUNTRY = 'DE' " Selecciona los aeropuertos en Alemania
       INTO TABLE @LDT_AIRPORTS. " Los resultados se almacenan en la tabla interna LDT_AIRPORTS

      " Se muestran los aeropuertos seleccionados
      OUT->WRITE( LDT_AIRPORTS ).
    ELSE.
      " Si el usuario no tiene autorización, se muestra un mensaje de error
      OUT->WRITE( | NO AUTHORIZATION| ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.


*Descripción General:
*
*Este código define una clase ABAP (zcl_22_authority_controls_ashm) que
* implementa la interfaz if_oo_adt_classrun, permitiendo que la clase se
*ejecute desde el entorno de desarrollo ABAP. El método principal (main)
*verifica si el usuario tiene autorización para acceder a los datos de
*aeropuertos en Alemania (identificados por el país "DE"). Si tiene la
*autorización adecuada, los datos se seleccionan y muestran; de lo contrario,
*se muestra un mensaje indicando que no tiene autorización.

*Detalles Específicos:
*
*    AUTHORITY-CHECK: Verifica si el usuario tiene los permisos necesarios para leer los datos asociados con el objeto de autorización /DMO/TRVL para el país 'DE'.


*    SELECT Statement: Si la verificación de autorización es exitosa, se seleccionan todos los registros de aeropuertos en Alemania y se almacenan en una tabla interna.


*    Salida: Dependiendo de la autorización, se muestran los aeropuertos seleccionados o un mensaje de error.
