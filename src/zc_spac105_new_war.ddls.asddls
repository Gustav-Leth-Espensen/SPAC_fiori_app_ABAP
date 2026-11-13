@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view for new_war'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZC_SPAC105_NEW_WAR
  provider contract transactional_query as projection on ZR_SPAC105_NEW_WAR
{  
  
  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  
  @UI.lineItem: [{ position: 30}]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'product Id'
  key ProductId,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Warehouse Id'
  WarehouseId,
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
  ProductName,
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]  
  @EndUserText.label: 'Description'
  Description,
  
  @UI.hidden: true
  LocalLastChangeAT,
  @UI.hidden: true
  LastChangedAt,
  @UI.hidden: true
  LocalCreatedBy,
  @UI.hidden: true
  LocalCreatedAt,
  @UI.hidden: true
  LocalLastChangeBy
}
