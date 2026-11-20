CLASS lhc_NEW_PRODUCT DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PUBLIC SECTION.
    CONSTANTS state_validate_price TYPE string VALUE 'VALIDATE_PRICE'.


  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR new_product RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR new_product RESULT result.

    METHODS create_ean_number FOR DETERMINE ON SAVE
      keys FOR NEW_PRODUCT~create_ean_number.

    METHODS validatePositivePrice FOR VALIDATE ON SAVE IMPORTING keys FOR NEW_PRODUCT~validatePositivePrice.

ENDCLASS.

CLASS lhc_NEW_PRODUCT IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create_EAN_number.
    CONSTANTS G1_Den TYPE n VALUE 570 LENGTH 3.
    CONSTANTS Manufactoring_code TYPE n VALUE 300000 LENGTH 6.
    CONSTANTS weight TYPE n VALUE 131313131313 LENGTH 12.
    DATA product_code TYPE n LENGTH 3.
    DATA check_digit TYPE i.
    DATA EAN12 TYPE n LENGTH 12.
    DATA EAN13 TYPE n LENGTH 13.


    READ ENTITIES OF ZR_SPAC105_PRODUCT IN LOCAL MODE
    ENTITY NEW_PRODUCT
      FIELDS ( ProductName )
      WITH CORRESPONDING #( keys )
      RESULT DATA(ID_check).

    product_code = ID_check[ 1 ]-productid.
    EAN12 = G1_DEN && Manufactoring_code && product_code.

    DATA(slicer) = 0.
    DO 12 TIMES.
      check_digit = check_digit + EAN12+slicer(1) * weight+slicer(1).
      slicer = slicer + 1.
    ENDDO.

    check_digit = 10 - ( check_digit MOD 10 ).

    IF check_digit = 10.
      check_digit = 0.
    ENDIF.

    EAN13 = EAN12 && check_digit.

    MODIFY ENTITIES OF ZR_SPAC105_PRODUCT IN LOCAL MODE
     ENTITY NEW_PRODUCT
      UPDATE FIELDS ( EAN )
      WITH VALUE #( FOR key IN ID_check (  %tky = key-%tky
                                           %is_draft = key-%is_draft
                                           EAN = EAN13
                                           %control = VALUE #( ProductName = if_abap_behv=>mk-on )
                                           ) )
      REPORTED DATA(modifyReported).
      reported = CORRESPONDING #(  DEEP modifyReported ).



  ENDMETHOD.


  METHOD validatepositiveprice.
    DATA counter TYPE i.

    READ ENTITIES OF ZR_SPAC105_PRODUCT IN LOCAL MODE
    ENTITY NEW_PRODUCT
      FIELDS (  Price )
      WITH CORRESPONDING #( keys )
      RESULT DATA(Prices).

    LOOP AT Prices INTO DATA(check).
      APPEND VALUE #( %tky        = check-%tky
                      %state_area = state_validate_price )
             TO reported-NEW_PRODUCT.


      IF        check-price < 0 .

        APPEND VALUE #(  %tky = check-%tky ) TO failed-NEW_PRODUCT.
        APPEND VALUE #( %tky                 = check-%tky
                        %state_area          = state_validate_price
                        %msg                 = NEW zcx_behavior( textid      = zcx_behavior=>price_invalid
                                                                   Price = check-price )
                        %element-price = if_abap_behv=>mk-on )
               TO reported-NEW_PRODUCT.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.







ENDCLASS.
