@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_01AFLGT_ASHM
  as select from Z01AFLGT_ASHM as FLGT_ASHM
{
  key uuid as Uuid,
  carrier_id as CarrierId,
  connection_id as ConnectionId,
  flight_date as FlightDate,
  airport_from_id as AirportFromId,
  city_from as CityFrom,
  country_from as CountryFrom,
  airport_to_id as AirportToId,
  city_to as CityTo,
  country_to as CountryTo,
  price as Price,
  currency_code as CurrencyCode,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
