# Operating System

## Introduction to Operating System

#### Computer System Components
1. Hardware
2. Operating System
3. Application
4. User

#### What is Operating System
- is a program that controls the execution of application programs
- is an interface between the user and hardware
- **OS must deal with hardware details**

Definition
- Some components integrated together for operating the computer system `Hardware & Software`

#### Three main objectives of Operating System:
- Efficiency
- Ease to use (Convenience)
- Ability to Evolve (abstract and extend)

*Most of operating systems are written in the C/C++ language.*

# Bootstrap
The first code runs when the computer turn on (or rebooted) is for the boot flow which is a framework stored in the **ROM**, contains some instructions called **Basic input output instructions (BIOS)**.

**Bootstrap also called Bootloader**

It initialize all aspects of the system from CPU registers to device controllers and the contents of the main memory and then starts the operating system.

#### Bootstrap Process
1. Bootstrap program runs
2. Operating system is loaded
3. Operating system runs

# Operating System Services
- Program Execution
- File Management
- I/O Operations
- System Access (Error Detection)

# Operating System Categories (Usage Types)
1. Batch
    
    Group tasks that perform similar functions. This tasks are processed as a batch and executed simultaneously.

2. Time Sharing
    
    Groups of OS share the same resource.

3. Parallel - Distributed OS

    Distributed hardware work to gether in parallel way.

4. Network - Distributed OS

    Distributed hardware work to gether in remote way.

5. Real Time

# Multiprocessor System
is a type of processing in which two or more processors work together to process more than one program simultaneously.

**Loosely & Tightly Coupled Multiprocessor System**
.| Loosely CMS | Tightly CMS
-|-------------|-----------
Memory| Own memory module | Shared memory modules
Efficient| Tasks running on different processors, has minimal interaction | High-speed/Real-time processing
Memory conflict| Doesn't occur | experiences more memory conflict
Data rate| Low | High
Expensive| Less | More

# Responsibilities of Operating System
- Scheduling
- Memory Management
- I/O and Resource Management
- File Systems
- User interface/shell

# Kernel
is the core of all operating systems.
Running at all times in the main memory

#### Kernel Functions
- Switching between programs
- Hardware device control
- Memory Management
- Process Management
- Scheduling (deciding what programs to run)
- Inter-process communication

# Utility Programs (System Software or API's)
Types
- File Manager
- Task Manager
- Uninstaller
- File Compressor
- Disk Scanner

# Scheduling
- Ready Queue: When a new process is created it transitions from `New` to the `Ready` state.
- Waiting Queue: When a process gets blocked by a dependent I/O or device or needs to be suspended temporarily it moves to the `Blocked` state.
- Job Queue: Maintains all the process in the system at any point in time.

#### Scheduling Criteria 
- CPU Utilization and Execution Runtime: The total amount of time the process
is making use of the CPU excluding NOP (no-operation) idle cycles.
- Volume/Execution Throughput
- Responsiveness
- Resource Waiting Time: The average time taken on external I/Os on the
system.

#### Scheduling Algorithms:
- First Come First Serve (FCFS)
- Round Robin
- Shortest Job First (SJF)
- Shortest Job First Preemptive (SJF P)
- Priority Preemptive
- Priority Non-Preemptive

# Context Switching
The operating system swap the currently executing process with another process to allow other applications to run.

# Process Control Block (PCB)
- Process ID
- Process State
- Pointer: could refer to the hierarchy of processes
- Priority
- Affinity and CPU register: details include if there is a need to run a process on a specific core. It may also hold other register and memory details
- Program Counter: usually refers to the next instruction that needs to be run.
- I/O status information
- Accounting information

# Thread
A thread is a software managed by operating system, also called a lightweight process. Threads provide a way to improve application performance through parallelism.

# System Call
The interface between a process and an operating system, Or the interface between user-mode and kernel-mode.

# Storage Device (Memory) Hierarchy
- Primary Storage
1. Registers
2. Caches
3. Main Memory
- Secondary Storage
4. Flash Disk
5. Traditional Disk
6. Remote Secondary Storage

*Top is Faster, bottom is Slower*

# Memory Management Unit
is responsible for translating virtual addresses or logical addresses to physical addresses

# Inter-Process Communication
is the mechanism provided by the operating system that allows processes to communicate with each other using `Shared Memory Method` or `Message Passing Method`.

*When two processes need to save in the shared memory at the same time it is called `Synchronization`*

# Device Controller & Device Driver
Device Driver is a code inside OS that allows to be empowered with the specific commands.

Device Controller is a bridge between the device and the OS, It's an **electronic component** which control the device.

# I/O Subsystem
Input/output devices that are connected to the computer are called peripheral devices.

#### I/O Subsystems Buses
- Address Bus: Carries the address of data between the processor and memory
- Data Bus: Carries data between the processor and the memory and the I/O device
- Control Bus: Carries control signals/commands from the CPU


# Direct Memory Access (DMA)
DMA Controller is allows I/O devices to directly access memory with less participation of the processor.

# Interrupt
An interrupt is a signal which sent from a device or from software to the operating system. this case the OS to temporarily stop what it is doing and serve the interrupt.

- Interrupt -> Send signal to CPU (Hardware)
- Polling -> CPU check if there is any signal from OS every few seconds (Protocol)

1. Maskable Interrupt: An interrupt that can be disabled or ignore by CPU
2. Non-Maskable Interrupt: An interrupt that can not be disabled or ignored

# Interrupt Handler
Interrupt Handler is the part of the operating system.

**Interrupt Handler Mechanisms**
- Polling or programmed I/O
- Interrupt-Driven I/O
- Synchronous I/O
- Asynchronous I/O


# Mutex
Mutex is a program that prevents multiple threads from accessing the same shared resource simultaneously.

# Semaphore
Semaphore is a variable data type used to control access to a common resource by multiple threads and avoid critical section problems.

# Deadlock
Deadlock is a situation in which more than on process holding on the same resource and also requires same resource.

Deadlock can happen on these conditions:
- Mutual Exclusion
- Hold and Wait
- No Preemption
- Circular Wait


# File System

#### Main Components
- Directory Service: Read-Write-Edit Controls on file system.
- Storage Service: Communicate with hardware such as the hard disk.

# Virtualization
- host OS provides a hypervisor which manges the access to the hardware.
- guest OS does not know about host OS resources or hardware request but guest OS share it's resource with host OS.

# Central Processing Unit (CPU)
The CPU contains the ALU, CU and a verity of registers.

- Registers
    - MAR: Memory Address Resister
    - MDR: Memory Data Register
    - AC: Accumulator Where intermediate arithmetic and logic results are stored
    - PC: Program Counter Which contains the address of the next instruction
    - CIR: Current Instruction Register Which contains the current instruction during processing

- ALU: Arithmetic and Logic Unit (AND, OR, NOT logic gates)

- CU: Control Unit: controls the operation of the computer’s ALU, memory and input/output devices.
