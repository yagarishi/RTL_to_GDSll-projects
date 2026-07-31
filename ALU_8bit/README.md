# 8-Bit ALU: RTL-to-GDSII ASIC Implementation

## Overview
This project demonstrates the complete implementation of an 8-bit Arithmetic Logic Unit (ALU) using an open-source ASIC design flow. The design was developed in Verilog, functionally verified through simulation, synthesized using Yosys, physically implemented using OpenLane 2/OpenROAD, and verified through DRC and LVS before generating the final GDSII layout.

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

## ALU Operations

The ALU supports multiple arithmetic and logical operations including:

- Addition
- Subtraction
- Increment
- Decrement
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Bitwise NOT
- Logical Left Shift
- Logical Right Shift
- Rotate Left
- Rotate Right
- Compare
- Pass A
- Pass B
- Clear Output

## Design Metrics

| Parameter | Value |
|---|---|
| Technology | SKY130 (130 nm open-source PDK) |
| Standard Cells | 450 |
| Core Area | 6386.12 µm² |
| Die Area | 9458.03 µm² |
| Standard Cell Area | 3484.59 µm² |
| Core Utilization | 54.57% |
| Total Power | 531.33 µW |
| Worst Setup Slack | +1.00 ns (Worst Corner) |
| Target Clock | 10 ns (100 MHz) |

## Results

| Check | Status |
|-------------------------|--------------|
| Functional Verification | ✅ Passed |
| Synthesis | ✅ Completed |
| Placement & Routing | ✅ Completed |
| Setup Timing | ✅ Passed |
| Hold Timing | ✅ Passed |
| DRC | ✅ Passed |
| LVS | ✅ Passed |
| Antenna Checks | ✅ Passed |
| GDSII Generation | ✅ Successful |

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

## Project Highlights

- Designed an 8-bit ALU in Verilog HDL.
- Verified functionality using Icarus Verilog and GTKWave.
- Generated RTL schematic using Yosys.
- Implemented complete RTL-to-GDSII ASIC flow using OpenLane 2 and Sky130.
- Successfully completed synthesis, floorplanning, placement, CTS, routing and timing analysis.
- Generated final GDSII layout.
- Verified DRC-clean, LVS-clean and Antenna-clean implementation.
- Added RTL schematic, simulation waveform and final layout images.

## Project Images

### RTL Schematic

![RTL Schematic](rtl_schematic.png)

### Functional Simulation

![Waveform](rtl_waveform.png)

### Final GDSII Layout

![Layout](alu_layout.png)

## Conclusion

Successfully completed the full RTL-to-GDSII ASIC implementation of an 8-bit Arithmetic Logic Unit (ALU) using the Sky130 PDK and OpenLane 2. The design achieved successful timing closure with zero setup and hold violations, passed DRC, LVS and antenna verification, and produced a manufacturable GDSII layout suitable for ASIC implementation.
