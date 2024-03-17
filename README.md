# ARM Multicycle Processor

Below are provided the details of the ARM multicycle processor that was implemented as a project for the Computer Architecture course at the University of Athens.

Specifically, the information is depicted pictorially and covers the instruction fields of the implemented instructions, the datapath, the control unit, and a recommendation for an additional instruction that could be implemented.

## Instruction Implemented

### Data Processing

- `ADD(S)-I`: ![adds_i](./README/adds_i.png "adds_i")
- `ADD(S)-R`: ![adds_r](./README/adds_r.png "adds_r")
- `SUB(S)-I`: ![subs_i](./README/subs_i.png "subs_i")
- `SUB(S)-R`: ![subs_r](./README/subs_r.png "subs_r")
- `CMP-I`: ![cmp_i](./README/cmp_i.png "cmp_i")
- `CMP-R`: ![cmp_r](./README/cmp_r.png "cmp_r")
- `AND(S)-I`: ![ands_i](./README/ands_i.png "ands_i")
- `AND(S)-R`: ![ands_r](./README/ands_r.png "ands_r")
- `XOR(S)-I`: ![xors_i](./README/xors_i.png "xors_i")
- `XOR(S)-R`: ![xors_r](./README/xors_r.png "xors_r")
- `MOV-I`: ![mov_i](./README/mov_i.png "mov_i")
- `MOV-R`: ![mov_r](./README/mov_r.png "mov_r")
- `LSL`: ![lsl](./README/lsl.png "lsl")
- `ASR`: ![asr](./README/asr.png "asr")
- `MVN-I`: ![mvn_i](./README/mvn_i.png "mvn_i")
- `MVN-R`: ![mvn_r](./README/mvn_r.png "mvn_r")

### Memory Access

- `LDR-I`: ![ldr](./README/ldr.png "ldr")
- `STR-I`: ![str](./README/str.png "str")

### Branch

- `B`: ![b](./README/b.png "b")
- `BL`: ![bl](./README/bl.png "bl")

## Datapath

The control signals that come from the control unit are drawn in cyan color.

![datapath](./README/datapath.png "datapath")

## Control Unit

### Structure

![control_unit](./README/control_unit.png "control_unit")

### Instruction Decoder

![instruction_decoder](./README/instruction_decoder.png "instruction_decoder")

### FSM Schematic

![fsm-schematic](./README/fsm-schematic.png "fsm-schematic")

### Conditional Decoding

![conditional_logic](./README/conditional_logic.png "conditional_logic")

## Recommendation (Not Implemented)

### Instruction Fields

![ror](./README/ror.png "ror")

### Datapath of the `ROR` Command

Paths thar are activated by the `ROR` command are drawn in red color.

![datapath_ror](./README/datapath_ror.png "datapath_ror")
