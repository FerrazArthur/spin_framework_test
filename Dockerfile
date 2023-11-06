FROM scratch

COPY spin-test/spin.toml /

COPY spin-test/hello/hello.wasm /hello/hello.wasm

COPY spin-test/echo/target/echo.wasm /echo/target/echo.wasm

COPY spin-test/spin.toml /log/spin.toml

ENTRYPOINT ["/spin.toml"]
