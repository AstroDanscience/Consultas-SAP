*&---------------------------------------------------------------------*
*&  Include           YRPLPO05P
*&---------------------------------------------------------------------*
selection-screen begin of block  blq1 with frame title text-001.
select-options: so_vbeln for gv_vbeln,
                so_erdat for gv_erdat,
                so_auart for gv_auart,
                so_stcd1 for gv_stcd1.
PARAMETERS:
            RB_MOALV RADIOBUTTON GROUP 01,
            RB_DOWNL RADIOBUTTON GROUP 01.

selection-screen end of block blq1.