REPORT YBC430_00_STRUCT_NESTED.

/* * Description:
* This ABAP report demonstrates the usage of a nested structure
* to represent attributes of a person and displays the information
* using the WRITE statement.

* Data Definitions:
*   - wa_Person: Structure of type YPERSON00 representing attributes of a person.

* Structure Definition:
*   - YPERSON00: Structure representing attributes of a person.
*     Fields:
*       - name-firstname: First name of the person.
*       - name-lastname: Last name of the person.
*       - street: Street name of the person's address.
*       - nr: Street number of the person's address.
*       - zip: ZIP code of the person's address.
*       - city: City of the person's address. */

DATA:
      wa_Person TYPE YPERSON00.

START-OF-SELECTION.

/* * Assign values to the fields of the wa_Person structure. */
  wa_Person-name-firstname = 'Harry'.
  wa_Person-name-lastname = 'Potter'.
  wa_Person-street = 'Privet Drive'.
  wa_Person-nr = '3'.
  wa_Person-zip = 'GB-10889'.
  wa_Person-city = 'London'.

/*  Display the information of the person using the WRITE statement. */
  WRITE: / wa_Person-name-firstname,
           wa_Person-name-lastname,
           wa_Person-street,
           wa_Person-nr,
           wa_Person-zip,
           wa_Person-city.
