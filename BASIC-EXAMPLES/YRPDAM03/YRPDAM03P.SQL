*&---------------------------------------------------------------------*
*&  Include           YRPDAM03P
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK blq1 WITH FRAME TITLE text-001.
  DATA:so_Fkart TYPE fkart,
       so_Fkdat TYPE fkdat.
  SELECT-OPTIONS:
       o_Fkart for so_Fkart,
       o_Fkdat for so_Fkdat.

SELECTION-SCREEN END OF BLOCK blq1.