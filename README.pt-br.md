# TESTES SPIN

[![en](https://img.shields.io/badge/lang-en-red)](README.md) [![pt-br](https://img.shields.io/badge/lang-pt--br-green)](README.pt-br.md)

## CONFIGURAÇÃO

### instale o Spin

Instale o Spin, versão 1.5.1, com o comando:

```bash
curl -fsSL https://developer.fermyon.com/downloads/install.sh | bash -s -- -v v1.5.1 | sudo mv spin /usr/bin
```

### Configuração do Docker

<details>
<summary> Docker desktop engine </summary>

#### Docker Desktop Engine

Para executar os containers utilizando o docker-desktop, siga os passos a seguir.

Cargas de trabalho wasm requerem a ativação do recurso "image store" do containerd.

Para ativar esse recurso, siga as instruções abaixo.  

- Abra as configurações do docker desktop;
- Em "Features in development", selecione a aba com os recursos em beta;
- Ative as seguintes caixas:
  - "Use containerd for storing and pulling images";
  - "Enable WASM".
- Aplique as alterações e reinicie o cliente;
- No dialogo de confirmação, selecione "Install" para que os runtimes WASM sejam instalados.

O Docker desktop irá baixar e instalar os seguintes runtimes, que podem ser utilizados para executar cargas de trabalho WASM:

- io.containerd.slight.v1
- io.containerd.spin.v1
- io.containerd.wasmedge.v1
- io.containerd.wasmtime.v1

</details>

<details>
<summary> Docker Engine 24.0.6</summary>

#### Docker Engine 24.0.6

Para executar os contêineres usando o Docker Engine, siga as etapas abaixo: (os shims wasi-wasm do containerd não eram suportados no momento em que escrevi isso)

Vá para o arquivo /etc/docker/daemon.json e adicione isso dentro do bloco de comando dele:

```bash
  "features": {
    "containerd-snapshotter": true
  }
```

> Você precisa adicionar uma "," ao final da linha antes da linha "features".

Se esse arquivo não existe, então você o cria e cola dentro dele:

```bash
{
  "features": {
    "containerd-snapshotter": true
  }
}
```

Em seguida, reinicie o serviço do Docker executando o comando:  

```bash
sudo systemctl restart docker.service
```

</details>

## EXECUTAR

### Executar servidor spin

Para executar o container spin, use o comando:

```docker container run --name=spin-example -p 3000:80 -v ./volume-log:/log -i --runtime io.containerd.spin.v1 ghcr.io/ferrazarthur/spin_framework_test:latest up --log-dir /log```

Para testar seu funcionamento:  
```curl http://localhost:3000/hello```

Ou também:  
```curl -d "echo this: hello wasm!" http://localhost:3000/echo```
