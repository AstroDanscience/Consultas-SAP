
REPORT YBC430_00_STRUCT_DEEP.

DATA:
      wa_Person TYPE YPERSON00,
      wa_Phone TYPE ADDRS_TELEPHONE_NUMBER.

START-OF-SELECTION.

  wa_Person-name-firstname = 'Harry'.
  wa_Person-name-lastname = 'Potter'.
  wa_Person-street = 'Privet Drive'.
  wa_Person-nr = '3'.
  wa_Person-zip = 'GB-10889'.
  wa_Person-city = 'London'.

  wa_Phone-telephone_id = 'p'.
  wa_Phone-tel_number = '+573215386359'.
  INSERT wa_Phone INTO TABLE wa_Person-phone.

  wa_Phone-telephone_id = 'a'.
  wa_Phone-tel_number = '+5732146359'.
  INSERT wa_Phone INTO TABLE wa_Person-phone.

  wa_Phone-telephone_id = 'M'.
  wa_Phone-tel_number = '+5578479324'.
  INSERT wa_Phone INTO TABLE wa_Person-phone.

  WRITE: / wa_Person-name-firstname,
           wa_Person-name-lastname,
           wa_Person-street,
           wa_Person-nr,
           wa_Person-zip,
           wa_Person-city.

  WRITE: / 'Phone Number:'.

  LOOP AT wa_Person-phone INTO wa_phone.
    WRITE: AT 20 wa_phone-telephone_id,
                 wa_phone-tel_number.
    NEW-LINE.
  ENDLOOP.