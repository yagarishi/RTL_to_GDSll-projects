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

## Design Metrics

| Parameter | Value |
|---|---|
| Technology | SKY130 (130 nm open-source PDK) |
| Standard Cells | 36 (4 FF · 9 Combinational · 3 Clock buf · 3 Hold buf) |
| Core Area | 284 µm² |
| Total Power | 97.74 µW |
| Worst Setup Slack | +5.93 ns @ SS 100°C 1.60V corner |
| Target Clock | 10 ns · 100 MHz |

## Results

| Check                   | Status       |
|-------------------------|--------------|
| Functional Verification | ✅ Passed    |
| Synthesis               | ✅ Completed |
| Placement & Routing     | ✅ Completed |
| Setup Timing            | ✅ Passed    |
| Hold Timing             | ✅ Passed    |
| DRC                     | ✅ Passed    |
| LVS                     | ✅ Passed    |
| Antenna Checks          | ✅ Passed    |
| GDSII Generation        | ✅ Successful|

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

## Add 4-bit counter RTL-to-GDSII implementation
- Designed counter in Verilog
- Verified functionality using Icarus Verilog and GTKWave
- Implemented ASIC flow using OpenLane 2 and Sky130
- Generated GDSII layout
- Verified DRC and LVS clean design
- Added RTL schematic, waveform and layout screenshots

## Conclusion
Successfully completed a full RTL-to-GDSII ASIC implementation of a 4-bit synchronous counter using the Sky130 PDK, producing a DRC-clean and LVS-clean GDSII layout.
