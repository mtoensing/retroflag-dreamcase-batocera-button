# Retroflag Dreamcase Button for Batocera

This project allows you to use the **hardware button** on the [RetroFlag Dreamcase](https://amzn.to/4mLpIpC) (connected to **BCM 2 / physical pin 3**) to always open the **RetroArch Quick Menu** on a Raspberry Pi 5 running **Batocera**.

---

## ✨ Features
- Press the Dreamcase button when the lid is cloded → instantly open RetroArch’s Quick Menu.
- Works in addition to normal controller hotkeys (`Hotkey + B`, `Hotkey + Start`, etc.).
- Lightweight shell script, no external dependencies.
- Debounced input (prevents multiple triggers when the button is held).
- Auto-starts with Batocera via `custom.sh`.

---

## ⚙️ Requirements
- Raspberry Pi 5 with RetroFlag **Dreamcase**.
- Batocera v42 (or later).
- Dreamcase button wired to **BCM 2 (Pin 3)** → **GND**.

---

## 🚀 Installation

This can all be done in the samba share.

1. Enable network_cmd_enable = "true" in /userdata/system/configs/retroarch/retroarchcustom.cfg
    ```bash
   nano /userdata/system/configs/retroarch/retroarchcustom.cfg
3. **Copy the script** custom.sh into your Batocera system:

   ```bash
   nano /userdata/system/custom.sh
4. chmod +x /userdata/system/custom.sh
