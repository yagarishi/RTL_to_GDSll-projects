# 4-Bit Counter: RTL-to-GDSII ASIC Implementation

## Overview

This project demonstrates the complete implementation of a 4-bit synchronous counter using an open-source ASIC design flow. The design was developed in Verilog, verified through simulation, synthesized using Yosys, physically implemented using OpenLane 2/OpenROAD, and verified through DRC and LVS before generating the final GDSII layout.

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Yosys
* OpenLane 2
* OpenROAD
* Magic
* Netgen
* KLayout
* Sky130 PDK

## Design Flow

```text
RTL Design
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

## Results

| Check                   | Status       |
| ----------------------- | ------------ |
| Functional Verification | ✅ Passed     |
| Synthesis               | ✅ Completed  |
| Placement & Routing     | ✅ Completed  |
| Setup Timing            | ✅ Passed     |
| Hold Timing             | ✅ Passed     |
| DRC                     | ✅ Passed     |
| LVS                     | ✅ Passed     |
| Antenna Checks          | ✅ Passed     |
| GDSII Generation        | ✅ Successful |

## Generated Artifacts

* Synthesized Netlist
* DEF
* LEF
* SPEF
* SDF
* SPICE Netlist
* Timing Reports
* DRC Reports
* LVS Reports
* GDSII Layout

## Layout

![Counter Layout](images/counter_layout.png)

## Key Learnings

* RTL Design using Verilog
* Functional Verification and Waveform Analysis
* Logic Synthesis using Yosys
* Physical Design using OpenLane/OpenROAD
* Static Timing Analysis
* DRC and LVS Verification
* GDSII Layout Generation

## Conclusion

Successfully completed a full RTL-to-GDSII ASIC implementation of a 4-bit synchronous counter using the Sky130 PDK, producing a DRC-clean and LVS-clean GDSII layout.
