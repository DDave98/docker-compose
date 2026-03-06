FROM jupyter/minimal-notebook:python-3.11

USER root

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential

USER jovyan

COPY environment.yml /tmp/environment.yml

RUN mamba env update -n base -f /tmp/environment.yml && \
    mamba clean -a -y

WORKDIR /home/jovyan/work
