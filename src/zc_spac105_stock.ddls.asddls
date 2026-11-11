@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New data projection'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define root view entity ZC_SPAC105_STOCK
  provider contract transactional_query as projection on ZR_SPAC105_STOCK

  association [1..1] to zspac105_warehou as _meta_warehouse   on $projection.warehouseid = _meta_warehouse.warehouse_id
  association [1..1] to zspac105_new_war as _meta_stock            on $projection.productId = _meta_stock.product_id  
  
{
  key warehouseid,
  key productId,
  Amount,
  Price,
  productName,
  warehouseName,
  
  _meta_warehouse,
  _meta_stock
  
}
