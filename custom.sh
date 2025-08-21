#!/bin/sh
# custom.sh – Dreamcase button always opens the RetroArch menu
# Marc: BCM 2 (physical pin 3) to GND

PIN=2
RA_PORT=55355
CFG_DIR="/userdata/system/configs/retroarch"
CFG_FILE="$CFG_DIR/retroarchcustom.cfg"
LOCK="/var/lock/dreamcase-btn.lock"

# Prevent double start
[ -e "$LOCK" ] && exit 0
touch "$LOCK"

# Safely enable RetroArch network commands
mkdir -p "$CFG_DIR"
grep -q 'network_cmd_enable' "$CFG_FILE" 2>/dev/null || echo 'network_cmd_enable = "true"' >> "$CFG_FILE"
grep -q 'network_cmd_port'   "$CFG_FILE" 2>/dev/null || echo "network_cmd_port = \"$RA_PORT\"" >> "$CFG_FILE"

# Short log (optional, visible in dmesg)
echo "[dreamcase-btn] Init on BCM $PIN, RA port $RA_PORT" >&2

# Watcher in background
(
  last=1
  pressed_ts=0

  while true; do
    val="$(gpioget gpiochip0 $PIN 2>/dev/null)"
    [ -z "$val" ] && val=1

    # Falling edge = pressed (active-low)
    if [ "$last" = "1" ] && [ "$val" = "0" ]; then
      pressed_ts="$(date +%s)"
      # Immediately toggle RetroArch Quick Menu
      echo "MENU_TOGGLE" | nc -u -w1 127.0.0.1 $RA_PORT >/dev/null 2>&1
      # Debounce: while held, don’t trigger again
      sleep 0.4
    fi

    last="$val"
    sleep 0.05
  done
) &
