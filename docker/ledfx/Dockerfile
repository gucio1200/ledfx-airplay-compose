FROM python:3.12-bookworm AS build

# cmake needed to build aubio
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cmake \
        gcc \
        portaudio19-dev \
        libportaudio2 \
        pulseaudio \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN python -m venv venv \
 && venv/bin/pip install numpy ledfx

# aubio doesn't properly express its dependency on numpy? pre-install it as a workaround.

FROM python:3.12-slim AS run

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cmake \
        libportaudio2 \
        pulseaudio \
    && rm -rf /var/lib/apt/lists/*

ENV HOME="/home/ledfx"
ENV PATH="/app/venv/bin:$PATH"

RUN groupadd --gid 1000 ledfx \
  && useradd --uid 1000 --gid 1000 --create-home --home-dir "$HOME" ledfx \
  && usermod -aG audio,pulse,pulse-access ledfx \
  && chown -R ledfx:ledfx "$HOME"

WORKDIR "$HOME"

COPY --from=build --chown=1000:1000 /app/venv /app/venv

USER ledfx

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
