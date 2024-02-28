*&---------------------------------------------------------------------*
*& Report  YRPDAMBAPI
*&
*&---------------------------------------------------------------------*
*&In this report a new material is created trough BAPI_MATERIAL_SAVEDATA BAPI.
*&
*&---------------------------------------------------------------------*

REPORT YRPDAMBAPI.

DATA:
     lwa_bapimathead TYPE bapimathead,
     lwa_bapimara TYPE BAPI_MARA,
     lwa_bapimarax TYPE BAPI_MARAX,
     lwa_return TYPE BAPI_MATRETURN2,
     lwa_bapimakt TYPE BAPI_MAKT,
     lti_bapimakt TYPE TABLE OF BAPI_MAKT.

START-OF-SELECTION.

     lwa_bapimathead-Material = 'MATDAM103'.
     lwa_bapimathead-IND_SECTOR = '1'.
     lwa_bapimathead-MATL_TYPE = 'FGTR'.
     lwa_bapimara-MATL_GROUP = 'SVAR'.
     lwa_bapimara-BASE_UOM = 'KG'.
     lwa_bapimara-BASE_UOM_ISO = 'FH'.
     lwa_bapimarax-MATL_GROUP = 'X'.
     lwa_bapimarax-BASE_UOM = 'X'.
     lwa_bapimarax-BASE_UOM_ISO = 'X'.
     lwa_bapimakt-MATL_DESC = 'MATERIAL DE PRUEBA'.
     lwa_bapimakt-LANGU = 'ES'.
     lwa_bapimakt-LANGU_ISO = 'ES'.

     APPEND lwa_bapimakt TO lti_bapimakt.


CALL FUNCTION 'BAPI_MATERIAL_SAVEDATA'
  EXPORTING
    HEADDATA                   = lwa_bapimathead
   CLIENTDATA                 = lwa_bapimara
   CLIENTDATAX                = lwa_bapimarax
*   PLANTDATA                  =
*   PLANTDATAX                 =
*   FORECASTPARAMETERS         =
*   FORECASTPARAMETERSX        =
*   PLANNINGDATA               =
*   PLANNINGDATAX              =
*   STORAGELOCATIONDATA        =
*   STORAGELOCATIONDATAX       =
*   VALUATIONDATA              =
*   VALUATIONDATAX             =
*   WAREHOUSENUMBERDATA        =
*   WAREHOUSENUMBERDATAX       =
*   SALESDATA                  =
*   SALESDATAX                 =
*   STORAGETYPEDATA            =
*   STORAGETYPEDATAX           =
*   FLAG_ONLINE                = ' '
*   FLAG_CAD_CALL              = ' '
*   NO_DEQUEUE                 = ' '
*   NO_ROLLBACK_WORK           = ' '
 IMPORTING
   RETURN                     = lwa_return
 TABLES
   MATERIALDESCRIPTION        = lti_bapimakt
*   UNITSOFMEASURE             =
*   UNITSOFMEASUREX            =
*   INTERNATIONALARTNOS        =
*   MATERIALLONGTEXT           =
*   TAXCLASSIFICATIONS         =
*   RETURNMESSAGES             =
*   PRTDATA                    =
*   PRTDATAX                   =
*   EXTENSIONIN                =
*   EXTENSIONINX               =
          .

cl_demo_output=>display( lwa_return ).