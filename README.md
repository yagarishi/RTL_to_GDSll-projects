# RTL-to-GDSII ASIC Design Flow

This repository documents my hands-on learning and implementation of a complete digital ASIC design flow, starting from Register Transfer Level (RTL) design and progressing through verification, synthesis, physical design, and final GDSII generation using open-source EDA tools.

## Objective

The goal of this repository is to develop a practical understanding of modern ASIC design methodologies by implementing digital designs and taking them through a complete RTL-to-GDSII flow.

The repository includes:

* RTL design in Verilog
* Functional verification using testbenches
* Waveform analysis
* Logic synthesis
* Physical design
* Timing analysis
* Design Rule Checking (DRC)
* Layout Versus Schematic (LVS) verification
* GDSII generation

---

## Design Flow

```text
Specification
    ↓
RTL Design (Verilog)
    ↓
Functional Verification
    ↓
Logic Synthesis
    ↓
Floorplanning
    ↓
Placement
    ↓
Clock Tree Synthesis (CTS)
    ↓
Routing
    ↓
Static Timing Analysis (STA)
    ↓
DRC / LVS Verification
    ↓
GDSII Generation
```
## Project Files

1. RTL Design (`counter.v`)
2. Testbench (`counter_tb.v`)
3. RTL Schematic (`rtl_schematic.png`)
4. Simulation Waveform (`waveform.png`)
5. OpenLane Configuration (`config.yaml`)
6. Physical Layout (`counter_layout.png`)
7. Implementation Metrics (`metrics.csv`)
---

## Tools Used

### RTL Design & Verification

* Verilog HDL
* Icarus Verilog
* GTKWave

### Logic Synthesis

* Yosys

### Physical Design

* OpenLane 2
* OpenROAD

### Layout Verification

* Magic
* Netgen

### Layout Visualization

* KLayout

### Platform

* Debian (WSL2)
* Docker Desktop

##

---

## Skills Demonstrated

* Digital Design using Verilog
* Testbench Development
* Functional Verification
* RTL Analysis
* Logic Synthesis
* Physical Design Flow
* Static Timing Analysis
* ASIC Design Methodology
* Linux-based EDA Workflow

---

## Author

This repository is maintained as part of my ASIC Design and VLSI learning journey, focusing on practical implementation using industry-relevant open-source EDA tools.
