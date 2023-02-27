import sqlite3
import os

SQLITE_FILE_EXTENSIONS = [
    "db",
    "sdb",
    "sqlite",
    "db3",
    "s3db",
    "sqlite3",
    "sl3",
    "db2",
    "s2db",
    "sqlite2",
    "sl2",
]


def find_and_connect_sqlite_db() -> sqlite3.Connection:
    pass
