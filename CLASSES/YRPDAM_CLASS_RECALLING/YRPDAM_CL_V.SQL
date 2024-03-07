*&---------------------------------------------------------------------*
*&  Include           YRPLPO05V
*&---------------------------------------------------------------------*
TYPES: BEGIN OF gty_vbak,
vbeln	TYPE vbeln_va,
erdat TYPE erdat,
erzet	TYPE erzet,
auart TYPE auart,
kunnr TYPE kunag,
netwr TYPE netwr,
waerk TYPE waerk,
END OF gty_vbak,

BEGIN OF gty_kna1,
kunnr TYPE kunag,
name1	TYPE name1_gp,
name2	TYPE name2_gp,
END OF gty_kna1,

BEGIN OF gty_tabf,
vbeln	TYPE vbeln_va,
erdat	TYPE erdat,
erzet	TYPE erzet,
auart TYPE auart,
kunnr TYPE kunag,
netwr TYPE netwr,
waerk TYPE waerk,
name1	TYPE name1_gp,
name2	TYPE name2_gp,

END OF gty_tabf.

TYPES: gty_ti_vbak TYPE STANDARD TABLE OF gty_vbak,
gty_ti_kna1 TYPE STANDARD TABLE OF gty_kna1,
gty_ti_tabf TYPE STANDARD TABLE OF gty_tabf.

DATA: gti_vbak TYPE gty_ti_vbak,
      ges_vbak TYPE gty_vbak, "WA
      gti_kna1 TYPE gty_ti_kna1,
      ges_kna1 TYPE gty_kna1, "WA
      gti_tabf TYPE gty_ti_tabf,
      ges_tabf TYPE gty_tabf. "WA

TYPES: gty_r_vbeln TYPE RANGE OF vbeln,
       gty_r_erdat TYPE RANGE OF erdat,
       gty_r_auart TYPE RANGE OF auart,
       gty_r_stcd1 TYPE RANGE OF stcd1.


DATA: gv_vbeln TYPE vbeln,
      gv_erdat TYPE erdat,
      gv_auart TYPE auart,
     	gv_stcd1 TYPE stcd1.