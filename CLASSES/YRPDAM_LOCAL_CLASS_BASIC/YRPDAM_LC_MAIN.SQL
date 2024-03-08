*&---------------------------------------------------------------------*
*& Report  YRPDAM_CL_MAIN
*&
*&---------------------------------------------------------------------*


REPORT YRPSDNW01_0.

INCLUDE YRPDAM_CL__V.  "Variables include.
INCLUDE YRPDAM_CL_P.  "Parameters include.
INCLUDE YRPDAM_CL_F.  "Subroutines include.
INCLUDE YRPDAM_CL_C.


START-OF-SELECTION.
*  PERFORM start_of_selection.
  DATA: lo_reporte TYPE REF TO lcl_reporte.

      CREATE OBJECT lo_reporte
        EXPORTING

            I_r_vbeln = so_vbeln[]
            I_r_auart = so_auart[]
            I_r_erdat = so_erdat[]
            I_r_vkorg = so_vkorg[]
            I_r_vtweg = so_vtweg[]
            I_r_spart = so_spart[]
          .

        lo_reporte->start_of_selection( ).