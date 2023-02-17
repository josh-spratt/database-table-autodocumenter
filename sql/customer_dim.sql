/* customer_dim */
DROP VIEW IF EXISTS customer_dim_sv;

CREATE VIEW customer_dim_sv AS
SELECT
    ROW_NUMBER() OVER () AS customer_sk
  , CustomerId AS customer_id
  , FirstName AS first_name
  , LastName AS last_name
  , Company AS company
  , Address AS address
  , City AS city
  , State AS state
  , Country AS country
  , PostalCode AS postal_code
  , Phone AS phone
  , Fax AS fax
  , Email AS email
  , SupportRepId AS support_rep_id
FROM customers;

DROP TABLE IF EXISTS customer_dim;

CREATE TABLE customer_dim (
    customer_sk INTEGER PRIMARY KEY, -- Surrogate key for each row in the dimension. Used to join to fact tables.
    customer_id INTEGER, -- Natural key used to identify unique customers.
    first_name TEXT, -- Customer first name.
    last_name TEXT, -- Customer last name.
    company TEXT, -- Company associated with a customer.
    address TEXT, -- Customer's address.
    city TEXT, -- Customer's city.
    state TEXT, -- Customer's state.
    country TEXT, -- Customer's country.
    postal_code TEXT, -- Customer's postal_code.
    phone TEXT, -- Customer's phone number.
    fax TEXT, -- Customer's fax number.
    email TEXT, -- Customer's email address.
    support_rep_id INTEGER -- The support representative's id associated with the customer.
);

INSERT INTO customer_dim SELECT * FROM customer_dim_sv;
