<h1 align="center"># --- Operating-System-Lab-CSE_310 ---</h1>
<h3 align="center"># --- Spring 2024 ---</h3>
<br />

Welcome to the Operating System Lab repository. This repository contains code, documentation, and resources for various operating system lab exercises, Lab course and projects.

![OS Lab](oslabbanner.png)

## Table of Contents

- [Introduction](#introduction)
- [Class Experiments](#class-experiments)
- [Installation](#installation)
- [Prerequisites](#prerequisites)
- [Lab Exercises](#lab-exercises)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

In this course, we will explore various concepts of operating systems through a series of hands-on lab experiments. These experiments will help you understand the fundamental principles and practices of operating systems.

## Class Experiments

Below is the list of experiments we will cover in this course along with their corresponding Course Outcomes (COs) and references:

1. **Linux/Unix Commands for Beginners**
   - **COs:** 1
   - **Reference:** Lab Manual, Experiment 1
   - **Activity:** Lab Experiment

2. **Linux/Unix Commands - II**
   - **COs:** 1
   - **Reference:** Lab Manual, Experiment 2
   - **Activity:** Lab Experiment

3. **Shell Scripting - I**
   - **COs:** 2
   - **Reference:** Lab Manual, Experiment 3
   - **Activity:** Lab Experiment

4. **Shell Scripting - II**
   - **COs:** 2
   - **Reference:** Lab Manual, Experiment 4
   - **Activity:** Lab Experiment

5. **CPU Scheduling Algorithms to Find Turnaround Time and Waiting Time**
   - **COs:** 1
   - **Reference:** Lab Manual, Experiment 5
   - **Activity:** Lab Experiment

6. **Simulating the MFT and MVT Memory Management Techniques**
   - **COs:** 1
   - **Reference:** Lab Manual, Experiment 6
   - **Activity:** Lab Experiment

7. **Contiguous Memory Allocation Techniques**
   - **COs:** 1
   - **Reference:** Lab Manual, Experiment 7
   - **Activity:** Lab Experiment

8. **Page Replacement Algorithms**
   - **COs:** 2
   - **Reference:** Lab Manual, Experiment 8
   - **Activity:** Lab Experiment

9. **Thread Management**
   - **COs:** 1
   - **Reference:** Lab Manual, Experiment 9
   - **Activity:** Lab Experiment

10. **Semaphore**
    - **COs:** 1
    - **Reference:** Lab Manual, Experiment 10
    - **Activity:** Lab Experiment

11. **Resource Allocation Graph - Deadlock Detection**
    - **COs:** 1
    - **Reference:** Lab Manual, Experiment 11
    - **Activity:** Lab Experiment

12. **Project Presentation**
    - **COs:** 1, 2, 3
    - **Reference:** N/A
    - **Activity:** Presentation, Viva

13. **Final Examination**
    - **COs:** 1, 2, 3
    - **Reference:** N/A
    - **Activity:** Lab Test, Viva


## Installation

To install the necessary dependencies and set up the lab environment, follow these steps:

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/os-lab.git
    cd os-lab
    ```

2. Install any required packages or dependencies. For example, on a Debian-based system:

    ```bash
    sudo apt-get update
    sudo apt-get install build-essential
    ```
## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed a C/C++ compiler (such as GCC or Clang).
- You have installed Git.
- You have a basic understanding of C/C++ programming.
- You have a basic understanding of operating system concepts.

## Lab Exercises

The repository is organized into directories for each lab exercise. Each directory contains the following:

- `README.md`: Instructions for the lab exercise.
- `src/`: Source code for the lab exercise.
- `docs/`: Documentation for the lab exercise.
- `Makefile`: Makefile to build the lab exercise (if applicable).



## Usage

Navigate to the specific lab directory and follow the instructions in the corresponding README files. For example, to run the first lab exercise:

```bash
cd lab1
gcc lab1.c -o lab1
./lab1
