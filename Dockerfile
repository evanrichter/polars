# Build Stage
FROM rustlang/rust:nightly as builder

## Install build dependencies.
RUN cargo install -f cargo-fuzz

## Add source code to the build stage.
ADD . /src
WORKDIR /src
RUN cd polars/fuzz && cargo fuzz build

# Package Stage
FROM rustlang/rust:nightly

COPY --from=builder /src/polars/fuzz/target/x86_64-unknown-linux-gnu/release/parse_parquet /
