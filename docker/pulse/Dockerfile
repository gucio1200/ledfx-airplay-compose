FROM alpine
RUN apk add --no-cache pulseaudio
# disable auth
RUN sed -i '/^load-module module-native-protocol-unix/ s/$/ auth-anonymous=1/' /etc/pulse/system.pa

RUN addgroup -g 1000 ledfx \
 && adduser -D -u 1000 -G ledfx -s /bin/sh -h /home/ledfx ledfx \
 && mkdir -p /home/ledfx \
 && chown -R ledfx:ledfx /home/ledfx

RUN mkdir -p /home/ledfx/.config/pulse
COPY /etc/pulse/system.pa /home/ledfx/.config/pulse/default.pa
USER ledfx

CMD pulseaudio --verbose --exit-idle-time=-1 --system=false --disallow-exit --disallow-module-loading=false
