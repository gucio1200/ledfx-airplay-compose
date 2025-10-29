#!/bin/bash
set -e

echo "Waiting for PulseAudio..."
for i in {1..300}; do
    pactl info > /dev/null 2>&1 && break
    echo "PulseAudio not ready, retrying..."
    sleep 1
done

echo "Waiting for Shairport-Sync client..."
while ! pactl list clients short | grep -q "shairport-sync"; do
    echo "Shairport-Sync client not connected yet..."
    sleep 1
done

echo "Shairport-Sync client detected, starting LEDFX..."
exec ledfx
