FORM START_OF_SELECTION .

    DATA: lti_st1 TYPE YTTDAM05,
          lst_st1 TYPE YSTDAM03,
          lti_st2 TYPE YTTDAM06,
          lst_st2 TYPE YSTDAM05,
          lti_uni TYPE YTTDAM07,
          lst_uni TYPE YSTDAM06.

    DATA: lo_reporte TYPE REF TO YCLDAM00REPORTE,
          lo_salv TYPE REF TO cl_salv_table.

    CREATE OBJECT LO_REPORTE.

TRY.

  lo_reporte->CONSULTAR_VBRK(
    exporting
      I_R_FKART = so_fkart[]
      I_R_FKDAT = so_fkdat[]
    importing
      E_TI_ST1  = lti_st1
  ).

    CATCH cx_salv_msg.
 ENDTRY.

lo_reporte->JOIN_VBRK_VBRP(
  importing
    E_TI_ST2 = lti_st2    " Tipo tabla para st2
    E_TI_UNI =  lti_uni   " Tipo tabla unificadora
     E_ST_UNI = lst_uni    " Estructura para unificar VBRK y VBRP
  changing
    C_ST_ST2 =  lst_st2   " Tipo tabLa para st1
    C_TI_ST1 =  lti_st1   " Tipo tabLa para st1
    C_ST_ST1 =  lst_st1
).




   TRY.
   CALL METHOD CL_SALV_TABLE=>FACTORY
*     EXPORTING
*       LIST_D7ISPLAY   = IF_SALV_C_BOOL_SAP=>FALSE
*       R_CONTAINER    =
*       CONTAINER_NAME =
     IMPORTING
       R_SALV_TABLE   = lo_salv
     CHANGING
       T_TABLE        = lti_uni
       .
      lo_salv->display( ).

    CATCH CX_SALV_MSG .
   ENDTRY.

*  PERFORM consulta_vbrk USING so_fkart[]
*                              so_fkdat[]
*                     CHANGING lti_st1.
*
*  PERFORM join_vbrk_vbrp
*  CHANGING lti_st1
*           lti_st2
*           lst_st2.

*  READ TABLE gti_st2 INTO gst_st2 WITH KEY vbeln = '90000067'.

  ENDFORM.                    " START_OF_SELECTION

*FORM CONSULTA_VBRK USING pr_fkart TYPE gty_r_fkart pr_fkdat TYPE gty_r_fkdat CHANGING lti_st1 TYPE ti_st1.
*
*  SELECT vbeln fkart fkdat waerk netwr
*     FROM VBRK
*     INTO TABLE lti_st1
*     WHERE fkart in pr_fkart AND fkdat in pr_fkdat.
**
**  LOOP AT pti_st1 INTO gst_st1.
**    WRITE: / gst_st1-vbeln,
**             gst_st1-fkart,
**             gst_st1-fkdat,
**             gst_st1-waerk,
**             gst_st1-netwr.
**  ENDLOOP.
*
*ENDFORM.                    " CONSULTA_VBRK
**&---------------------------------------------------------------------*
**&      Form  JOIN_VBRK_VBRP
**&---------------------------------------------------------------------*
**       text
**----------------------------------------------------------------------*
**  -->  p1        text
**  <--  p2        text
**----------------------------------------------------------------------*
*FORM JOIN_VBRK_VBRP CHANGING lti_st1 TYPE ti_st1 lti_st2 TYPE ti_st2 lst_st2 TYPE st2.
*
*     "Si yo voy a utilizar estos valores despues, entonces organizo la tabla por el campo ya que no necesito los demás campos
*  SORT lti_st1 BY vbeln.  "ordeno la tabla por el campo vbeln.
*  DELETE ADJACENT DUPLICATES FROM lti_st1 COMPARING vbeln.  "Elimino todos los registros duplicados.
*  IF lti_st1 IS NOT INITIAL.
*    SELECT vbeln matnr fkimg vrkme FROM vbrp INTO TABLE lti_st2 FOR ALL ENTRIES IN lti_st1 WHERE vbeln = lti_st1-vbeln.
*  ENDIF.
*  ULINE.
*
*  IF sy-subrc EQ 0.
*     LOOP AT lti_st2 INTO lst_st2.
*      WRITE: / lst_st2-vbeln,
*               lst_st2-fkart,
*               lst_st2-fkdat,
*               lst_st2-waerk,
*               lst_st2-netwr,
*               lst_st2-matnr,
*               lst_st2-fkimg,
*               lst_st2-vrkme.
*   ENDLOOP.
*   ELSE. MESSAGE 'NO results' TYPE 'I'.
*   ENDIF.
*
*ENDFORM.                    " JOIN_VBRK_VBRP