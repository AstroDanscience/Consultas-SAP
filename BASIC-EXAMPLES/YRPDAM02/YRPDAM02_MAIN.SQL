*&---------------------------------------------------------------------*
*& Report  YRPDAM02
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT YRPDAM02.

*The provided ABAP code retrieves data from two database tables and displays the flight 
*schedule information if the data retrieval is successful.

DATA: gt_flights TYPE STANDARD TABLE OF zsflightsa00001,
  gt_flights_schedule TYPE STANDARD TABLE OF zspflisa00001.

SELECT * FROM zsflightsa00001
   INTO TABLE gt_flights
   UP TO 3 ROWS.

IF sy-subrc EQ 0.

  SELECT * FROM zspflisa00001
    INTO TABLE gt_flights_schedule
    FOR ALL ENTRIES IN gt_flights
    WHERE carrid EQ gt_flights-carrid
      AND connid EQ gt_flights-connid.

  IF sy-subrc EQ 0.
    cl_demo_output=>display( gt_flights_schedule ).
  ENDIF.

ENDIF.