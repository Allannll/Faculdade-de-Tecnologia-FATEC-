# Linear-Programming-TSP-Delays

This repository contains an academic project developed for the Linear Programming course, focusing on modeling and solving variants of the Traveling Salesman Problem (TSP) with delay penalties. The project explores two formulations: minimizing total delay and minimizing maximum delay. All implementations were developed in Python using the Gurobi optimization solver.

## Overview

The project investigates realistic routing scenarios where visiting nodes (clients) later than a predefined deadline incurs penalties. Two optimization models were implemented:

- **Problem A – Minimize Total Delay:**  
  Reduces the sum of all individual delays.

- **Problem B – Minimize Maximum Delay (Minimax):**  
  Minimizes the worst individual delay across all clients.

Both models incorporate travel times, service times, and explicit deadlines, forming a time-dependent version of the classic TSP.

## Technologies Used

- Python
- Gurobi Optimizer
- Google Colab
- Math and time libraries

## Getting Started

### Requirements

- Python 3.8+
- Gurobi Optimizer installed and licensed
- Python packages:
  ```bash
  pip install gurobipy
  ```

### Running the Code

Inside Google Colab:

```python
!pip install gurobipy
from google.colab import drive
drive.mount('/content/drive')
```

Then run the models:

```python
resolver_A(coords, service, deadline)
resolver_B(coords, service, deadline)
```

## Project Structure

Two main mathematical models are implemented.

### Model A — `resolver_A()`  
Minimizes the total delay.

Includes:
- Euclidean distance matrix computation
- Degree constraints for a Hamiltonian cycle
- Big-M time propagation
- Delay variables
- Objective: minimize sum of delays

Outputs:
- Route
- Arrival times
- Individual delays
- Objective value
- Execution time
- MIP Gap

### Model B — `resolver_B()`  
Minimizes the maximum delay.

Adds:
- Variable `Tmax` such that `Tmax >= L[i]` for all i
- Objective: minimize `Tmax`

Outputs:
- Route
- Arrival times
- Individual delays
- Maximum delay
- Sum of delays
- Execution time
- MIP Gap

## Mathematical Documentation

The documentation includes:

- Definitions of sets and parameters  
- Decision variables  
- Degree constraints  
- Time propagation constraints  
- Delay formulation  
- Minimax extension  
- Objective functions  
- Computational analysis and comparison of both models  

## Authors

- Allan dos Santos  
- Gustavo Santana  
- Maycon Silva  
- Guilherme Sestari  
- Caio Lima  
- Mariana Rodrigues  

## Final Notes

This project extends the classical TSP by including deadlines and delay penalties, producing realistic and time-sensitive routing solutions. Both models can be expanded to incorporate time windows, capacity constraints, or subtour elimination cuts.