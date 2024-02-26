FROM python:3.12-bookworm

# cmake needed to build aubio
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cmake \
        libportaudio2 \
        pulseaudio \
    && rm -rf /var/lib/apt/lists/*

# aubio doesn't properly express its dependency on numpy? pre-install it as a workaround.
RUN pip install numpy
RUN pip install ledfx

CMD ledfx
