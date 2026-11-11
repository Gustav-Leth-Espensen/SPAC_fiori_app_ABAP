@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for new war table'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZR_SPAC105_NEW_WAR as select from zspac105_new_war


{
  key product_id as ProductId,
  warehouse_id as WarehouseId,
  amount as Amount,
  price as Price,
  product_name as ProductName,
  description as Description,
  
  locallastchangeat as LocalLastChangeAT,
  locallastchangeby as LocalLastChangeBy,
  lastchangedat as LastChangedAt,
  localcreatedby as LocalCreatedBy,
  localcreatedat as LocalCreatedAt
  
  
  
  
}
