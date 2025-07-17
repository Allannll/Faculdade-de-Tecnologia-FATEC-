# Encryption Algorithm

This project is a simple encryption and decryption tool written in C. The program reads a text from a file, applies a Caesar cipher for encryption or decryption, and saves the result back to the file.

> **Note:** This project was developed as part of the *Programming Language* discipline in the second semester.

## Overview

The program provides a basic menu interface for encrypting, decrypting, and viewing the contents of a text file. It uses the Caesar cipher technique with a shift of 3, supporting both uppercase and lowercase letters.

## Features

- Encrypt text using Caesar cipher.
- Decrypt text using Caesar cipher.
- View the text content of the file.

## Technologies Used

- **C Programming Language**: The core of the project.
- **File Handling**: Reading from and writing to text files.

## Getting Started

### Prerequisites

- A C compiler (e.g., GCC) installed on your machine.

### Installation

1. Clone the repository to your machine:
    ```bash
    git clone --no-checkout https://github.com/Allannll/Faculdade-de-Tecnologia-FATEC-.git
    ```
2. Change directory into the cloned repository:
    ```bash
    cd Faculdade-de-Tecnologia-FATEC-
    ```
3. Initialize sparse-checkout:
    ```bash
    git sparse-checkout init --cone
    ```
4. Set the directory to check out:
    ```bash
    git sparse-checkout set "2º Semester/Programming language/Encryption algorithm (Project)"
    ```
5. Checkout the main branch:
    ```bash
    git checkout main
    ```