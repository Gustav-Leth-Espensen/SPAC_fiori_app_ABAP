@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Datadefinion for meta data for warehouse'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC105_WAREHOU as select from zspac105_warehou

association [0..1] to zspac105_stock as _stock            on $projection.WarehouseId = _stock.warehouse_id

{
  key warehouse_id as WarehouseId,
  city_name as CityName,
  postnummer as Postnummer,
  adresse as Adresse,
  warehouse_name as WarehouseName,
  
  _stock.amount as Amount,
  
  localcreatedby as Localcreatedby,
  localcreatedat as Localcreatedat,
  locallastchangeby as Locallastchangeby,
  locallastchangeat as Locallastchangeat,
  lastchangedat as Lastchangedat,

  _stock
}
