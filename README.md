# Trino Query Executor

The trino query executor executes the given query on the trino server in the given interval. You have to provide the following environment variable in order for it to work:

- *TRINO_HOST:* Host of the trino server **with** port
- *CATALOG:* Catalog on which you want to execute the query
- *SCHEMA:* Schema used by the catalog on which you want to execute the query
- *QUERY:* The query itself
- *QUERY_INTERVAL_IN_S:* Interval in seconds in which the query is executed

The queries are executed by using the [trino cli](https://trino.io/docs/current/client/cli.html).