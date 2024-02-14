FORM INITIALIZATION .
  tab1 = 'Connections'.
  tab2 = 'Date'.
  tab3 = 'Type of flight'.
  title = 'Flight Details'.
ENDFORM.                   

FORM START_SELECTION .

CASE mark.
  when rb_allf.
    SELECT * FROM  dv_flights INTO wa_flight WHERE carrid IN so_carid AND connid IN so_conid AND fldate IN so_fdate
    AND cityfrom IN so_cfrom AND cityto IN so_cto.

    WRITE: / wa_flight-carrid,
             wa_flight-connid,
             wa_flight-fldate,
             wa_flight-countryfr,
             wa_flight-cityfrom,
             wa_flight-airpfrom,
             wa_flight-countryto,
             wa_flight-cityto,
             wa_flight-airpto,
             wa_flight-seatsmax,
             wa_flight-seatsocc.
    ENDSELECT.

   when rb_dom.
    SELECT * FROM  dv_flights INTO wa_flight WHERE carrid IN so_carid AND connid IN so_conid AND fldate IN so_fdate AND countryto = dv_flights~countryfr
    AND countryfr EQ pa_ctry AND cityfrom IN so_cfrom AND cityto IN so_cto.
    WRITE: / wa_flight-carrid,
             wa_flight-connid,
             wa_flight-fldate,
             wa_flight-countryfr,
             wa_flight-cityfrom,
             wa_flight-airpfrom,
             wa_flight-countryto,
             wa_flight-cityto,
             wa_flight-airpto,
             wa_flight-seatsmax,
             wa_flight-seatsocc.
    ENDSELECT.

   when rb_int.
     SELECT * FROM  dv_flights INTO wa_flight WHERE carrid IN so_carid AND connid IN so_conid AND fldate IN so_fdate AND countryto NE dv_flights~countryfr
     AND cityfrom IN so_cfrom AND cityto IN so_cto.

    WRITE: / wa_flight-carrid,
             wa_flight-connid,
             wa_flight-fldate,
             wa_flight-countryfr,
             wa_flight-cityfrom,
             wa_flight-airpfrom,
             wa_flight-countryto,
             wa_flight-cityto,
             wa_flight-airpto,
             wa_flight-seatsmax,
             wa_flight-seatsocc.
    ENDSELECT.
ENDCASE.

ENDFORM.  