# Marine-DP-Controller

This repository contains the implementation of a dynamic positioning (DP) control system for marine vessels, developed as part of the TMR4240 Marine Control Systems course project. The system is designed to maintain the vessel's position and heading despite environmental disturbances such as currents and wind.

## Project Overview

The project utilizes the Marine Systems Simulator (MSS) Toolbox for MATLAB/Simulink, which provides models and control blocks for real-time simulation of marine vessels. The focus of this project is on the design, tuning, and testing of a Proportional-Integral-Derivative (PID) controller for dynamic positioning.

### Features

- **Process Plant Model**: Simulates vessel dynamics and environmental forces.
- **Control Plant Model**: Implements PID control for position and heading stabilization.
- **Environmental Load Modeling**: Simulates currents and wind impacts on the vessel.
- **Thrust Allocation**: Distributes required forces to individual thrusters.
- **Simulations**: Various scenarios to validate DP performance under different conditions.

## Simulations

1. **Simulation 1**: Vessel stability under steady currents and wind disturbances.
2. **Simulation 2**: Vessel response to changing current directions.
3. **Simulation 3**: Comparison of vessel dynamics with and without a reference model.
4. **Simulation 4**: Dynamic positioning with a 4-corner test for trajectory accuracy.

## Getting Started

### Prerequisites

- MATLAB with Simulink
- Marine Systems Simulator (MSS) Toolbox

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Marine-DP-Controller.git
