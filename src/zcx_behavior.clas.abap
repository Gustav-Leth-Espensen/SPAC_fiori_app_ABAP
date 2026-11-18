CLASS zcx_behavior DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_t100_message,
      if_abap_behv_message.

     CONSTANTS:
     message_class TYPE symsgid VALUE 'Z_SPAC105_M_B',

     BEGIN OF warehouse_id_invalid,
        msgid TYPE symsgid VALUE message_class,
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
     END OF warehouse_id_invalid,

     BEGIN OF product_id_invalid,
        msgid TYPE symsgid VALUE message_class,
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
     END OF product_id_invalid,

     BEGIN OF amount_invalid,
        msgid TYPE symsgid VALUE message_class,
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
     END OF amount_invalid.



    DATA:
      mv_warehouse_id TYPE ZSPAC105_STOCK-warehouse_Id,
      mv_product_id TYPE ZSPAC105_STOCK-product_Id.


     METHODS:
      constructor
        IMPORTING
          textid       LIKE if_t100_message=>t100key         OPTIONAL
          previous     LIKE previous                         OPTIONAL
          severity     TYPE if_abap_behv_message=>t_severity DEFAULT  if_abap_behv_message=>severity-error
          warehouseID TYPE ZSPAC105_STOCK-warehouse_Id OPTIONAL
          productID TYPE ZSPAC105_STOCK-product_Id OPTIONAL
            PREFERRED PARAMETER textid
        .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_behavior IMPLEMENTATION.

  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

  me->if_abap_behv_message~m_severity = severity.

  me->mv_warehouse_id = warehouseid.
  me->mv_product_id = productid.

  CLEAR me->textid.
  IF textid IS INITIAL.
    if_t100_message~t100key = if_t100_message=>default_textid.
  ELSE.
    if_t100_message~t100key = textid.
  ENDIF.
  ENDMETHOD.

ENDCLASS.
