*&---------------------------------------------------------------------*
*&  Include           YRPLPO05F
*&---------------------------------------------------------------------*

FORM start_of_selection .
  PERFORM: consultar_datos CHANGING gti_vbak
           gti_kna1,
           agrupar_datos USING gti_vbak gti_kna1 CHANGING gti_tabf,
           mostrar_datos USING gti_tabf.


ENDFORM.                    " START_OF_SELECTION
*&---------------------------------------------------------------------*
*&      Form  consultar_dato
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM consultar_datos  USING
      gti_vbak type gty_ti_vbak
                      gti_kna1 type gty_ti_kna1.
  SELECT vbeln erdat erzet auart kunnr netwr waerk
  FROM vbak
  INTO TABLE  gti_vbak
  WHERE vbeln IN so_vbeln AND erdat IN so_erdat
    AND auart IN so_auart.

    If sy-subrc eq 0.
    select kunnr name1 name2
    from kna1
    into table gti_kna1
    FOR ALL ENTRIES IN gti_vbak
      where kunnr = gti_vbak-kunnr.
      endif.


ENDFORM.                    " YRPLPO05C
*&---------------------------------------------------------------------*
*&      Form  agrupar_datos
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM agrupar_datos USING gti_vbak type gty_ti_vbak
                     gti_kna1 type gty_ti_kna1
            CHANGING gti_tabf type gty_ti_tabf.

  LOOP AT gti_vbak into ges_vbak.



    READ TABLE  gti_kna1 INTO ges_kna1
   WITH KEY kunnr = ges_vbak-kunnr.
if sy-subrc eq 0.
    ges_tabf-vbeln = ges_vbak-vbeln.
    ges_tabf-ERDAT = ges_vbak-ERDAT.
    ges_tabf-ERZET = ges_vbak-ERZET.
    ges_tabf-AUART = ges_vbak-AUART.

    ges_tabf-NETWR = ges_vbak-NETWR.
    ges_tabf-WAERK = ges_vbak-WAERK.

    IF sy-subrc EQ 0.
      ges_tabf-NAME1 = ges_kna1-NAME1.
      ges_tabf-NAME2 = ges_kna1-NAME2.

    APPEND ges_tabf TO gti_tabf.
    ENDIF.
ENDIF.

    CLEAR ges_tabf.
  ENDLOOP.
ENDFORM.                    " YRPLPO05A
*&---------------------------------------------------------------------*
*&      Form  mostrar_datos
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM mostrar_datos USING gti_tabf type gty_ti_tabf.


  IF RB_MOALV ='X'.


    DATA: lo_salv TYPE REF TO cl_salv_table.
    TRY.
      CALL METHOD cl_salv_table=>factory
      EXPORTING
        list_display   = IF_SALV_C_BOOL_SAP=>FALSE
      IMPORTING
        r_salv_table   = lo_salv
      CHANGING
        t_table        = gti_tabf
        .
    CATCH cx_salv_msg .
    ENDTRY.


lo_salv->display( ).
ELSEIF RB_DOWNL = 'X'.
    DATA(lv_message) = 'Opción no habilitada.'.
    MESSAGE lv_message TYPE 'I' DISPLAY LIKE 'E'.
  ENDIF.
ENDFORM.           