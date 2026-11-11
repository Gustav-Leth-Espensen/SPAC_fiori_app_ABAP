CLASS z_test123124 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_test123124 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

****** SEE DIFFERENT TYPES EXERCISE
* Data Objects with Built-in Types
**********************************************************************

    " comment/uncomment the following declarations and check the output
*    DATA variable TYPE string.
*    DATA variable TYPE i.
*    DATA variable TYPE d.
*    DATA variable TYPE c LENGTH 10.
*    DATA variable TYPE n LENGTH 10.
*    DATA variable TYPE p LENGTH 8 DECIMALS 2.
*
* Output
**********************************************************************
*
*    out->write(  'Result with Initial Value)' ).
*    out->write(   variable ).
*    out->write(  '---------' ).
*
*    variable = '19891109'.
*
*    out->write(  'Result with Value 19891109' ).
*    out->write(   variable ).
*    out->write(  '---------' ).



****** CONSTANTS AND LITERALS EXERCISE
* Example 1: Local Types
**********************************************************************

** Comment/Uncomment the following lines to change the type of my_var
*    TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
**    TYPES my_type TYPE i .
**    TYPES my_type TYPE string.
**    TYPES my_type TYPE n length 10.
*
** Variable based on local type
*    DATA my_variable TYPE my_type.
*
*    out->write(  `my_variable (TYPE MY_TYPE)` ).
*    out->write(   my_variable ).
** Hvorfor skifter de to variable plads når man laver en tom string?

* Example 2: Global Types
**********************************************************************

** Variable based on global type .
*    " Place cursor on variable and press F2 or F3
*    DATA airport TYPE /dmo/airport_id VALUE 'FRA'.
*
*    out->write(  `airport (TYPE /DMO/AIRPORT_ID )` ).
*    out->write(   airport ).

* Example 3: Constants
**********************************************************************

*    CONSTANTS c_text   TYPE string VALUE `Hello World`.
*    CONSTANTS c_number TYPE i      VALUE 123456.
*
*    "Uncomment this line to see syntax error ( VALUE is mandatory)
**  constants c_text2   type string.
*
*    out->write(  `c_text (TYPE STRING)` ).
*    out->write(   c_text ).
*    out->write(  '---------' ).
*
*    out->write(  `c_number (TYPE I )` ).
*    out->write(   c_number ).
*    out->write(  `---------` ).

* Example 4: Literals
**********************************************************************

*    out->write(  '12345               ' ).    "Text Literal   (Type C)
*    out->write(  `12345               ` ).    "String Literal (Type STRING)
*    out->write(  12345                  ).    "Number Literal (Type I)
*
*    "uncomment this line to see syntax error (no number literal with digits)
*    out->write(  `12345.67`                ).


*  DATA my_int TYPE i.
*  DATA my_int2 TYPE i.
*  DATA my_pack TYPE p LENGTH 8 DECIMALS 2.
*  DATA my_char10 TYPE c LENGTH 10 VALUE 'abcdefghij'.
*  DATA my_char4 TYPE c LENGTH 4.
*  DATA my_string TYPE string.
*  DATA my_bool TYPE abap_bool.
*  DATA val TYPE c.
*
*  my_int = '1234'.
*  my_int2 = 1234.
*
**  my_bool = abap_true.
***  my_bool = my_int = my_int2.
*  out->write( '----------' ).
**
**  my_bool = abap_false.
**  out->write( my_bool ).
*  val = boolc( my_int = my_int2 ).
*  out->write( val ).

*  DATA(my_var1) = 'Hello World'.
*  out->write( my_var1 ).

*  DATA my_var1 TYPE i.
*  DATA my_var2 TYPE i VALUE 1234.
*  DATA my_var3 TYPE string.
*
*  my_var1 = my_var2.
*  my_var3 = 'Hello World'.
*  out->write( my_var1 ).
*  out->write( my_var2 ).
*  out->write( my_var3 ).
*  out->write( '----------' ).
*
*  CLEAR my_var1.
*  CLEAR my_var2.
*  CLEAR my_var3.
*
*  out->write( my_var1 ).
*  out->write( my_var2 ).
*  out->write( my_var3 ).
*  out->write( '----------' ).


* Declarations
**********************************************************************

    " comment/uncomment these line for different result types
*  TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
* TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
* TYPES t_result TYPE i.

*    DATA result TYPE t_result.

* Calculations
**********************************************************************
    " comment/uncomment these lines for different calculations

* result = 2 + 3.
* result = 2 - 3.
* result = 2 * 3.
* result = 2 / 3.
*
* result = sqrt( 2 ).
* result = ipow( base = 2 exp = 3 ).
*
* result = ( 8 * 7 - 6 ) / ( 5 + 4 ).
* result = 8 * 7 - 6 / 5 + 4.

* Output
**********************************************************************

*  out->write( result ).

*  DATA test12 TYPE string.
*  test12 = |Hallo World|.
*
*  DATA(test13) = |Hello World|.
*
*
*  out->write( test12 ).
*  out->write( test13 ).


*  DATA(amount) = 12.
*  out->write( |Hello { amount + amount } World| ).

* Declarations
***********************************************************************
*    TYPES t_amount TYPE  p LENGTH 8 DECIMALS 2.
*
*    DATA amount   TYPE t_amount VALUE '3.30'.
*    DATA amount1  TYPE t_amount VALUE '1.20'.
*    DATA amount2  TYPE t_amount VALUE '2.10'.
*
*    DATA the_date  TYPE d                     VALUE '19891109'.
*    DATA my_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-273.15'.
*
*    DATA part1 TYPE string VALUE `Hello`.
*    DATA part2 TYPE string VALUE `World`.

* String Templates
**********************************************************************

  " comment/uncomment the following lines for different examples
*  DATA(text) = |Hello World|.
*  DATA(text) = |Total: { amount } EUR|.
*  DATA(text) = |Total: { amount1 + amount2 } EUR|.

* Format Options
**********************************************************************

  "Date
*  DATA(text) = |Raw Date: { the_date             }|.
*  DATA(text) = |ISO Date: { the_date Date = ISO  }|.
*  DATA(text) = |USER Date:{ the_date Date = USER }|.

  "Number
*  DATA(text) = |Raw Number { my_number                    }|.
*  DATA(text) = |User Format { my_number NUMBER = USER      }|.
*  DATA(text) = |Sign Right { my_number SIGN = RIGHT       }|.
*  DATA(text) = |Scientific { my_number STYLE = SCIENTIFIC }|.

* String expression (concatenation Operator)
**********************************************************************

*  DATA(text) = part1 && part2.
*  DATA(text) = part1 && | | && part2.
*  DATA(text) = |{ amount1 } + { amount2 }| &&
*               | = | &&
*               |{ amount1 + amount2 }|.

*  DATA(text) = part1 && amount1.

* Output
**********************************************************************

*  out->write( text ).


*  DATA number TYPE i.
*  number = -1.
*
*  CASE number.
*    WHEN 10.
*      out->write( 'Test 1' ).
*    WHEN 25.
*      out->write( 'Test 2' ).
*    WHEN 0.
*      out->write( 'Test 3' ).
*    WHEN OTHERS.
*      out->write( 'Test 4' ).
*  ENDCASE.

*    IF number = 0.
*      out->write( `The value of NUMBER equals zero`            ).
*    ELSEIF number > 0.
*      out->write( `The value of NUMBER is greater than zero`   ).
*    ELSE.
*      out->write( `The value of NUMBER is less than zero`      ).
*    ENDIF.



* Declarations
**********************************************************************
*  DATA result TYPE i.
*
*  DATA numbers TYPE TABLE OF i.
*
** Preparation
***********************************************************************
*
*  APPEND 123 TO numbers.
*  APPEND 456 TO numbers.

** Example 1: Conversion Error (no Number)
***********************************************************************
*
**  CONSTANTS c_text TYPE string VALUE 'ABC'.
*  CONSTANTS c_text TYPE string VALUE '123'.
*
*  out->write(  `---------------------------` ).
*  out->write(  `Example 1: Conversion Error` ).
*  out->write(  `---------------------------` ).
*
*  TRY.
*      result = c_text.
*      out->write( |Converted content is { result }|  ).
*    CATCH cx_sy_conversion_no_number.
*      out->write( |Error: { c_text } is not a number!| ).
*  ENDTRY.

* Example 2: Division by Zero
**********************************************************************
*
**  CONSTANTS c_number TYPE i VALUE 0.
*  CONSTANTS c_number TYPE i VALUE 7.
*
*  out->write(  `---------------------------` ).
*  out->write(  `Example 2: Division by Zero` ).
*  out->write(  `---------------------------` ).
*
*  TRY.
*      result = 100 / c_number.
*      out->write( |100 divided by { c_number } equals { result }| ).
*    CATCH cx_sy_zerodivide.
*      out->write(  `Error: Division by zero is not defined!` ).
*  ENDTRY.
**
* Example 3: Itab Error (Line Not Found)
**********************************************************************

*  CONSTANTS c_index TYPE i VALUE 3.
*  CONSTANTS c_index TYPE i VALUE 1.

*  out->write(  `-------------------------` ).
*  out->write(  `Example 3: Line Not Found` ).
*  out->write(  `-------------------------` ).
*
*  TRY.
*      result = numbers[ c_index ].
*      out->write( |Content of row { c_index } equals { result }| ).
*    CATCH cx_sy_itab_line_not_found.
*      out->write( |Error: Itab has less than { c_index } rows!| ).
*  ENDTRY.

*
** Example 4: Combination of Different Exceptions
***********************************************************************
*  CONSTANTS c_char TYPE c LENGTH 1 VALUE 'X'.
*  CONSTANTS c_char TYPE c length 1 value '0'.
*  CONSTANTS c_char TYPE c LENGTH 1 VALUE '1'.
*  CONSTANTS c_char TYPE c length 1 value '3'.

*  out->write(  `----------------------` ).
*  out->write(  `Example 4: Combination` ).
*  out->write(  `----------------------` ).
*
*  TRY.
*      result = numbers[ 3 / c_char ].
*      out->write( |Result: { result } | ).
*    CATCH cx_sy_zerodivide.
*      out->write( `Error: Division by zero is not defined`  ).
*    CATCH cx_sy_conversion_no_number.
*      out->write( |Error: { c_char } is not a number! | ).
*    CATCH cx_sy_itab_line_not_found.
*      out->write( |Error: Itab contains less than { 2 / c_char } rows| ).
*  ENDTRY.


*  DO 10 TIMES.
*    out->write( 'Fuck alting' ).
*  ENDDO.

*  DATA value TYPE i VALUE 0.
*
*  DO.
*    value = value + 1.
*    out->write( |{ value }| ).
*    IF value > 5.
*      EXIT.
*     ENDIF.
*  ENDDO.

*
*  DATA number TYPE i.
*  DATA numbers TYPE TABLE OF i.
*  DATA numbers_2 TYPE TABLE OF i.
*
*  APPEND 1234 TO numbers.
*  APPEND number TO numbers.
*  APPEND 987 TO numbers.
**
**  out->write( numbers[ 1 ] ).
**  out->write( numbers[ 2 ] ).
**  out->write( numbers[ 3 ] ).
*
*  LOOP AT numbers INTO number.
*    APPEND number to numbers_2.
*    out->write( |{ number }| ).
*  ENDLOOP.
*
*  LOOP AT numbers_2 INTO DATA(number_2).
*    out->write( |ROW: { sy-tabix }| ).
*    out->write( |CONTENT: { number_2 }| ).
*  ENDLOOP.
*
*  out->write( '--------' ).


  DATA char_i TYPE c LENGTH 5 VALUE 'hej12'.
  DATA char_o TYPE c LENGTH 1.
  DATA string1 TYPE string VALUE '12'.
  DATA string2 TYPE string VALUE '12'.

*  char_o = char_i[ 1 ].
  out->write( boolc( string1 = string2 ) ).






  ENDMETHOD.

ENDCLASS.
