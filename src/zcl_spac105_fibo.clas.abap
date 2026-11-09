CLASS zcl_spac105_fibo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_spac105_fibo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  CONSTANTS fibo_num TYPE i VALUE 20.
  DATA numbers TYPE TABLE OF i.

  DO fibo_num TIMES.

   CASE sy-index.
      WHEN 1.
        APPEND 0 TO numbers.
      WHEN 2.
        APPEND 1 TO numbers.
      WHEN OTHERS.
          APPEND numbers[  sy-index - 2 ]
               + numbers[  sy-index - 1 ]
              TO numbers.

   ENDCASE.
  ENDDO.

  out->write( numbers[ 20 ] ).

  DATA(counter) = 0.
  DATA output TYPE TABLE OF string.
  LOOP AT numbers INTO DATA(number).
    counter = counter + 1.
    APPEND |{ counter WIDTH = 4 ALIGN = LEFT }: { number WIDTH = 10 ALIGN = RIGHT }|
         TO output.
*    out->write( |{ number } is the { counter }th number. | ).
      out->write(
         data   = output
         name   = |The first { fibo_num } Fibonacci Numbers|
                ) .

  ENDLOOP.



  ENDMETHOD.
ENDCLASS.



