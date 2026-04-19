# 🚦 VLSI-Based Smart Traffic Light Control System

## 📌 Overview

This repository contains a **complete FPGA-based smart traffic control system** designed using **Verilog HDL**.

The system dynamically controls a **4-way traffic intersection** using:

* Traffic density inputs
* Finite State Machine (FSM)
* Real-time countdown timer
* Emergency vehicle priority override

It is implemented and verified using both:

* 🧠 **Hardware (FPGA – Basys-3 Artix-7)**
* 🧪 **Software Simulation (Vivado / ModelSim)**

---

## 🎯 Project Objectives

* Implement **FSM-based traffic control**
* Enable **adaptive signal timing**
* Support **emergency vehicle preemption**
* Ensure **deterministic real-time operation**
* Validate design using **simulation + hardware**

---

## 🗂 Repository Structure

```id="repo_tree"
smart-traffic-system/
│
├── hardware/
│   ├── src/             # Verilog HDL source files
│   ├── constraints/     # XDC file for Basys-3
│   └── README.md        # Hardware implementation guide
│
├── software/
│   ├── src/             # Core Verilog modules (simulation)
│   ├── constraints/     # Optional sim configs
│   ├── sim/             # Testbench files
│   └── README.md        # Simulation guide
│
└── README.md            # Project overview (this file)
```

---

## ⚙️ System Features

* 🚥 4-way intersection traffic control
* 📊 Adaptive green time based on density
* 🚑 Emergency vehicle priority override
* ⏱ Countdown timer (MM:SS format)
* 🔁 FSM-based deterministic logic
* ⚡ Fully hardware-implemented (no CPU)

---

## 🧠 System Architecture

```id="arch_flow"
Density Inputs ──► Density Analyzer ──► FSM Controller ──► Timer ──► Outputs
                              ▲                             │
                              │                             ▼
                      Emergency Inputs                7-Segment Display
```

---

## 🔄 Working Principle

1. Traffic density is set using switches
2. Green signal duration is calculated dynamically
3. FSM controls signal transitions
4. Timer counts down in real-time
5. Emergency input overrides current flow:

   * Current → Yellow (3 sec)
   * Emergency direction → Green

---

## 🛠 Technologies Used

* **Verilog HDL**
* **Xilinx Vivado**
* **Basys-3 FPGA (Artix-7 XC7A35T)**
* **ModelSim / Vivado Simulator**

---

## ▶️ Getting Started

### 🔹 Hardware Implementation

Go to:

```id="hw_path"
hardware/README.md
```

Steps:

* Open project in Vivado
* Add source files and XDC
* Generate bitstream
* Program FPGA

---

### 🔹 Software Simulation

Go to:

```id="sw_path"
software/README.md
```

Steps:

* Run testbench
* Observe waveform
* Validate FSM and timing

---

## 📊 Key Functional Highlights

| Feature                 | Description                           |
| ----------------------- | ------------------------------------- |
| Adaptive Timing         | Adjusts green signal based on traffic |
| Emergency Override      | Immediate priority switching          |
| FSM Control             | Predictable and deterministic         |
| Real-Time Display       | Countdown shown on 7-segment          |
| Hardware Implementation | Runs on FPGA                          |

---

## 🚀 Future Scope

* Smart city integration (IoT-based signals)
* AI-based traffic prediction
* Multi-intersection coordination
* Vision-based vehicle detection
* ASIC implementation

---

## 📸 Demo / Output (Optional)

You can add:

* FPGA board images
* Simulation waveform screenshots
* Demo video link

---

## 👨‍💻 Author

ADITHIYAN A
Pre-Final Year Design Project - 2
