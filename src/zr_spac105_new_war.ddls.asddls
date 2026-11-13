@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition for new war table'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZR_SPAC105_NEW_WAR as select from zspac105_new_war


{

  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  @UI.lineItem: [{ position: 30}]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'product Id'  
  key product_id as ProductId,
  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Warehouse Id'
  warehouse_id as WarehouseId,
  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Amount'
  amount as Amount,
  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Price'
  price as Price,
  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]
  @EndUserText.label: 'Product Name'
  product_name as ProductName,
  @UI.facet: [{purpose: #STANDARD,  type: #FIELDGROUP_REFERENCE}]
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 30 }]  
  @EndUserText.label: 'Description'
  description as Description,
  
  @Semantics.user.createdBy: true
  localcreatedby as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  localcreatedat as LocalCreatedAt,
  @Semantics.user.lastChangedBy: true
  locallastchangeby as LocalLastChangeBy,
  @Semantics.systemDateTime.lastChangedAt: true
  lastchangedat as LastChangedAt,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  locallastchangeat as LocalLastChangeAT
  
  
  
}
