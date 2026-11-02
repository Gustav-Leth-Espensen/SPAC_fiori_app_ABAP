@AbapCatalog.sqlViewName: 'ZDDIC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New data definition'
@Metadata.ignorePropagatedAnnotations: true
define view ZR_SPAC105_STOCK as select from zspac105_stock zspac105_invent
{

  key warehouse_id as WarehouseId,
  product_id as ProductId,
  amount as Amount_in_kroner
}
