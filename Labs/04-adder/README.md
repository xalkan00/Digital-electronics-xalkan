# Lab 4: Binary adder

The purpose of this laboratory exercise is to design an adder. It is a type of digital circuit that performs the operation of additions of two numbers. We will use slide switches on the CPLD expansion board as inputs and 7-segment display on the Coolrunner-II board as output device.




## Preparation tasks (done before the lab at home)

1. A half adder has two inputs A and B and two outputs Carry and Sum. Comlpete the half adder truth table. Draw a logic diagram of both output functions.

    | **B** | **A** | **Carry** | **Sum** |
    | :-: | :-: | :-: | :-: |
    | 0 | 0 |  |  |
    | 0 | 1 |  |  |
    | 1 | 0 |  |  |
    | 1 | 1 |  |  |

2. A full adder has three inputs and two outputs. The two inputs are A, B, and Carry input. The outputs are Carry output and Sum. Comlpete the full adder truth table and draw a logic diagram of both output functions.

    | **Cin** | **B** | **A** | **Cout** | **Sum** |
    | :-: | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 |  |  |
    | 0 | 0 | 1 |  |  |
    | 0 | 1 | 0 |  |  |
    | 0 | 1 | 1 |  |  |
    | 1 | 0 | 0 |  |  |
    | 1 | 0 | 1 |  |  |
    | 1 | 1 | 0 |  |  |
    | 1 | 1 | 1 |  |  |

3. Find the relationship between half adder and full adder logic diagrams.

4. See schematic of the [CPLD expansion board](../../Docs/cpld_expansion.pdf) and find out the connection of LEDs, push buttons, and slide switches.
