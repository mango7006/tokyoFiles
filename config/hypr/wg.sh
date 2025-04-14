#!/bin/bash

PASSWORD=$(zenity --password --title="Wireguard Toggle")
INTERFACE="wg0"

if ip link show | grep -q "$INTERFACE"; then
  notify-send "🔌 Disconnecting VPN ($INTERFACE)"
  echo $PASSWORD | sudo -S wg-quick down "$INTERFACE"
else
  notify-send "🔒 Connecting VPN ($INTERFACE)"
  echo $PASSWORD | sudo -S wg-quick up "$INTERFACE"
fi
