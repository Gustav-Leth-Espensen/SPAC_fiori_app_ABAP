@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Datadefinion for new warehouse stock'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC105_PRODUCT as select from zspac105_product

association [0..1] to zspac105_stock as _stock            on $projection.ProductId = _stock.product_id


{
  key product_id as ProductId,
  price as Price,
  product_name as ProductName,
  description as Description,
  
  _stock.amount as Amount,
  
  localcreatedby as Localcreatedby,
  localcreatedat as Localcreatedat,
  locallastchangeby as Locallastchangeby,
  locallastchangeat as Locallastchangeat,
  lastchangedat as Lastchangedat,
  _stock
}
