CLASS zashm_04_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZASHM_04_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  Example 1 : Motivation for Structured Variables
**********************************************************************

    DATA connection_full TYPE /DMO/I_Connection.

    SELECT SINGLE
            FROM /DMO/I_Connection
            FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport,
                    DepartureTime, ArrivalTime, Distance, DistanceUnit
            WHERE AirlineID     = 'LH'
            AND   ConnectionID  = '0400'
            INTO @connection_full.

            out->write( connection_full ).


*   Example 2: Global Structure
**********************************************************************

    DATA message type symsg.

    out->write( message ).


*   Example 3: Local Structured type
**********************************************************************

    TYPES: BEGIN OF st_connection,
                airport_from_id TYPE /dmo/airport_from_id,
                airport_to_id   TYPE /dmo/airport_to_id,
               carrier_name    TYPE /dmo/carrier_name,
            END OF ST_CONNECTION.


   DATA connection type st_connection.

*   Example 4: Local Structured type
**********************************************************************

    TYPES: BEGIN OF st_connection1,
                airport_from_id TYPE /dmo/airport_from_id,
                airport_to_id   TYPE /dmo/airport_to_id,
                message         TYPE symsg,
               carrier_name    TYPE /dmo/carrier_name,
            END OF ST_CONNECTION1.


   DATA connection1 type st_connection1.

*   Example 5: Local
**********************************************************************

*    CONSTANTS:
*      BEGIN OF co_key_name,
*                draft   TYPE seckeyname value 'DRAFT',
*                cid     TYPE seckeyname value 'CID',
*                pid     TYPE seckeyname value 'PID',
*                entity  TYPE seckeyname value 'ENTITY',
*            END OF co_key_name.


  ENDMETHOD.
ENDCLASS.
