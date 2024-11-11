# Marine Dynamic Positioning System
A comprehensive implementation of a Dynamic Positioning (DP) system for marine vessels, developed as part of the TMR4240 Marine Control Systems course at NTNU. This project demonstrates advanced control system design and implementation using MATLAB/Simulink and the Marine Systems Simulator (MSS) Toolbox.

## Project Overview
The system enables precise vessel position and heading control under various environmental conditions through a sophisticated combination of observers, controllers, and thrust allocation algorithms. The implementation includes real-time simulation capabilities and comprehensive environmental force modeling.

### Core Components

#### 1. Observer Design
- **Extended Kalman Filter (EKF)**
  - State estimation and noise reduction
  - Nonlinear system handling through linearization
  - Adaptive gain computation
  
- **Nonlinear Passive Observer (NPO)**
  - Global convergence guarantees
  - Enhanced wave filtering capabilities
  - Improved robustness in extreme conditions

#### 2. Control System
- **PID Controller Implementation**
  - Position and heading control
  - Reference model integration
  - Smooth trajectory generation
  
- **Thrust Allocation**
  - Quadratic programming optimization
  - Handling of actuator constraints
  - Fault tolerance for thruster failures

#### 3. Environmental Modeling
- **Wave Model**: ITTC spectrum implementation
- **Wind Model**: Direction-dependent force computation
- **Current Model**: Surface current simulation

## System Features
- Real-time position and heading tracking
- Wave filtering and state estimation
- Environmental force compensation
- Thruster failure handling
- Reference trajectory generation
- Performance monitoring and validation

## Simulation Scenarios

### Part 1: Basic Functionality
1. Environmental force response (current/wind)
2. Dynamic current adaptation
3. Reference model impact analysis
4. 4-corner positioning test

### Part 2: Advanced Testing
1. Environmental load analysis
2. Thrust allocation verification
3. Observer performance comparison
4. Capability plot generation
5. Observer robustness testing
6. System functionality validation

## Performance Highlights
- Position maintenance within ±3 meters under normal conditions
- Heading control accuracy within ±0.2 radians
- Robust performance under severe wave conditions (H_s = 8m)
- Successful fault tolerance with multiple thruster failures

## Implementation Requirements
### Prerequisites
- MATLAB R2021a or newer
- Simulink
- Marine Systems Simulator (MSS) Toolbox
- Optimization Toolbox

### Setup Instructions
1. Clone the repository:
```bash
git clone https://github.com/yourusername/Marine-DP-System.git
