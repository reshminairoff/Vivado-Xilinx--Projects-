# 3-Bit Multiplier by 2 — Combinational Logic using Case Statement

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Tool](https://img.shields.io/badge/Tool-Xilinx%20Vivado-orange)
![Simulation](https://img.shields.io/badge/Simulation-Behavioral-green)
![Type](https://img.shields.io/badge/Type-Combinational%20Logic-purple)

---

## 📌 Overview

This project implements a **3-bit combinational multiplier** that computes `P = D × 2` for all possible input combinations using a **Verilog `case` statement**. It is part of a series of HDL design exercises aimed at building a strong foundation in digital logic and RTL design.

---

## 🧠 Problem Statement

Design a digital system with:
- **Input:** 3-bit value `D[2:0]` (D2, D1, D0)
- **Output:** 4-bit value `P[3:0]` (P3, P2, P1, P0)
- **Operation:** `P = D × 2` for all 8 input combinations
- **Implementation:** Using Verilog `case` statement

---

## 📊 Truth Table

| D2 | D1 | D0 | D (dec) | P3 | P2 | P1 | P0 | P (dec) |
|----|----|----|---------|----|----|----|----|---------|
|  0 |  0 |  0 |    0    |  0 |  0 |  0 |  0 |    0    |
|  0 |  0 |  1 |    1    |  0 |  0 |  1 |  0 |    2    |
|  0 |  1 |  0 |    2    |  0 |  1 |  0 |  0 |    4    |
|  0 |  1 |  1 |    3    |  0 |  1 |  1 |  0 |    6    |
|  1 |  0 |  0 |    4    |  1 |  0 |  0 |  0 |    8    |
|  1 |  0 |  1 |    5    |  1 |  0 |  1 |  0 |   10    |
|  1 |  1 |  0 |    6    |  1 |  1 |  0 |  0 |   12    |
|  1 |  1 |  1 |    7    |  1 |  1 |  1 |  0 |   14    |

> **Key Observation:** Multiplying by 2 is equivalent to a **1-bit left shift**. Hence P0 is always 0, and P[3:1] = D[2:0].

---

## 📁 File Structure

```
multiplier_by2/
├── multiplier.v          # Design module (case statement implementation)
├── multiplier_tb.v       # Testbench (clock-based, 800ns simulation)
└── README.md             # Project documentation
```
---

## ⏱️ Testbench Clock Strategy

The three inputs are driven as clocks with different periods so they automatically step through all 8 input combinations within 800ns:

```
Time (ns):  0   100  200  300  400  500  600  700
D0:         0    1    0    1    0    1    0    1     ← period 100ns
D1:         0    0    1    1    0    0    1    1     ← period 200ns
D2:         0    0    0    0    1    1    1    1     ← period 400ns
─────────────────────────────────────────────────
D (bin):   000  001  010  011  100  101  110  111
P (bin):  0000 0010 0100 0110 1000 1010 1100 1110
P (dec):    0    2    4    6    8   10   12   14
```

---

## 🖥️ Simulation Steps (Xilinx Vivado)

1. Create a new **RTL Project** in Vivado
2. Add `multiplier.v` as a **Design Source**
3. Add `multiplier_tb.v` as a **Simulation Source**
4. Set `multiplier_tb` as the **top simulation module**
5. Click **Run Behavioral Simulation**
6. Set simulation time to **800ns** and click Run ▶️
7. Add `D[2:0]` and `P[3:0]` as buses in the waveform window

---

## 📐 Concepts Demonstrated

| Concept | Description |
|---|---|
| `case` statement | Explicit mapping of all input combinations to outputs |
| `always @(*)` | Combinational logic — triggers on any input change |
| `output reg` | Required when output is assigned inside an `always` block |
| `default` | Safety net to prevent inferred latches |
| Left shift property | Multiplying by 2 = shift left by 1 (P0 always 0) |
| Clock-based testbench | Auto-cycles through all input values without manual `#delays` |


*Part of the Verilog HDL Portfolio — Combinational Logic Series*  
*Simulated using Xilinx Vivado | github.com/reshminairoff*
