# Board Game

This project presents three exercises implemented in C++ for academic purposes, covering programming logic and manipulation of arrays and matrices.

---

## Exercise Description

### 1. Validation of Attack Positions
Checks if there are attack positions in a 5x5 matrix. It simulates a scenario where pieces can attack others based on their position.

- **Input**: 5x5 matrix representing positions.
- **Output**: Message indicating whether or not there are attack positions.

### 2. Vector Sorting
Sorts a vector of 15 elements using a basic method of sorting by exchanging adjacent values.

- **Input**: Vector of integers.
- **Output**: Sorted vector.

### 3. Conclusion of Experimental Results
Checks the consistency between two sets of experiments represented by a vector of 50 elements, comparing pairs of values.

- **Input**: Vector of 50 elements representing experiments.
- **Output**: Message indicating whether the result is conclusive.

---

## Installation

To copy only the specific project directory, follow the steps below:

1. Clone the repository without doing the full checkout:
```bash
git clone --no-checkout https://github.com/Allannll/Faculdade-de-Tecnologia-FATEC-.git
```
2. Access the cloned repository directory:
```bash
cd Faculdade-de-Tecnologia-FATEC-
```
3. Initialize sparse-checkout:
```bash
git sparse-checkout init --cone
```
4. Set the specific directory to be downloaded:
```bash
git sparse-checkout set "1º Semester/Algorithms and programming logic/Board Game (Project)"
```
5. Checkout the main branch:
```bash
git checkout main
```