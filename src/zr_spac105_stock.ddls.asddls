@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC105_STOCK as select from zspac105_stock
{

  key warehouse_id as WarehouseId,
  product_id as productId,
  amount as Amount_in_kroner
  
}
