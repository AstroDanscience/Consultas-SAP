*&---------------------------------------------------------------------*
*&  Include           YRPDAM03V
*&---------------------------------------------------------------------*

TYPES:
  BEGIN OF st1,
    n_Docu TYPE vbeln,
    k_factura TYPE fkart,
    date TYPE fkdat,
    moneda TYPE waerk,
    valor TYPE netwr,
  END OF st1.

 TYPES:
   BEGIN OF st2,
     vbeln TYPE vbeln,
     fkdat TYPE fkdat,
     datum TYPE sy-datum,
     dias TYPE I,
     estad TYPE CHAR10,
   END OF st2.

 TYPES:
    table_st1 TYPE STANDARD TABLE OF st1,
    table_st2 TYPE STANDARD TABLE OF st2.

 DATA:
    gst_st1 TYPE st1,
    gst_st2 TYPE st2,
    gti_st1 TYPE table_st1,
    gti_st2 TYPE table_st2.