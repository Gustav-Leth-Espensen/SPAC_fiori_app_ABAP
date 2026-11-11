CLASS ZCL_SPAC105_DATA_LOADER_NEW_WA DEFINITION
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


CLASS ZCL_SPAC105_DATA_LOADER_NEW_WA IMPLEMENTATION.

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
    DATA: temp_table TYPE TABLE OF  ZSPAC105_NEW_WAR .
*                                  ^^^^^^^^^^^^^^^^

    temp_table = VALUE #(
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herunder, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      ( product_id = 1 warehouse_id = 1 amount = 231 price =   100 product_name = 'Toilet paper' description = 'To wipe your butt.' )
      ( product_id = 2 warehouse_id = 1 amount = 212 price =   90 product_name = 'Your MOM' description = 'Usfull for a lot of different siutations, but mostly for fun ;)' )
      ( product_id = 3 warehouse_id = 2 amount = 133 price =   330 product_name = 'Your DAD' description = 'Mowes the lawn occationally.' )
      ( product_id = 4 warehouse_id = 2 amount = 13 price =   1200 product_name = 'Super Man' description = 'Small doll looking like supermann, comes with batteries and the flex2000 pack.' )
      ( product_id = 5 warehouse_id = 3 amount = 9 price =   509 product_name = 'Something Else' description = 'What else do you need.' )
      ( product_id = 6 warehouse_id = 3 amount = 231 price =   100 product_name = 'Toilet paper' description = 'To wipe your butt. Different type of paper.' )

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herover, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ).

    TRY.
*            ÆNDR TABELNAVNET
*            vvvvvvvvvvvvvvvv
      INSERT  ZSPAC105_NEW_WAR  FROM TABLE @( CORRESPONDING #( temp_table ) ).
*            ^^^^^^^^^^^^^^^^

    CATCH cx_sy_open_sql_db INTO DATA(lx).
      RAISE EXCEPTION lx.
    ENDTRY.

    r_output = |Inserted { sy-dbcnt } entries into table.|.

  ENDMETHOD.

  METHOD cleanup.

*               ÆNDR TABELNAVNET
*               vvvvvvvvvvvvvvvv
    DELETE FROM  ZSPAC105_NEW_WAR .
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
