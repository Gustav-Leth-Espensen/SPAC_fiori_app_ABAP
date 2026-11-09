CLASS zcl_class_exercise_spac105 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_class_exercise_spac105 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection TYPE REF TO lcl_connection.
  DATA connections TYPE TABLE OF REF TO lcl_connection.

  TRY.
    connection = NEW #( i_carrier_id    = 'LH'
                        i_connection_id = '0400' ).
    APPEND connection to connections.
  CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
  ENDTRY.

  TRY.
    connection = NEW #( i_carrier_id    = 'AA'
                        i_connection_id = '0017' ).
    APPEND connection to connections.
  CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
  ENDTRY.

  TRY.
    connection = NEW #( i_carrier_id    = 'SQ'
                        i_connection_id = '0001' ).
    APPEND connection to connections.
  CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
  ENDTRY.


* Calling Functional Method
**********************************************************************
  " in a value assignment (with inline declaration for result)
*  DATA(result) = connection->get_output( ).

  " in logical expression
  IF connection->get_output(  ) IS NOT INITIAL.

    " as operand in a statement
    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.

*    "  to supply input parameter of another method
*    out->write( data = connection->get_output( )
*                name = `  ` ).

  ENDIF.

  out->write( lcl_connection=>conn_counter ).


  ENDMETHOD.
ENDCLASS.
