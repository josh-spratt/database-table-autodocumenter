
| column_name | data_type | description |
| --- | --- | --- |
| customer_sk | INTEGER PRIMARY KEY | Surrogate key for each row in the dimension. Used to join to fact tables. |
| customer_id | INTEGER | Natural key used to identify unique customers. |
| first_name | TEXT | Customer first name. |
| last_name | TEXT | Customer last name. |
| company | TEXT | Company associated with a customer. |
| address | TEXT | Customer's address. |
| city | TEXT | Customer's city. |
| state | TEXT | Customer's state. |
| country | TEXT | Customer's country. |
| postal_code | TEXT | Customer's postal_code. |
| phone | TEXT | Customer's phone number. |
| fax | TEXT | Customer's fax number. |
| email | TEXT | Customer's email address. |
| support_rep_id | INTEGER | The support representative's id associated with the customer. |
