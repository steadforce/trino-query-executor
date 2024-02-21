#! /bin/sh

set -e

while true
do
    trino --server $TRINO_HOST --catalog $CATALOG --schema $SCHEMA --execute $QUERY
    sleep $QUERY_SLEEP_TIME
done