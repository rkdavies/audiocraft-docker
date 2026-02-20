FROM pytorch/pytorch:2.4.0-cuda12.4-cudnn9-runtime

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y git build-essential && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/facebookresearch/audiocraft.git .

RUN rm -f /opt/conda/conda-meta/pinned && conda update -n base -c defaults conda -y && conda install -y -c conda-forge ffmpeg "av==11.0.0"

RUN pip install --no-cache-dir torch==2.4.0 torchvision torchaudio gradio==3.45.0 xformers 

RUN pip install -e .

RUN pip install --no-cache-dir torch==2.4.0 torchvision torchaudio gradio==3.45.0 xformers 

EXPOSE 7860

CMD ["python", "demos/musicgen_app.py", "--listen", "0.0.0.0", "--server_port", "7860"]
