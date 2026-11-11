@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for new_war'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC105_NEW_WAR as projection on ZR_SPAC105_NEW_WAR
{
  key ProductId,
  WarehouseId,
  Amount,
  Price,
  ProductName,
  Description,
  
  @UI.hidden: true
  LocalLastChangeAT,
  @UI.hidden: true
  LastChangedAt,
  @UI.hidden: true
  LocalCreatedBy,
  @UI.hidden: true
  LocalCreatedAt,
  @UI.hidden: true
  LocalLastChangeBy
}
