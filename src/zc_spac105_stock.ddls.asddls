@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New data projection'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC105_STOCK
  provider contract transactional_query as projection on ZR_SPAC105_STOCK
{
  key WarehouseId,
  key productId,
  Amount
}
