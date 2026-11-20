CLASS ZCL_SPAC105_DATA_LOADER_PROD DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_table
        RETURNING VALUE(r_output) TYPE string
        RAISING cx_sy_open_sql_db,
      cleanup
        RETURNING VALUE(r_output) TYPE STRING.

ENDCLASS.



CLASS ZCL_SPAC105_DATA_LOADER_PROD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    out->write( cleanup(  ) ).

    TRY.
      out->write( fill_table(  ) ).
    CATCH cx_sy_open_sql_db INTO DATA(lx).
      out->write( |Couldn't write entries to table. Error: { lx->get_longtext(  ) }| ).
    ENDTRY.


  ENDMETHOD.


  METHOD fill_table.
*                                  ÆNDR TABELNAVNET
*                                  vvvvvvvvvvvvvvvv
    DATA: temp_table TYPE TABLE OF  ZSPAC105_PRODUCT .
*                                  ^^^^^^^^^^^^^^^^

    temp_table = VALUE #(
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herunder, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      ( product_id = 1 ean_number = 5703000000012 price =   100 product_name = 'Toilet paper' description = 'To wipe your butt.' )
      ( product_id = 2 ean_number = 5703000000029  price =   90 product_name = 'Your MOM' description = 'Usfull for a lot of different siutations, but mostly for fun ;)' )
      ( product_id = 3 ean_number = 5703000000036  price =   330 product_name = 'Your DAD' description = 'Mowes the lawn occationally.' )
      ( product_id = 4 ean_number = 5703000000043  price =   1200 product_name = 'Super Man' description = 'Small doll looking like supermann, comes with batteries and the flex2000 pack.' )
      ( product_id = 5 ean_number = 5703000000050  price =   509 product_name = 'Something Else' description = 'What else do you need.' )
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herover, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ).

    TRY.
*            ÆNDR TABELNAVNET
*            vvvvvvvvvvvvvvvv
      INSERT  ZSPAC105_PRODUCT  FROM TABLE @( CORRESPONDING #( temp_table ) ).
*            ^^^^^^^^^^^^^^^^

    CATCH cx_sy_open_sql_db INTO DATA(lx).
      RAISE EXCEPTION lx.
    ENDTRY.

    r_output = |Inserted { sy-dbcnt } entries into table.|.

  ENDMETHOD.


  METHOD cleanup.

*               ÆNDR TABELNAVNET
*               vvvvvvvvvvvvvvvv
    DELETE FROM  ZSPAC105_PRODUCT .
*               ^^^^^^^^^^^^^^^^

    IF sy-subrc <> 0.
      ROLLBACK WORK.
      r_output = |Cleanup failed. Error: { sy-subrc }.|.
    ELSE.
      COMMIT WORK.
      r_output = |Successfully cleaned up { sy-dbcnt } entries.|.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
