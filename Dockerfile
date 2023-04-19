# Adapted from the official Google Distroless documentation
# https://github.com/GoogleContainerTools/distroless/blob/main/examples/rust/Dockerfile

FROM rust:1.68 AS build
WORKDIR /build
COPY . .
RUN cargo build --release

FROM gcr.io/distroless/cc
COPY --from=build /build/target/release/rust-webserver-example /
CMD ["/rust-webserver-example"]
