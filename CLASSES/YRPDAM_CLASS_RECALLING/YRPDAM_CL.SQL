REPORT yrpdam_cl.

INCLUDE YRPDAM_CL_V.
INCLUDE YRPDAM_CL_P.
INCLUDE YRPDAM_CL_F.
INCLUDE YRPDAM_CL_C.

START-OF-SELECTION.

  DATA:lcl_report TYPE REF TO lcl_reporte_pedidos.

       CREATE OBJECT LCL_REPORT
         exporting
           I_R_VBELN  = SO_VBELN[]
           I_R_ERDAT  = SO_ERDAT[]
           I_R_AUART  = SO_AUART[]
           I_R_STCD1  = SO_STCD1[]
           I_RB_MOALV = RB_MOALV
           I_RB_DOWNL = RB_DOWNL
         .

  lcl_report->start_of_selection( ).