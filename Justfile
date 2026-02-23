# Fail fast, good shell defaults
set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

# Default task
default:
    just --list

# PG Dump_all (filename type .gz e.g. fullbackup.sql.gz)
pg_dumpall host port filename:
  pg_dumpall -U postgres -h {{host}} -p {{port}} | gzip > {{filename}}

# PG Restore (filename type .gz)
pg_restore host port filename:
  gunzip -c {{filename}} | psql -U postgres -h {{host}} -p {{port}}
