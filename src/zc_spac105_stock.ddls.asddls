@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'New data projection'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC105_STOCK
  provider contract transactional_query as projection on ZR_SPAC105_STOCK

  association [1..1] to zspac105_warehou as _meta_warehouse   on $projection.warehouseid = _meta_warehouse.warehouse_id
  association [1..1] to zspac105_product as _meta_stock            on $projection.productId = _meta_stock.product_id  
  
{

  @UI.facet: [{ id: 'StockDetails',
           purpose: #STANDARD,
              type: #IDENTIFICATION_REFERENCE,
             label: 'Stock Details',
          position: 10 } ]
  
  @UI.identification: [{ position: 20 }]
  @UI.lineItem: [{ position: 20 }]  
  @EndUserText.label: 'Warehouse ID'
  key warehouseid,
  @UI.identification: [{ position: 30 }]
  @UI.lineItem: [{ position: 30 }]
  @EndUserText.label: 'Product Id'
  key productId,
  @UI.lineItem: [{ position: 40 }]
  @UI.identification: [{ position: 40 }]
  @EndUserText.label: 'Amount'  
  Amount,
  @UI.identification: [{ position: 50 }]
  Price,
  @UI.identification: [{ position: 60 }]
  @EndUserText.label: 'Product Name'
  productName,
  @UI.identification: [{ position: 70 }]
  @EndUserText.label: 'Warehouse Name'
  warehouseName,
  @UI.identification: [{ position: 80 }]
  @EndUserText.label: 'City Name'
  CityName,
  @UI.identification: [{ position: 90 }]
  Description,
  @UI.identification: [{ position: 100 }]
  Postnummer,
  
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
