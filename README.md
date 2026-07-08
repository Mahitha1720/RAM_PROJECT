# Single Port RAM Verification

A SystemVerilog-based functional verification project for a synchronous **Single Port RAM** using a modular, self-checking constrained-random testbench. The verification environment is designed using reusable verification components and automatically validates the DUT using a golden reference model, scoreboard, functional coverage, and SystemVerilog Assertions (SVA).

## Features

- Modular layered verification architecture
- Constrained-random stimulus generation
- Self-checking scoreboard
- Golden reference model
- Functional coverage collection
- SystemVerilog Assertions (SVA)
- Mailbox-based communication
- Virtual interface implementation
- Automatic pass/fail reporting

## Project Structure

```
.
├── rtl/
│   └── ram.v
│
├── tb/
│   ├── defines.svh
│   ├── ram_if.sv
│   ├── ram_transaction.sv
│   ├── ram_generator.sv
│   ├── ram_driver.sv
│   ├── ram_reference_model.sv
│   ├── ram_monitor.sv
│   ├── ram_scoreboard.sv
│   ├── ram_environment.sv
│   ├── ram_test.sv
│   ├── ram_package.sv
│   ├── ram_assertions.sv
│   └── top.sv
│
└── README.md
```

## Verification Flow

```
Generator → Driver → DUT
                 │
                 ▼
             Monitor
                 │
                 ▼
            Scoreboard
                 ▲
                 │
        Reference Model
```

## Verification Scenarios

- Reset verification
- Write operation
- Read operation
- Random read/write sequences
- Illegal simultaneous read/write operation
- Boundary address testing
- Functional and code coverage analysis

## Components

- **Generator** – Produces constrained-random transactions.
- **Driver** – Drives transactions to the DUT.
- **Monitor** – Captures DUT activity.
- **Reference Model** – Predicts expected RAM behavior.
- **Scoreboard** – Compares expected and actual outputs.
- **Environment** – Connects all verification components.
- **Test** – Configures and executes the verification environment.

## Results

The verification environment successfully validates the Single Port RAM using automated checking, functional coverage, code coverage, and assertion-based verification, ensuring correct operation across supported scenarios.
