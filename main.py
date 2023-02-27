import sqlite3
from tabulate import tabulate


def make_markdown_table(line_list: list):
    """Takes a list of lists and converts it to a markdown table"""
    newline = "\n"
    markdown = newline
    markdown += f"| {' | '.join(line_list[0])} |"
    markdown += newline
    markdown += f"| {' | '.join(['---']*len(line_list[0]))} |"
    markdown += newline
    for entry in line_list[1:]:
        markdown += f"| {' | '.join(entry)} |{newline}"
    return markdown


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
    ddl_lines_split = [list(line.strip().partition(" ")) for line in ddl_lines]
    output_lines = []
    for line in ddl_lines_split:
        if "--" in line[2]:
            final_output_obj = dict()
            final_output_obj["column_name"] = line[0]
            final_output_obj["data_type"] = line[2].split(" -- ")[0].replace(",", "")
            final_output_obj["description"] = line[2].split(" -- ")[1]
            output_lines.append(final_output_obj)
        else:
            pass

    markdown_lines = []
    header_row = list(output_lines[0].keys())
    markdown_lines.append(header_row)
    for line in output_lines:
        markdown_lines.append(list(line.values()))

    print(tabulate(markdown_lines, headers="firstrow", tablefmt="github"))

    md_table = make_markdown_table(line_list=markdown_lines)

    with open("output_sample.md", "w") as f:
        f.write(md_table)


if __name__ == "__main__":
    main()
