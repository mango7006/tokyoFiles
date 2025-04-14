#!/bin/bash

INTERFACE="wg0"

if ip link show | grep -q "$INTERFACE"; then
  notify-send "🔌 Disconnecting VPN ($INTERFACE)"
  kitty sudo wg-quick down "$INTERFACE"
else
  notify-send "🔒 Connecting VPN ($INTERFACE)"
  kitty sudo wg-quick up "$INTERFACE"
fi
