
SELECTION-SCREEN BEGIN OF SCREEN 1100 AS SUBSCREEN.
SELECTION-SCREEN BEGIN OF BLOCK blq1 WITH FRAME TITLE text-001.

SELECT-OPTIONS:
    so_carid FOR wa_flight-carrid,
    so_conid FOR wa_flight-connid,
    so_cfrom FOR wa_flight-cityfrom MODIF ID but,
    so_cto FOR wa_flight-cityto MODIF ID but.

SELECTION-SCREEN PUSHBUTTON /10(20) title USER-COMMAND comm.

SELECTION-SCREEN END OF BLOCK blq1.
SELECTION-SCREEN END OF SCREEN 1100.

SELECTION-SCREEN BEGIN OF SCREEN 1200 AS SUBSCREEN.
  SELECT-OPTIONS so_fdate FOR wa_flight-fldate NO-EXTENSION.
SELECTION-SCREEN END OF SCREEN 1200.

SELECTION-SCREEN BEGIN OF SCREEN 1300 AS SUBSCREEN.

SELECTION-SCREEN BEGIN OF BLOCK blq2 WITH FRAME TITLE text-002.

PARAMETERS:
  pa_ctry LIKE wa_flight-countryfr,
  rb_allf RADIOBUTTON GROUP g1,
  rb_dom RADIOBUTTON GROUP g1,
  rb_int RADIOBUTTON GROUP g1 DEFAULT 'X'.

SELECTION-SCREEN END OF BLOCK blq2.
SELECTION-SCREEN END OF SCREEN 1300.

SELECTION-SCREEN BEGIN OF TABBED BLOCK tab_blq1 FOR 10 LINES.

  SELECTION-SCREEN TAB (10) tab1 USER-COMMAND comm1 DEFAULT SCREEN 1100.
  SELECTION-SCREEN TAB (20) tab2 USER-COMMAND comm2 DEFAULT SCREEN 1200.
  SELECTION-SCREEN TAB (10) tab3 USER-COMMAND comm3 DEFAULT SCREEN 1300.

SELECTION-SCREEN END OF BLOCK tab_blq1.

AT SELECTION-SCREEN ON BLOCK blq2.
  IF rb_dom EQ 'X' AND pa_ctry = space.
    MESSAGE 'Please provide country' TYPE 'I'.
  ENDIF.

AT SELECTION-SCREEN.

 CASE sscrfields-ucomm.
   WHEN 'COMM'.
     CHECK sy-dynnr = 1100.
       IF switch = '1'.
           title = 'Flight Details'.
           switch = '0'.

       ELSE.
          title = 'Hide Details'.
          switch = '1'.
       ENDIF.
     ENDCASE.

AT SELECTION-SCREEN OUTPUT.

  LOOP AT SCREEN.
       CASE screen-group1.
       	WHEN 'BUT'.
          IF switch = '1'.
            screen-active = '1'.
            MODIFY SCREEN.
          ELSE.
            screen-active = '0'.
            MODIFY SCREEN.
          ENDIF.
       ENDCASE.
  ENDLOOP.