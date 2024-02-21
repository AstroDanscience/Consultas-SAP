*&---------------------------------------------------------------------*
*&  Include           YRPDAM01F
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  START_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  INITIALIZATION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM INITIALIZATION .

ENDFORM.                    " INITIALIZATION
*&---------------------------------------------------------------------*
*&      Form  START_OF_SELECTION
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM START_OF_SELECTION .

  gca_st1-dir_fiscal = '12345'. "Asignando elementos de dato
gca_st1-nombre1 = 'CC'.
gca_st1-nombre2 = 'Arenas'.

APPEND gca_st1 TO gti_table1. "SOLO PARA STANDARD

gca_st1-dir_fiscal = '43724155'. "Asignando elementos de dato
gca_st1-nombre1 = 'CC'.
gca_st1-nombre2 = 'Munera'.

APPEND gca_st1 TO gti_table1.

gca_st1-dir_fiscal = '43724155'. "Asignando elementos de dato"
gca_st1-nombre1 = 'TI'.
gca_st1-nombre2 = 'Pato'.

APPEND gca_st1 TO gti_table1.
*INSERT estruc_persona INTO estructura1. "SOLO PARA SORTED Y HASHED
*-----------------------------------------------------------------------

*------------------------------------------------------------------------
*Lectura de Valores

READ TABLE gti_table1 into gca_st1 WITH KEY nombre1 = '43724155'. "Con esto solo recupero un registro que cumpla la condición y lo almaceno en el Work Area
*write:gca_st1.

LOOP AT gti_table1 INTO gca_st1. "PARA RECUPERAR VARIOS REGISTROS
      write: / gca_st1.
ENDLOOP.
*------------------------------------------------------------------------

ULINE.

LOOP AT gti_table1 INTO gca_st1 WHERE dir_fiscal = '43724155'.
    APPEND gca_st1 TO gti_table1_copy.
    write: / gca_st1.
ENDLOOP.

*------------------------------------------------------------------------
*Modificación de Valores

READ TABLE gti_table1 ASSIGNING <lfs_st1> WITH KEY nombre1 = 'TI'. "Un unico registro
<lfs_st1>-nombre1 = 'New'.

LOOP AT gti_table1 ASSIGNING <lfs_st1> WHERE nombre1 = 'CC'.  "Varios registros
  <lfs_st1>-nombre1 = 'PAP'.
ENDLOOP.
*-------------------------------------------------------------------------

MESSAGE I002(YMSGDAM00) WITH 'LLavero Gaguito'. "Mostrar mensaje por clase de mensajes
*   El pedido &l tiene un retraso

ENDFORM.                    " START_OF_SELECTION