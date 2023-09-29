# wasm-tests

## Configuration

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