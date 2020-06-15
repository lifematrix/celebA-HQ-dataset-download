FROM continuumio/miniconda3

RUN apt-get update \
    && apt-get install -y -q p7zip-full \
    && rm -rf /var/lib/apt/lists/*

#RUN conda install jpeg=8d tqdm requests pillow==3.1.1 urllib3 numpy cryptography scipy
RUN conda install jpeg tqdm requests pillow urllib3 numpy cryptography scipy

RUN pip install opencv-python==4.2.0.34 cryptography==2.9.2 Queue

COPY . /workspace

WORKDIR /data

CMD ["sh", "/workspace/create_celebA-HQ.sh", "/data"]
