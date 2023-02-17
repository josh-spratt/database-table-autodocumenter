import sqlite3
import json


def main():
    conn = sqlite3.connect(database="chinook.db")
    conn.row_factory = sqlite3.Row
    get_table_ddl_sql = """
    SELECT
        *
    FROM sqlite_schema
    WHERE "name" = 'customer_dim';"""

    cur = conn.cursor()
    result_set = cur.execute(get_table_ddl_sql)
    fetched_set = result_set.fetchall()
    ddl_string = fetched_set[0]["sql"]
    ddl_lines = ddl_string.split("\n")
    for line in ddl_lines:
        print(line)


if __name__ == "__main__":
    main()
