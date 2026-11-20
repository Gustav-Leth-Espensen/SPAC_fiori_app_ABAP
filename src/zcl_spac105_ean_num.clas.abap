CLASS zcl_spac105_ean_num DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS create_EAN_number
      IMPORTING product_id TYPE i
      RETURNING VALUE(r_output) TYPE string.
ENDCLASS.



CLASS zcl_spac105_ean_num IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA product_id TYPE i VALUE 5.

    out->write( create_EAN_number( product_id ) ).

  ENDMETHOD.
  METHOD create_EAN_number.

    CONSTANTS G1_Den TYPE n VALUE 570 LENGTH 3.
    CONSTANTS Manufactoring_code TYPE n VALUE 300000 LENGTH 6.
    CONSTANTS weight TYPE n VALUE 131313131313 LENGTH 12.
*    DATA product_code(5) TYPE n VALUE 12345.
    DATA product_code TYPE n  LENGTH 3.
    DATA check_digit TYPE i.
    DATA EAN12 TYPE n LENGTH 12.
    DATA EAN13 TYPE n LENGTH 13.

    product_code = product_id.
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

*    test = product_code+2(3).    =  345

    r_output = EAN13.

  ENDMETHOD.

ENDCLASS.
