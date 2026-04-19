# 🚦 Smart Traffic Light Controller (Hardware Implementation)

## 📌 Overview

This folder contains the **FPGA hardware implementation** of the Smart Traffic Light Control System using **Verilog HDL**.

The design is deployed on the **Basys-3 FPGA (Artix-7 XC7A35T)** and demonstrates a **real-time adaptive traffic controller** with emergency override.

---

## ⚙️ Features

* 🚥 4-way intersection control (N, E, S, W)
* 📊 Adaptive green timing based on density switches
* 🚑 Emergency vehicle priority override
* ⏱ Real-time countdown display (MM:SS)
* 🔁 FSM-based deterministic operation
* ⚡ Fully hardware-based (no processor)

---

## 🧠 Hardware Architecture

```id="hw_arch"
Density Switches ──► Density Analyzer ──► FSM Controller ──► Timer
                                              │
                                              ▼
                                   Traffic LEDs + 7-Segment Display
```

---

## 🛠 Hardware Requirements

* Basys-3 FPGA Board (Artix-7 XC7A35T)
* USB Cable
* Xilinx Vivado Design Suite

---

## 📂 Folder Structure

```id="hw_tree"
hardware/
├── src/
│   ├── traffic_top.v
│   ├── fsm_controller.v
│   ├── timer_counter.v
│   ├── density_analyzer.v
│   ├── clock_enable.v
│   ├── sync_debounce.v
│   └── seven_segment.v
│
├── constraints/
│   └── traffic_basys3.xdc
│
└── README.md
```

---

## 🎛 Input Mapping

### 🔹 Traffic Density (Switches)

| Switch  | Direction | Meaning |
| ------- | --------- | ------- |
| SW0–SW1 | North     | Density |
| SW2–SW3 | East      | Density |
| SW4–SW5 | South     | Density |
| SW6–SW7 | West      | Density |

Density Levels:

* `00` → Low (10 sec)
* `01` → Medium (20 sec)
* `10` → High (30 sec)

---

### 🔹 Emergency Buttons

| Button | Function        |
| ------ | --------------- |
| BTNU   | Emergency North |
| BTNR   | Emergency East  |
| BTND   | Emergency South |
| BTNL   | Emergency West  |
| BTNC   | Reset           |

---

## 💡 Output Mapping

### 🔹 Traffic LEDs

Each direction uses 3 LEDs:

* Green
* Yellow
* Red

---

### 🔹 7-Segment Display

Format:

```id="hw_disp"
MM:SS
```

| Digit | Meaning        |
| ----- | -------------- |
| D1    | Minutes (tens) |
| D2    | Minutes (ones) |
| D3    | Seconds (tens) |
| D4    | Seconds (ones) |

---

## 🔄 Working

1. System starts in **ALL_RED**
2. FSM cycles through directions
3. Green time depends on density input
4. Timer counts down every second
5. Emergency button triggers:

   * Current → Yellow (3 sec)
   * Emergency direction → Green

---

## ▶️ How to Run (Vivado)

1. Create new project
2. Add all files from `src/`
3. Add `.xdc` from `constraints/`
4. Run:

   * Synthesis
   * Implementation
   * Generate Bitstream
5. Program FPGA

---

## 📊 Key Highlights

* Deterministic timing
* Low hardware resource usage
* Real-time operation
* Modular design

---

## 🚀 Possible Improvements

* Opposite lane simultaneous control (N+S, E+W)
* AI-based adaptive prediction
* IoT-enabled monitoring
* Camera-based density detection

---
