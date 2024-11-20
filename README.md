# Faculty of Technology (FATEC)

This repository centralizes all activities and projects carried out during the course at the Faculty of Technology. The idea is to create a digital portfolio with all the content developed throughout the course.

## Overview

This repository contains projects and activities from various disciplines, with the aim of demonstrating the practical application of the knowledge acquired. Each folder in the repository refers to a specific project or activity, and all are organized by semester or discipline.

## Features

- **Organization by Semester**: Projects and activities are organized by semester for easy navigation.
- **Practical Demonstration**: Each project contains detailed descriptions about the execution, tools and technologies used.

## Technologies Used

- **Git**: Version control tool used to manage repositories.
- **Visual Basic .NET**: Used in some numerical-based projects.
- **C++/VBA/vb.NET/C/JavaScript/Java**: Used in other programming projects.

## Getting Started

### Prerequisites

- **Git**: Make sure you have Git installed on your machine. If you don't, you can download and install it [here](https://git-scm.com/).

### Cloning the Repository

1. Clone the repository to your machine:
```bash
git clone https://github.com/Allannll/Faculdade-de-Tecnologia-FATEC-.git
```

2. Enter the cloned repository directory:
```bash
cd Faculdade-de-Tecnologia-FATEC-
```

3. To browse the projects for each semester, you can access the specific folders within the repository.

### Using Sparse Checkout

If you want to clone only a specific folder, such as a project for a specific semester, you can use the **sparse-checkout** command to do so. Here's how:

1. Clone the repository without checking it out immediately:
```bash
git clone --no-checkout https://github.com/Allannll/Faculdade-de-Tecnologia-FATEC-.git
```

2. Enter the repository directory:
```bash
cd Faculdade-de-Tecnologia-FATEC-
```

3. Initialize sparse-checkout:
```bash
git sparse-checkout init --cone
```

4. Set the folder to be downloaded, for example, for the first semester:
```bash
git sparse-checkout set "1º Semester"
```

5. Checkout the main branch:
```bash
git checkout main
```

Now you have access only to the "1º Semester" folder, without downloading the entire repository.
