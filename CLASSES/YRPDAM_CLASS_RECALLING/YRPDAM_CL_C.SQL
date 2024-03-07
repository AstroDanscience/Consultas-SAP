*&---------------------------------------------------------------------*
*&  Include           YRPLPO05C
*&---------------------------------------------------------------------*

CLASS lcl_reporte_pedidos DEFINITION.

  PUBLIC SECTION.
    METHODS start_of_selection.


    METHODS consultar_datos IMPORTING i_r_vbeln TYPE gty_r_vbeln
                                      i_r_erdat TYPE gty_r_erdat
                                      i_r_auart TYPE gty_r_auart
                                      i_r_stcd1 TYPE gty_r_stcd1
                            EXPORTING e_ti_vbak TYPE gty_ti_vbak
                                      e_ti_kna1 TYPE gty_ti_kna1.

    METHODS agrupar_datos   IMPORTING i_ti_vbak TYPE gty_ti_vbak
                                      i_ti_kna1 TYPE gty_ti_kna1
                            EXPORTING e_ti_tabf TYPE gty_ti_tabf
                                      e_es_vbak TYPE gty_vbak
                                      e_es_kna1 TYPE gty_kna1
                                      e_es_tabf TYPE gty_tabf.

    METHODS mostrar_datos   EXPORTING e_ti_tabf TYPE gty_ti_tabf.

    METHODS constructor     IMPORTING i_r_vbeln TYPE gty_r_vbeln
                                      i_r_erdat TYPE gty_r_erdat
                                      i_r_auart TYPE gty_r_auart
                                      i_r_stcd1 TYPE gty_r_stcd1
                                      i_rb_moalv  TYPE c
                                      i_rb_downl  TYPE c.
  PRIVATE SECTION.
    DATA: gv_vbeln  TYPE gty_r_vbeln,
          gv_erdat  TYPE gty_r_erdat,
          gv_auart  TYPE gty_r_auart,
          gv_stcd1  TYPE gty_r_stcd1,
          g_ti_vbak TYPE gty_ti_vbak,
          g_ti_kna1 TYPE gty_ti_kna1,
          g_ti_tabf TYPE gty_ti_tabf,
          g_es_vbak TYPE gty_vbak,
          g_es_kna1 TYPE gty_kna1,
          e_es_tabf TYPE gty_tabf,
          gv_moalv  TYPE c,
          gv_downl  TYPE c.

   DATA: go_report TYPE REF TO YCLNW01CPA.


ENDCLASS.

CLASS lcl_reporte_pedidos IMPLEMENTATION.

  METHOD constructor.

    me->gv_vbeln = i_r_vbeln.
    me->gv_erdat = i_r_erdat.
    me->gv_auart = i_r_auart.
    me->gv_stcd1 = i_r_stcd1.
    me->gv_moalv = i_rb_moalv.
    me->gv_downl = i_rb_downl.



  ENDMETHOD.
  METHOD start_of_selection.

     CREATE OBJECT GO_REPORT
      exporting
        I_R_VBELN  = gv_vbeln   " Ámbitos de valores para VBELN
        I_R_ERDAT  = gv_erdat   " Ámbitos de valores para CREATED DATE
        I_R_AUART  = gv_auart    " Ámbitos de valores para AUART
        I_R_STCD1  = gv_stcd1    " TIPO TABLA RANGO PARA STCD1
        I_RB_MOALV = gv_moalv
        I_RB_DOWNL = gv_downl
      .

     go_report->STAR_OF_SELECTION( ).

*    me->consultar_datos(
*      EXPORTING
*        i_r_vbeln =  me->gv_vbeln
*        i_r_erdat =  me->gv_erdat
*        i_r_auart =  me->gv_auart
*        i_r_stcd1 =  me->gv_stcd1
*      IMPORTING
*        e_ti_vbak =  me->g_ti_vbak
*        e_ti_kna1 =  me->g_ti_kna1
*    ).
*
*    me->agrupar_datos(
*      EXPORTING
*        i_ti_vbak = g_ti_vbak
*        i_ti_kna1 = g_ti_kna1
*      IMPORTING
*        e_ti_tabf =  g_ti_tabf
*        e_es_vbak =  g_es_vbak
*        e_es_kna1 =  g_es_kna1
*        e_es_tabf =  e_es_tabf
*    ).
*
*    me->mostrar_datos(
*      IMPORTING
*        e_ti_tabf =  g_ti_tabf
*    ).

  ENDMETHOD.

  METHOD consultar_datos .

    SELECT vbeln erdat erzet auart kunnr netwr waerk
      FROM vbak
      INTO TABLE  e_ti_vbak
      WHERE vbeln IN i_r_vbeln AND erdat IN i_r_erdat
      AND auart IN i_r_auart.

    IF sy-subrc EQ 0.
      SELECT kunnr name1 name2
       FROM kna1
       INTO TABLE e_ti_kna1
       FOR ALL ENTRIES IN e_ti_vbak
       WHERE kunnr = e_ti_vbak-kunnr.
    ENDIF.

  ENDMETHOD.

  METHOD agrupar_datos.
    LOOP AT i_ti_vbak INTO e_es_vbak.

      READ TABLE  i_ti_kna1 INTO e_es_kna1
      WITH KEY kunnr = e_es_vbak-kunnr.
      IF sy-subrc EQ 0.
        e_es_tabf-vbeln = e_es_vbak-vbeln.
        e_es_tabf-erdat = e_es_vbak-erdat.
        e_es_tabf-erzet = e_es_vbak-erzet.
        e_es_tabf-auart = e_es_vbak-auart.
        e_es_tabf-netwr = e_es_vbak-netwr.
        e_es_tabf-waerk = e_es_vbak-waerk.

        IF sy-subrc EQ 0.
          e_es_tabf-name1 = e_es_kna1-name1.
          e_es_tabf-name2 = e_es_kna1-name2.

          APPEND e_es_tabf TO e_ti_tabf.
        ENDIF.
      ENDIF.

      CLEAR e_es_tabf.
    ENDLOOP.
  ENDMETHOD.

  METHOD mostrar_datos.

    IF rb_moalv ='X'.
      DATA: lo_salv TYPE REF TO cl_salv_table.
      TRY.
          CALL METHOD cl_salv_table=>factory
            EXPORTING
              list_display = if_salv_c_bool_sap=>false
            IMPORTING
              r_salv_table = lo_salv
            CHANGING
              t_table      = e_ti_tabf.
        CATCH cx_salv_msg .
      ENDTRY.


      lo_salv->display( ).
    ELSEIF rb_downl = 'X'.
      DATA(lv_message) = 'Opción no habilitada.'.
      MESSAGE lv_message TYPE 'I' DISPLAY LIKE 'E'.
    ENDIF.
  ENDMETHOD.
ENDCLASS.