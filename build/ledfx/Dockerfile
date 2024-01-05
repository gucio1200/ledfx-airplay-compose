# 2024-01-05: python 3.12 has issues with python aiohttp & mbedtls
FROM python:3.11-bookworm

RUN apt-get update && \
    apt-get install -y --no-install-recommends\
        libportaudio2 \
        pulseaudio \
    && rm -rf /var/lib/apt/lists/*

# aubio doesn't properly express its dependency on numpy? pre-install it as a workaround.
RUN pip install numpy
RUN pip install ledfx

CMD ledfx
