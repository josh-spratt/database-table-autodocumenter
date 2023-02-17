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
    customer_sk INTEGER,
    invoice_id INTEGER,
    invoice_date DATETIME,
    billing_address TEXT,
    billing_city TEXT,
    billing_state TEXT,
    billing_country TEXT,
    billing_postal_code TEXT,
    total NUMERIC(10,2),
    FOREIGN KEY (customer_sk) REFERENCES customer_dim (customer_sk)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO invoice_fact SELECT * FROM invoice_fact_sv;
