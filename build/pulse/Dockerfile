FROM alpine
RUN apk add --no-cache pulseaudio
# disable auth
RUN sed -i '/^load-module module-native-protocol-unix/ s/$/ auth-anonymous=1/' /etc/pulse/system.pa
CMD pulseaudio --verbose --exit-idle-time=-1 --system --disallow-exit
