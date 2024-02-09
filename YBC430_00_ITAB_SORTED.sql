-- In this report a nested structure was created. 

REPORT YBC430_00_ITAB_SORTED.

--First, two variables was created. An internal table zit_sflight00 and a databse tabled based on sflight.
DATA:
     it_flight TYPE zit_sflight00,
     wa_sflight TYPE sflight.

WRITE: /'Printout in tableorder of Database:'.

--Then, register of carrid equal to JL was retrieved and saved in wa_sflight.
SELECT * FROM sflight INTO wa_sflight WHERE carrid = 'JL'.

WRITE: / wa_sflight-carrid,
         wa_sflight-connid,
         wa_sflight-fldate,
         wa_sflight-price,
         wa_sflight-currency,
         wa_sflight-planetype.
ENDSELECT.

ULINE.

--Next, all registres from sflight where carrid='JL' was retrieved and stored into table it_flight. it_flight is the nested structure created 
--trough SE11 transaction.

SELECT * FROM sflight INTO TABLE it_flight WHERE carrid = 'JL'.
 WRITE: /'Printout in tableorder of sorted ITAB'.

 LOOP AT it_flight INTO wa_sflight.

WRITE: / wa_sflight-carrid,
         wa_sflight-connid,
         wa_sflight-fldate,
         wa_sflight-price,
         wa_sflight-currency,
         wa_sflight-planetype.

 ENDLOOP.
 