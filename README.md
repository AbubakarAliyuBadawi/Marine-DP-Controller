# Marine Dynamic Positioning System
A comprehensive implementation of a Dynamic Positioning (DP) system for marine vessels, developed as part of the TMR4240 Marine Control Systems course at NTNU. This project demonstrates advanced control system design and implementation using MATLAB/Simulink and the Marine Systems Simulator (MSS) Toolbox.

This repository contains the implementation and simulation of a **Dynamic Positioning (DP)** system developed as part of the TMR4240 Marine Control Systems course. The project leverages MATLAB/Simulink and the **Marine Systems Simulator (MSS)** toolbox to model, design, and test advanced control strategies for marine vessels.

## Overview

The DP system is designed to maintain a vessel's position and heading under various environmental conditions (wind, waves, and current). Key components include:
- **PID Controller**: For precise trajectory tracking and station-keeping.
- **Observers**: Implementation of Extended Kalman Filter (EKF) and Nonlinear Passive Observer (NPO) for state estimation.
- **Thrust Allocation**: Optimization using quadratic programming to distribute forces across multiple thrusters.

## Features

- Simulation of vessel dynamics in 6 degrees of freedom (DOF).
- Environmental load modeling for wind, current, and waves.
- Robust observer design and fault-tolerance testing.
- Comprehensive 4-corner DP tests and capability plots.

## Repository Structure

- `models/`: Simulink models for vessel dynamics, environmental loads, and control systems.
- `scripts/`: MATLAB scripts for observer tuning, thrust allocation, and simulation analysis.
- `results/`: Output plots and performance metrics from simulations.
- `documentation/`: Detailed report and references.
