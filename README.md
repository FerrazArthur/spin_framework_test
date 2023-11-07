# spin-tests

## Configuration

### Install spin

You can install spin version 1.5.1 with the command:

```bash
curl -fsSL https://developer.fermyon.com/downloads/install.sh | bash -s -- -v v1.5.1 | sudo mv spin /usr/bin
```

### Docker configuration

<details>
<summary> Docker desktop engine </summary>

#### Docker Desktop Engine

The easiest way to run the images is to use docker-desktop.

Wasm workloads require the containerd image store feature to be turned on. If you’re not already using the containerd image store, then pre-existing images and containers will be inaccessible.

- Open the Docker Desktop Settings.  
- Go to Features in development and then select the Beta features tab.
- Check the following checkboxes:  
    - Use containerd for storing and pulling images
    - Enable Wasm
- Select Apply & restart to save the settings.
- In the confirmation dialog, select Install to install the Wasm runtimes.

Docker Desktop downloads and installs the following runtimes that you can use to run Wasm workloads:

- io.containerd.slight.v1
- io.containerd.spin.v1
- io.containerd.wasmedge.v1
- io.containerd.wasmtime.v1

</details>

<details>
<summary> Docker Engine 24.0.6</summary>

#### Docker Engine 24.0.6

Go to file /etc/docker/daemon.json and add this inside it's command block:

```bash
  "features": {
    "containerd-snapshotter": true
  }
```

> You need to add a "," in the end of the line before "features": line.

If that file doest exists, then you create it and paste inside:

```bash
{
  "features": {
    "containerd-snapshotter": true
  }
}
```

Then you want to restart docker.service.

</details>

## Run

### Run spin server

To run a spin container, use the following command

```docker container run --name=spin-example -p 3000:80 -v ./volume-log:/log -i --runtime io.containerd.spin.v1 registry.quant1.com.br/arthur/spin-tests:main-test up --log-dir /log```

In order to test it:  
```curl http://localhost:3000/hello```

And also:  
```curl -d "echo this: hello wasm!" http://localhost:3000/echo```
