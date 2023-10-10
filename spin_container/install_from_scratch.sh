#!/bin/bash

echo "Instalando spin:"

./install_spin.sh

return_code=$?

if [ "$return_code" -ne 0 ]; then
  echo "Falha ao instalar o spin"
  exit 1
elif [ "$return_code" -eq 0 ]; then
  echo "Spin instalado com sucesso!"
  ./spin --version
fi

echo "Instalando containerd:"

./install_containerd.sh

return_code=$?

if [ "$return_code" -ne 0 ]; then
  echo "Falha ao instalar o containerd"
  exit 1
elif [ "$return_code" -eq 0 ]; then
  echo "containerd instalado com sucesso!"
fi

echo "Instalando shims:"

./install_shims.sh

return_code=$?

if [ "$return_code" -ne 0 ]; then
  echo "Falha ao instalar o shims"
  exit 1
elif [ "$return_code" -eq 0 ]; then
  echo "shims instaladas com sucesso!"
fi

