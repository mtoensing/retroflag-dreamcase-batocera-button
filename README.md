# Retroflag Dreamcase Button for Batocera

This project allows you to use the **hardware button** on the RetroFlag Dreamcase (connected to **BCM 2 / physical pin 3**) to always open the **RetroArch Quick Menu** on a Raspberry Pi 5 running **Batocera**.

---

## ✨ Features
- Press the Dreamcase button → instantly open RetroArch’s Quick Menu.
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

1. **Copy the script** into your Batocera system:

   ```bash
   nano /userdata/system/custom.sh
