@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_02AFLGT_ASHM
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_02AFLGT_ASHM
{
  key Uuid,
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  AirportFromId,
  CityFrom,
  CountryFrom,
  Planetypeid,
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
