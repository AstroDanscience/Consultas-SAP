
SELECTION-SCREEN BEGIN OF BLOCK blq1 WITH FRAME TITLE text-001.

  DATA: user_Name TYPE UNAME,
        client_Name TYPE NAME1_GP,
        client_Name1 TYPE NAME2_GP,
        client_Name2 TYPE NAME3_GP,
        client_Name3 TYPE NAME4_GP.
  SELECT-OPTIONS:
      Nombre FOR user_Name.

SELECTION-SCREEN END OF BLOCK blq1.