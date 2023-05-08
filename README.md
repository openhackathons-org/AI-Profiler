# Optimizing a Deep Neural Network (DNN) training program

This folder contains contents for AI training program profiling.

- NVIDIA Nsight Systems
- PyTorch Profiler with TensorBoard Plugin
- TensorBoard Visualization
- Optimization Techniques

## Prerequisites
To run this tutorial you will need a machine with NVIDIA GPU.

- Install the latest [Docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker) or [Singularity](https://sylabs.io/docs/).
- To be able to see the profiler output, please download NVIDIA Nsight Systems' latest version from [here](https://developer.nvidia.com/nsight-systems).
- Linux ubuntu OS


## Running on containers
To start with, you will have to build a Docker or Singularity container.

### Docker Container
To build a docker container, run:
`sudo docker build --network=host -t <imagename>:<tagnumber> .`

For instance:
`sudo docker build -t pytorch:1.0 .`

The code labs have been written using Jupyter notebooks and a Dockerfile has been built to simplify deployment. In order to serve the docker instance for a student, it is necessary to expose port 8888 from the container, for instance, the following command would expose port 8888 inside the container as port 8888 on the lab machine:

`sudo docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 -it --rm --network=host -v ~/ai_profiler/workspace:/workspace pytorch:1.0 jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token="" --notebook-dir=/workspace`

The `--gpus` flag is used to enable `all` NVIDIA GPUs during container runtime. The `--rm` flag is used to clean an temporary images created during the running of the container. The `-it` flag enables killing the jupyter server with ctrl-c. 

The `--ipc=host --ulimit memlock=-1 --ulimit stack=67108864` enable sufficient memory allocation to run pytorch within the docker environment.

The `jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token="" --notebook-dir=/workspace` command launch the jupyter notebook inside the container. The flag `-v` allows the mapping of working directory on your local machine `~/ai_profiler/profiler/workspace:/workspace` to `worspace` directory inside the container.

Then, open the jupyter notebook in browser: http://localhost:8888
Start working on the lab by clicking on the `start_here.ipynb` notebook.

### Singularity Container

To build the singularity container, run:
`sudo singularity build --fakeroot <image_name>.simg Singularity`

Fore example:
`singularity build --fakeroot pytorch.simg Singularity`

Then, run the container:
`singularity run --nv --bind ~/ai_profiler/workspace:/workspace pytorch.simg jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token="" --notebook-dir=/workspace`

The `--nv` flag is used to enable `all` NVIDIA GPUs during container runtime. The `--bind` allows the mapping of working directory on your local machine `~/ai_profiler/profiler/workspace:/workspace` to `worspace` directory inside the container. 

Then, open the jupyter notebook in browser: http://localhost:8888
Start working on the lab by clicking on the `Start_Here.ipynb` notebook.


## Running on Local Machine

- Install PyTorch [here](https://pytorch.org/get-started/locally/)
- Install essentials: 
```
    pip3 install jupyterlab
    pip3 install ipywidgets
    pip3 install torch_tb_profiler
``` 
- Install NVIDIA Nsight Systems version 2022.1.1 from [here](https://developer.nvidia.com/nsight-systems) and set path. Please run `nsys --version` from the terminal to ensure you are using the version 2022.1.1 or above

 

# Tutorial Duration

The total bootcamp material would take 2 hours.
