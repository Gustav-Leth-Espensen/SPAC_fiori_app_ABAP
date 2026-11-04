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


  DATA my_int TYPE i.
  DATA my_int2 TYPE i.
  DATA my_pack TYPE p LENGTH 8 DECIMALS 2.
  DATA my_char10 TYPE c LENGTH 10 VALUE 'abcdefghij'.
  DATA my_char4 TYPE c LENGTH 4.
  DATA my_string TYPE string.
  DATA my_bool TYPE abap_bool.
  DATA val TYPE c.

  my_int = '1234'.
  my_int2 = 1234.

*  my_bool = abap_true.
**  my_bool = my_int = my_int2.
  out->write( '----------' ).
*
*  my_bool = abap_false.
*  out->write( my_bool ).
  val = boolc( my_int = my_int2 ).
  out->write( val ).

  ENDMETHOD.

ENDCLASS.
