#!/bin/bash

# Verifique a arquitetura do sistema
ARCH=$(uname -m)

# Imprima a arquitetura para fins de depuração
echo "A arquitetura do sistema é: "$ARCH""

# Verifique se a arquitetura é amd64 ou arm64
if [ "$ARCH" == "x86_64" ]; then
  SYSTEM_ARCH="amd64"
elif [ "$ARCH" == "aarch64" ]; then
  SYSTEM_ARCH="arm64"
else
  echo "Arquitetura não suportada: "$ARCH""
  exit 1
fi

echo "Arquitetura do sistema: "$SYSTEM_ARCH""

# Crie a URL de download com base na arquitetura usando $"variavel"
CNI_DOWNLOAD_URL="https://github.com/containernetworking/plugins/releases/download/v1.3.0/cni-plugins-linux-"$SYSTEM_ARCH"-v1.3.0.tgz"

# Imprima a URL de download para fins de depuração
echo "URL de download para CNI plugins: "$CNI_DOWNLOAD_URL""

# Faça o download do primeiro arquivo
curl -L -o cni-plugins.tgz "$CNI_DOWNLOAD_URL"

# Verifique se o download foi bem-sucedido
if [ $? -ne 0 ]; then
  echo "Falha ao fazer o download do arquivo CNI plugins"
  exit 1
fi

if [ ! -d "/opt/cni/bin" ]; then
  mkdir -p /opt/cni/bin
fi

# Descompacte o arquivo CNI plugins
tar -xzf cni-plugins.tgz -C /opt/cni/bin/

# Verifique se a descompactação foi bem-sucedida
if [ $? -ne 0 ]; then
  echo "Falha ao descompactar o arquivo CNI plugins"
  exit 1
fi

# Remova o arquivo compactado após a instalação, se desejar
rm cni-plugins.tgz

# Crie a URL de download para o segundo arquivo com base na arquitetura
CONTAINERD_DOWNLOAD_URL="https://github.com/containerd/containerd/releases/download/v1.7.6/containerd-1.7.6-linux-"$SYSTEM_ARCH".tar.gz"

# Imprima a URL de download para fins de depuração
echo "URL de download para containerd: "$CONTAINERD_DOWNLOAD_URL""

# Faça o download do segundo arquivo
curl -L -o containerd.tar.gz "$CONTAINERD_DOWNLOAD_URL"

# Verifique se o download foi bem-sucedido
if [ $? -ne 0 ]; then
  echo "Falha ao fazer o download do arquivo containerd"
  exit 1
fi

# Descompacte o arquivo containerd
tar -xzf containerd.tar.gz -C /usr/local

# Verifique se a descompactação foi bem-sucedida
if [ $? -ne 0 ]; then
  echo "Falha ao descompactar o arquivo containerd"
  exit 1
fi

# Remova o arquivo compactado após a instalação, se desejar
rm containerd.tar.gz

# Atualiza o terminal
source ~/.bashrc