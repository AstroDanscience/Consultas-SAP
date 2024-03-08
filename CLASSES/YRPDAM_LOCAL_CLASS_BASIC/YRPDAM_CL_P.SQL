*&---------------------------------------------------------------------*
*&  Include           YRPSDNW01_0_MP
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK blq1 WITH FRAME TITLE text-001.

  SELECT-OPTIONS: so_vbeln for gwa_so-gv_vbeln,
                  so_erdat for gwa_so-gv_erdat,
                  so_auart for gwa_so-gv_auart.

SELECTION-SCREEN END OF BLOCK blq1.

 SELECTION-SCREEN BEGIN OF BLOCK blq2 WITH FRAME TITLE text-002.

    SELECT-OPTIONS: so_vkorg FOR gwa_so-gv_vkorg,
                    so_vtweg FOR gwa_so-gv_vtweg,
                    so_spart FOR gwa_so-gv_spart.

SELECTION-SCREEN END OF BLOCK blq2.