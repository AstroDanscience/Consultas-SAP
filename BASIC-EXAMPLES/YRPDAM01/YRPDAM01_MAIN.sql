REPORT YRPDAM01.


/* -- This ABAP program serves as an example of structured data manipulation within an SAP environment. Here's a more detailed description of its features and functionalities:

 *Definition of Data Types and Structures: The code defines two data structure types (gty_st1 and gty_st2) 
 with specific fields to store related information, such as fiscal addresses, customer names, and billing 
 details.

 *Declaration of Internal Tables: Three internal tables (table1, table2, and table1_copy) are defined based
  on the previously defined data structures. These tables are used to store sets of related data at runtime.

 *Declaration of Variables and Selection Ranges: The code declares several variables for data manipulation,
  such as gti_r_table and gti_r_table2. Additionally, there's a selection section on the screen 
  (SELECTION-SCREEN) allowing users to input usernames for queries.

 *Assignment and Data Manipulation Operations: In the START_OF_SELECTION section, values are assigned to 
 the gca_st1 structure and added to the gti_table1 internal table. Subsequently, read, filtering, and modification operations are performed on the internal tables using loops and READ TABLE clauses.
 
 *Presentation of Messages: The program utilizes message class I002 to display an informative message ('LLavero Gaguito') to the user.
 */

INCLUDE YRPDAM01v.
INCLUDE YRPDAM01p.
INCLUDE YRPDAM01f.

INITIALIZATION.
  PERFORM initialization.


START-OF-SELECTION.
  PERFORM start_of_selection.
