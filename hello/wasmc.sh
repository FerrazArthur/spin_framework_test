#!/bin/bash

CCC="/home/graphicslesstower/Documentos/wasi-sdk-20.0/bin/clang"
CCCPP="/home/graphicslesstower/Documentos/wasi-sdk-20.0/bin/clang++"
ARG="--sysroot=/home/graphicslesstower/Documentos/wasi-sdk-20.0/share/wasi-sysroot"

if [ "$1" = "--cpp" ]; then
        "$CCCPP" "$ARG" "$2" "$3" "$4"
else
        "$CCC" "$ARG" "$1" "$2" "$3"
fi
