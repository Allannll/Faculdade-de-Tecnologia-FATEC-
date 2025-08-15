# Mario State Machine

This project is a console-based simulation of Mario's state transitions, inspired by the iconic Nintendo game series. It demonstrates how Mario changes between different forms (Small, Super, Fire, Tanooki) depending on the power-ups he collects or the damage he takes.

> **Note:** This is an educational project designed to explore the **State design pattern** in Java, with a simple user interface and game-like behavior.

## Overview

The Mario State Machine project was developed to represent how Mario evolves through his different forms using object-oriented principles. The player can control Mario through a menu, applying power-ups or taking damage, which alters Mario's current state.

This implementation includes:
- Four distinct states for Mario
- A dynamic interface that responds to player input
- A restart mechanism if Mario dies

## Technologies Used

- **Java**: Core language used to implement the object-oriented logic and state transitions.
- **IntelliJ IDEA**: Development environment used to structure and run the application.
- **Git**: Version control for project tracking and collaboration.

## Getting Started

### Prerequisites

Make sure you have the following tools installed:
- [Java JDK](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- [IntelliJ IDEA](https://www.jetbrains.com/idea/)
- [Git](https://git-scm.com/)

### Installation

1. Clone the repository to your machine: 
```bash 
git clone --no-checkout https://github.com/Allannll/Faculdade-de-Tecnologia-FATEC-.git 
```
2. Navigate to the correct folder: 
```bash 
cd Faculty-of-Technology-FATEC- 
```
3. Initialize sparse-checkout: 
```bash 
git sparse-checkout init --cone 
```
4. Set the project directory: 
```bash 
git sparse-checkout set "4-Semester/Object Oriented Programming/Mario State Machine" 
```
5. Checkout the main branch: 
```bash 
git checkout main 
```

Now you can open the project in **IntelliJ IDEA** and run the `Main.java` file.

## How It Works

Upon running the project, you'll interact with a simple text interface where you can:
- Collect power-ups (Mushroom, Fire Flower, Super Leaf)
- Take damage
- View Mario’s current state
- Revive Mario if he dies

This logic mimics the behavior seen in classic Mario games and is powered by the **State design pattern**, where each state is encapsulated in a separate class that defines its own transitions.

---