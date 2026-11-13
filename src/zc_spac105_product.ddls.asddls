@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Datadefinion for new warehouse stock'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC105_PRODUCT
  provider contract transactional_query as projection on ZR_SPAC105_PRODUCT
  
  association [0..1] to zspac105_stock as _stock            on $projection.ProductId = _stock.product_id  
 

{


  @UI.facet: [{ id: 'StockDetails',
           purpose: #STANDARD,
              type: #IDENTIFICATION_REFERENCE,
             label: 'Stock Details',
          position: 10 } ]
  
  @UI.lineItem: [{ position: 20 }]
  @UI.identification: [{ position: 20 }]
  @EndUserText.label: 'Product Id'
  key ProductId,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Price'  
  Price,
  @UI.lineItem: [{ position: 40 }]
  @UI.identification: [{ position: 40 }]
  @EndUserText.label: 'Product Name'  
  ProductName,
  @UI.lineItem: [{ position: 50 }]
  @UI.identification: [{ position: 50 }]  
  @EndUserText.label: 'Description'    
  Description,
  
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
