# Package Stage
FROM ubuntu:latest

## Add source code to the build stage.
ADD ./polars/fuzz/target/x86_64-unknown-linux-gnu/release/parse_parquet /
