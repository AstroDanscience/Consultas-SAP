*&---------------------------------------------------------------------*
*&  Include           YRPDAM03F
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Form  SELECTION
*&---------------------------------------------------------------------*

FORM start_of_selection .

  SELECT VBELN FKART FKDAT WAERK NETWR FROM VBRK INTO TABLE gti_st1 WHERE fkart in o_Fkart AND fkdat in o_Fkdat .

  LOOP AT gti_st1 INTO gst_st1.
    write: / gst_st1-n_Docu,
            gst_st1-k_factura,
            gst_st1-date,
            gst_st1-moneda,
            gst_st1-valor.
    gst_st2-vbeln = gst_st1-n_Docu.
    gst_st2-fkdat = gst_st1-date.
    gst_st2-datum = sy-datum.
    gst_st2-dias = sy-datum - gst_st1-date.
    append gst_st2 TO gti_st2.
  ENDLOOP.

  ULINE.

  LOOP AT gti_st2 INTO gst_st2.

    IF gst_st2-dias GT 1000.
      gst_st2-estad = 'MOROSO'.
    ELSEIF gst_st2-dias GT 2000.
      gst_st2-estad = 'MOROSOEMBA'.
    ELSEIF gst_st2-dias < 1000.
      gst_st2-estad = 'RECUPERADO'.
    ENDIF.
     write: / gst_st2-vbeln,
            gst_st2-fkdat,
            gst_st2-datum,
            gst_st2-dias,
            gst_st2-estad.

  ENDLOOP.

ENDFORM.