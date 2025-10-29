FROM alpine
RUN apk add --no-cache pulseaudio

RUN addgroup -g 1000 ledfx \
 && adduser -D -u 1000 -G ledfx -s /bin/sh -h /home/ledfx ledfx \
 && mkdir -p /home/ledfx \
 && chown -R ledfx:ledfx /home/ledfx

USER ledfx

CMD pulseaudio --verbose --exit-idle-time=-1 --system=false --disallow-exit --disallow-module-loading=false --log-target=stderr --disable-shm=yes --load="module-native-protocol-unix auth-anonymous=1 auth-cookie-enabled=0 socket=$HOME/.config/pulse/pulseaudio.socket" --load="module-always-sink"
