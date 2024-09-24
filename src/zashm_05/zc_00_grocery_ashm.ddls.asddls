
@AccessControl.authorizationCheck: #CHECK

@EndUserText.label: 'Projection View for ZR_XX_GROCERY'
define root view entity ZC_00_GROCERY_ASHM
  provider contract transactional_query
  as projection on ZR_00_GROCERY_ASHM
{
    key Id,
    
    Product,
    
    Category,
    
    Brand,
    Price,
    Currency,
    Quantity,
    Purchasedate,
    
    Expirationdate,
    
    Expired,
    
    Rating,
    Note,
    CreatedBy,
    Createdat,
    Lastchangedby,
    Locallastchanged
}
