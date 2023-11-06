FROM scratch

COPY spin_test/spin.toml /

COPY spin_test/hello/hello.wasm /hello/hello.wasm

COPY spin_test/echo/target/echo.wasm /echo/target/echo.wasm

COPY spin_test/spin.toml /log/spin.toml

ENTRYPOINT ["/spin.toml"]
