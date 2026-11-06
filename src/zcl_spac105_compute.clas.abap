CLASS zcl_spac105_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.




CLASS zcl_spac105_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA number1 TYPE i.
  DATA number2 TYPE i.
  DATA result TYPE p LENGTH 8 DECIMALS 4.

  number1 = -10.
  number2 = 6.

  result = number1 / number2.
  DATA(text) = |{ number1 } / { number2 } = { result }|.

  out->write( text ).


  ENDMETHOD.
ENDCLASS.
