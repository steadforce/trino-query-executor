#! /bin/sh

set -e

echo "Running trino cli with:
    host: $TRINO_HOST
    catalog: $CATALOG
    schema: $SCHEMA
    query: $QUERY"

while true
do
    echo "Executing query: $QUERY"
    trino --server "$TRINO_HOST" --catalog "$CATALOG" --schema "$SCHEMA" --execute "$QUERY"
    sleep $QUERY_INTERVAL_IN_S
done