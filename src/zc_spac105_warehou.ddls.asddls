@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for ZR_SPAC105_WAREHOU'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC105_WAREHOU
  provider contract transactional_query as projection on ZR_SPAC105_WAREHOU
  
  association [0..1] to zspac105_stock as _stock            on $projection.WarehouseId = _stock.warehouse_id   
  
{

  @UI.facet: [{ id: 'StockDetails',
           purpose: #STANDARD,
              type: #IDENTIFICATION_REFERENCE,
             label: 'Stock Details',
          position: 10 } ]

  @UI.lineItem: [{ position: 20 }]
  @UI.identification: [{ position: 20 }]
  @EndUserText.label: 'Warehouse ID'
  key WarehouseId,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'City Name'   
  CityName,
  @UI.lineItem: [{ position: 40 }]
  @UI.identification: [{ position: 40 }]
  @EndUserText.label: 'Postnummer'  
  Postnummer,
  @UI.lineItem: [{ position: 50 }]
  @UI.identification: [{ position: 50 }]  
  @EndUserText.label: 'Adresse'   
  Adresse,
  @UI.lineItem: [{ position: 60 }]
  @UI.identification: [{ position: 60 }]  
  @EndUserText.label: 'WarehouseName'     
  WarehouseName,
  
  @UI.hidden: true  
  Amount,
  
  @UI.hidden: true
  Locallastchangeat,
  @UI.hidden: true
  Lastchangedat,
  @UI.hidden: true
  Localcreatedby,
  @UI.hidden: true
  Localcreatedat,
  @UI.hidden: true
  Locallastchangeby,

  _stock
  
}
