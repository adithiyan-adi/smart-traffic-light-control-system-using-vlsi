# 🚦 Smart Traffic Light Controller (Simulation)

## 📌 Overview

This folder contains the **simulation environment** for the Smart Traffic Light Control System using **Verilog HDL**.

It is used to verify:

* FSM behavior
* Timer operation
* Adaptive traffic logic
* Emergency override

---

## 🎯 Simulation Objectives

* Validate FSM state transitions
* Verify timing countdown
* Test emergency preemption
* Analyze system behavior before hardware implementation

---

## 🧠 Simulation Architecture

```id="sim_arch"
Testbench ──► traffic_top ──► FSM + Timer + Density Logic ──► Outputs
```

---

## 📂 Folder Structure

```id="sim_tree"
software/
├── src/
│   ├── traffic_top.v
│   ├── fsm_controller.v
│   ├── timer_counter.v
│   ├── density_analyzer.v
│   ├── clock_enable.v
│   ├── sync_debounce.v
│   └── seven_segment.v
│
├── sim/
│   └── traffic_tb.v
│
├── constraints/
│   └── (optional or unused in simulation)
│
└── README.md
```

---

## 🧪 Testbench Features

* Simulated traffic density inputs
* Emergency signal triggering
* Reset testing
* Continuous operation cycles

---

## ▶️ How to Run Simulation

### 🔹 Using Vivado

1. Add source files
2. Add `traffic_tb.v` in Simulation Sources
3. Run **Behavioral Simulation**

---

### 🔹 Using ModelSim

```id="modelsim_cmd"
vlog *.v
vsim traffic_tb
run -all
```

---

## 📊 Important Signals to Observe

| Signal                          | Description       |
| ------------------------------- | ----------------- |
| state                           | Current FSM state |
| next_state                      | Next state        |
| count                           | Timer value       |
| timeout                         | Timer expiry      |
| load                            | Timer reload      |
| N_light/E_light/S_light/W_light | Traffic outputs   |
| emergency_*                     | Emergency inputs  |

---

## 🔄 Expected Behavior

### Normal Operation

```id="sim_flow"
N_G → N_Y → E_G → E_Y → S_G → S_Y → W_G → W_Y → repeat
```

---

### Emergency Override

```id="sim_emg"
Current → Yellow → Emergency Direction Green
```

---

## ⚠️ Notes

* Simulation uses **faster timing scale**
* Hardware uses **1 Hz real-time clock**
* Display output may not be fully visible in simulation

---

## 📈 Expected Results

* Correct FSM transitions
* Proper timer countdown
* Immediate emergency handling
* Correct LED logic

---

## 🚀 Future Enhancements

* Random traffic generator
* Automated testbench
* Coverage-driven verification
* SystemVerilog upgrade

---
