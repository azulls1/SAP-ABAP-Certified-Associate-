@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_01AFLGT_ASHM
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_01AFLGT_ASHM
{
  key Uuid,
  CarrierId,
  ConnectionId,
  FlightDate,
  AirportFromId,
  CityFrom,
  CountryFrom,
  AirportToId,
  CityTo,
  CountryTo,
  Price,
  CurrencyCode,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
