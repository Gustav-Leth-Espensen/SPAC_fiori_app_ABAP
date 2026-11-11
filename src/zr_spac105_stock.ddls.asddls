@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC105_STOCK as select from zspac105_stock

  association [1..1] to zspac105_warehou as _meta_warehouse   on $projection.WarehouseId = _meta_warehouse.warehouse_id
  association [1..1] to zspac105_new_war as _meta_stock            on $projection.productId = _meta_stock.product_id
  

{

  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8
  @ObjectModel.text.association: '_meta_warehouse'
  key warehouse_id as WarehouseId,
  
  
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8
  @ObjectModel.text.association: '_meta_stock'
  key product_id as productId,
  amount as Amount,
  
  _meta_warehouse,
  _meta_stock
  
  
}
