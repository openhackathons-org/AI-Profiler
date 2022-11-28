FROM nvcr.io/nvidia/pytorch:22.04-py3

RUN apt-get -y update
RUN pip3 install jupyterlab
RUN pip3 install ipywidgets
RUN pip3 install torch_tb_profiler

#####
# Read https://forums.developer.nvidia.com/t/notice-cuda-linux-repository-key-rotation/212772
RUN apt-get update -y && \
     DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         apt-transport-https \
         ca-certificates \
         gnupg \
         wget && \
     rm -rf /var/lib/apt/lists/*
RUN wget -qO - https://developer.download.nvidia.com/devtools/repos/ubuntu2004/amd64/nvidia.pub | apt-key add - && \
     echo "deb https://developer.download.nvidia.com/devtools/repos/ubuntu2004/amd64/ /" >> /etc/apt/sources.list.d/nsight.list && \
     apt-get update -y && \
     DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
         nsight-systems-2022.1.1 && \
     rm -rf /var/lib/apt/lists/*


#################################################
ENV LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib/python3.8/dist-packages:/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
ENV PATH="/opt/nvidia/nsight-systems/2022.2.1/bin:/usr/local/bin:/bin:/usr/local/cuda/bin:/usr/bin${PATH:+:${PATH}}"

# TO COPY the data
#COPY workspace/ /workspace


#CMD jupyter-lab --no-browser --allow-root --ip=0.0.0.0 --port=8888 --NotebookApp.token="" --notebook-dir=/workspace
