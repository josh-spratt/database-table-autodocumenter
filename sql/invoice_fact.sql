/* invoice_fact */
DROP VIEW IF EXISTS invoice_fact_sv;

CREATE VIEW invoice_fact_sv AS
SELECT
    customer_dim_sv.customer_sk
  , InvoiceId AS invoice_id
  , InvoiceDate AS invoice_date
  , BillingAddress AS billing_address
  , BillingCity AS billing_city
  , BillingState AS billing_state
  , BillingCountry AS billing_country
  , BillingPostalCode AS billing_postal_code
  , Total AS total
FROM invoices
JOIN customer_dim_sv
  ON invoices.CustomerId = customer_dim_sv.customer_id;

DROP TABLE IF EXISTS invoice_fact;

CREATE TABLE invoice_fact (
    customer_sk INTEGER, -- Surrogate key for the fact's customer. References `customer_dim`.
    invoice_id INTEGER, -- Unique identifier for an invoice.
    invoice_date DATETIME, -- The date of the invoice.
    billing_address TEXT, -- The billing address associated with an invoice.
    billing_city TEXT, -- The billing city associated with an invoice.
    billing_state TEXT, -- The billing state associated with an invoice.
    billing_country TEXT, -- The billing country associated with an invoice.
    billing_postal_code TEXT, -- The billing postal code associated with an invoice.
    total NUMERIC(10,2), -- The total amount billed on the invoice.
    FOREIGN KEY (customer_sk) REFERENCES customer_dim (customer_sk)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO invoice_fact SELECT * FROM invoice_fact_sv;
