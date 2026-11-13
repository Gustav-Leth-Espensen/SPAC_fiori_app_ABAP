@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New data projection'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define root view entity ZC_SPAC105_STOCK
  provider contract transactional_query as projection on ZR_SPAC105_STOCK

  association [1..1] to zspac105_warehou as _meta_warehouse   on $projection.warehouseid = _meta_warehouse.warehouse_id
  association [1..1] to zspac105_new_war as _meta_stock            on $projection.productId = _meta_stock.product_id  
  
{

  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  
  @Search.defaultSearchElement
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]  
  @EndUserText.label: 'Warehouse ID'
  key warehouseid,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Warehouse Id'
  key productId,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Amount'  
  Amount,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Price'  
  Price,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Product Name' 
  productName,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]  
  @EndUserText.label: 'Description'  
  warehouseName,
  
  @UI.hidden: true
  LocalLastChangeAT,
  @UI.hidden: true
  LastChangedAt,
  @UI.hidden: true
  LocalCreatedBy,
  @UI.hidden: true
  LocalCreatedAt,
  @UI.hidden: true
  LocalLastChangeBy,
  
  _meta_warehouse,
  _meta_stock
  
}
