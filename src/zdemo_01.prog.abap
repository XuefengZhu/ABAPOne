*&---------------------------------------------------------------------*
*& Report ZDEMO_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zdemo_01.

CONSTANTS gc_name TYPE c LENGTH 10 VALUE '张三' .


TYPES gty_vbeln TYPE vbeln.

TYPES: BEGIN OF ty_object,
         field1 TYPE char10,
         field2 TYPE char10,
         field3 TYPE char10,
         field4 TYPE char10,
         field5 TYPE char10,
       END OF ty_object.

PARAMETERS p1 TYPE char100.

PARAMETERS p_VBELN TYPE vbeln.
PARAMETERS p_VBELN2 TYPE  gty_vbeln.

DATA lt_vbak TYPE STANDARD TABLE OF vbak.
DATA ls_vbak LIKE LINE OF lt_vbak.

DATA gs_demo TYPE zgs_demo.

DATA lv_SO_NO TYPE char100.

DATA ld_date TYPE d.
DATA lc_char TYPE c LENGTH 10.
DATA lc_char2(10) TYPE c.
DATA lc_char3 TYPE char10.


INITIALIZATION.

AT SELECTION-SCREEN.
  PERFORM fm_CHECK_SO_NUM.


  DATA lv_test TYPE i.

START-OF-SELECTION.


  ls_vbak-abhod = '12'.

  PERFORM fm_get_data.

  PERFORM fm_ouput_data.
  DATA li_test TYPE i.
  li_test = li_test + 1.

*&---------------------------------------------------------------------*
*& Form fm_CHECK_SO_NUM
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fm_CHECK_SO_NUM .
  IF p1 CS 'A'.
    MESSAGE '输入不合法' TYPE 'E'.
  ENDIF.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form FM_GET_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fm_get_data .
  SELECT * FROM vbak INTO TABLE lt_vbak.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form fm_ouput_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM fm_ouput_data .

  WRITE: 'test'.
  WRITE: gc_name.
  WRITE: TEXT-001.

*  LOOP AT lt_vbak INTO ls_vbak.
*    WRITE ls_vbak-vbeln.
*    NEW-LINE.
*    WRITE ls_vbak-erdat.
*
*  ENDLOOP.
ENDFORM.
