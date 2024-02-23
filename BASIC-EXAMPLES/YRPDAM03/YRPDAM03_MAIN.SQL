*&---------------------------------------------------------------------*
*& Report  YRPDAM03
*&
*&---------------------------------------------------------------------*
*&This code retrieves fields from VBRK table. Then some logical operations are performed.
*&Then the results are displayed in the screen.
*&
*&---------------------------------------------------------------------*

REPORT YRPDAM03.

INCLUDE YRPDAM03v.
INCLUDE YRPDAM03p.
INCLUDE YRPDAM03f.

START-OF-SELECTION.
  PERFORM start_of_selection.