CLASS lhc_STOCK DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PUBLIC SECTION.
    CONSTANTS state_validate_warehouseID TYPE string VALUE 'VALIDATE_WAREHOUSE_ID'.
    CONSTANTS state_validate_productID TYPE string VALUE 'VALIDATE_PRODUCT_ID'.
    CONSTANTS state_validate_amount TYPE string VALUE 'VALIDATE_AMOUNT'.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR stock RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR stock RESULT result.

    METHODS validateWarehouseID FOR VALIDATE ON SAVE IMPORTING keys FOR STOCK~validateWarehouseID.

    METHODS validateProductID FOR VALIDATE ON SAVE IMPORTING keys FOR STOCK~validateProductID.

    METHODS validatePositiveAmount FOR VALIDATE ON SAVE IMPORTING keys FOR STOCK~validatePositiveAmount.

ENDCLASS.

CLASS lhc_STOCK IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.


  METHOD validateWarehouseId.

    DATA warehouses TYPE SORTED TABLE OF ZSPAC105_WAREHOU WITH UNIQUE KEY Warehouse_Id.

    READ ENTITIES OF ZR_SPAC105_STOCK IN LOCAL MODE
    ENTITY STOCK
      FIELDS (  WarehouseID )
      WITH CORRESPONDING #( keys )
      RESULT DATA(ID_check).

    warehouses =  CORRESPONDING #( ID_check DISCARDING DUPLICATES MAPPING Warehouse_Id = warehouseid EXCEPT * ).
    DELETE warehouses WHERE Warehouse_Id IS INITIAL.

    IF warehouses IS NOT INITIAL.
      SELECT FROM ZR_SPAC105_WAREHOU FIELDS WarehouseId
        FOR ALL ENTRIES IN @warehouses
        WHERE WarehouseId = @warehouses-Warehouse_Id
        INTO TABLE @DATA(warehouses_db).
    ENDIF.


      LOOP AT ID_check INTO DATA(check).
      APPEND VALUE #( %tky        = check-%tky
                      %state_area = state_validate_warehouseID )
             TO reported-STOCK.

      IF        check-warehouseid IS INITIAL
         OR NOT line_exists( warehouses_db[ WarehouseId = check-warehouseid ] ).

        APPEND VALUE #(  %tky = check-%tky ) TO failed-STOCK.
        APPEND VALUE #( %tky                 = check-%tky
                        %state_area          = state_validate_warehouseID
                        %msg                 = NEW zcx_behavior( textid      = zcx_behavior=>warehouse_id_invalid
                                                                   warehouseID = check-warehouseid )
                        %element-warehouseid = if_abap_behv=>mk-on )
               TO reported-STOCK.
      ENDIF.
    ENDLOOP.


  ENDMETHOD.


  METHOD validateproductid.
    DATA products TYPE SORTED TABLE OF ZSPAC105_PRODUCT WITH UNIQUE KEY product_Id.

    READ ENTITIES OF ZR_SPAC105_STOCK IN LOCAL MODE
    ENTITY STOCK
      FIELDS (  ProductID )
      WITH CORRESPONDING #( keys )
      RESULT DATA(ID_check).

    products =  CORRESPONDING #( ID_check DISCARDING DUPLICATES MAPPING product_Id = productid EXCEPT * ).
    DELETE products WHERE product_Id IS INITIAL.

    IF products IS NOT INITIAL.
      SELECT FROM ZR_SPAC105_PRODUCT FIELDS productId
        FOR ALL ENTRIES IN @products
        WHERE productId = @products-product_Id
        INTO TABLE @DATA(products_db).
    ENDIF.


      LOOP AT ID_check INTO DATA(check).
      APPEND VALUE #( %tky        = check-%tky
                      %state_area = state_validate_productID )
             TO reported-STOCK.

      IF        check-productid IS INITIAL
         OR NOT line_exists( products_db[ productId = check-productid ] ).

        APPEND VALUE #(  %tky = check-%tky ) TO failed-STOCK.
        APPEND VALUE #( %tky                 = check-%tky
                        %state_area          = state_validate_productID
                        %msg                 = NEW zcx_behavior( textid      = zcx_behavior=>product_id_invalid
                                                                   productID = check-productid )
                        %element-productid = if_abap_behv=>mk-on )
               TO reported-STOCK.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validatepositiveamount.
    DATA counter TYPE i.

    READ ENTITIES OF ZR_SPAC105_STOCK IN LOCAL MODE
    ENTITY STOCK
      FIELDS (  Amount )
      WITH CORRESPONDING #( keys )
      RESULT DATA(Amounts).

    LOOP AT Amounts INTO DATA(check).
      APPEND VALUE #( %tky        = check-%tky
                      %state_area = state_validate_Amount )
             TO reported-STOCK.


      IF        check-AMOUNT < 0 .

        APPEND VALUE #(  %tky = check-%tky ) TO failed-STOCK.
        APPEND VALUE #( %tky                 = check-%tky
                        %state_area          = state_validate_Amount
                        %msg                 = NEW zcx_behavior( textid      = zcx_behavior=>amount_invalid
                                                                   productID = check-amount )
                        %element-amount = if_abap_behv=>mk-on )
               TO reported-STOCK.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
