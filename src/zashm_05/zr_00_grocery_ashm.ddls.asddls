@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_00_GROCERY_ASHM
  as select from Z00_GROCERY_ASHM as Grocery_ashm
{
  key id as Id,
  product as Product,
  category as Category,
  brand as Brand,
  @Semantics.amount.currencyCode: 'Currency'
  price as Price,
  currency as Currency,
  quantity as Quantity,
  purchasedate as Purchasedate,
  expirationdate as Expirationdate,
  expired as Expired,
  rating as Rating,
  note as Note,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  createdat as Createdat,
  @Semantics.user.lastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as Lastchangedat,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchanged as Locallastchanged
  
}
