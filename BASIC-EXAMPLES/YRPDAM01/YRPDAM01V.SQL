TYPES:
  BEGIN OF gty_st1,
    dir_fiscal type stcd1,
    dir_fiscal2 type stcd2,
    nombre1 type name1_gp,
    nombre2 type name2_gp,
    nombre3 type name3_gp,
    nombre4 type name4_gp,
  END OF gty_st1.

  TYPES:
  BEGIN OF gty_st1_copy,
    dir_fiscal type stcd1,
    dir_fiscal2 type stcd2,
    nombre1 type name1_gp,
    nombre2 type name2_gp,
    nombre3 type name3_gp,
    nombre4 type name4_gp,
  END OF gty_st1_copy.

TYPES:
  BEGIN OF gty_st2,
    idfactura type vbeln_vf,
    clase_factura type FKART,
    tipo_factura type FKTYP,
    grupo_precios type KONDA,
    grupo_cliente type KDGRP,
    zona_ventas type BZIRK,
    cond_pago type dzterm,
    via_pago type  schzw_bseg,
    grupo_imputacion type ktgrd,

  END OF gty_st2.

TYPES:
   table1 type STANDARD TABLE OF gty_st1,
   table2 type STANDARD TABLE OF gty_st2,
   table1_copy type STANDARD TABLE OF gty_st1_copy.

DATA:
      gca_st1 type gty_st1,
      gca_st2 type gty_st2,
      gca_st1_copy type gty_st1_copy,
      gti_table1 type table1,
      gti_table2 type table2,
      gti_table1_copy type table1_copy.

FIELD-SYMBOLS:
     <lfs_st1> TYPE gty_st1.  "Declaración de un FIELD SYMBOL con la estructura gty_st1

DATA:
     gti_r_table TYPE RANGE OF vbeln_va,       "Declaración de tabla rango
     gti_r_table2 TYPE SACO_VBELN_RANGES_TAB.  "Declaración de variable rango de una tipo rango del diccionario