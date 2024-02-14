REPORT  YBC401.

/* This code integrates task1,task2, task3 of unit 12 from TAW10_1 ABAP WORKBENCH FUNDAMENTALS.

Business Example: You are a programmer at ABC Travel. Your task is to add several fields to the
selection screen of an existing report, create a tabstrip, and adjust data retrieval
accordingly.
 */

INCLUDE YBC401_00_MAINv.
INCLUDE YBC401_00_MAINp.
INCLUDE YBC401_00_MAINf.

INITIALIZATION.
  PERFORM initialization.

START-OF-SELECTION.
  PERFORM start_selection.