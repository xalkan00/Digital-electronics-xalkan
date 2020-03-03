# Lab 5: Binary counters

The purpose of this laboratory exercise is to design a counter.



## Preparation tasks (done before the lab at home)

1. Calculate how many periods of clock signal with ![equation](https://latex.codecogs.com/gif.latex?f_%7Bclk%7D%20%3D%2010%5C%2C%5Ctext%7BkHz%7D) contain time intervals 10&nbsp;ms, 250&nbsp;ms, 500&nbsp;ms, and 1&nbsp;s. Write values in decimal, binary, and hexadecimal forms.
    
    &nbsp;
    
    <a href="https://www.codecogs.com/eqnedit.php?latex=T_{clk}&space;=&space;\frac{1}{f_{clk}}=&space;1ms\:(1takt)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?T_{clk}&space;=&space;\frac{1}{f_{clk}}=&space;1ms\:(1takt)" title="T_{clk} = \frac{1}{f_{clk}}= 1ms\:(1takt)" /></a>
    
    &nbsp;

    | **Freq** | **Time** | **Number of periods** | **Number of periods in binary** | **Number of periods in hexa** |
    | :-: | :-: | :-: | :-: | :-: |
    | 100&nbsp;Hz | 10&nbsp;ms | 100 | 110 0100 | 64 |
    | 4&nbsp;Hz | 250&nbsp;ms | 2500 | 1001 1100 0100 | 9C4 |
    | 2&nbsp;Hz | 500&nbsp;ms | 5000 | 1 0011 1000 1000 | 1388 |
    | 1&nbsp;Hz | 1&nbsp;sec | 10000 | 10 0111 0001 0000 | 2710 |

2. See how to create a [synchronous operation](https://github.com/tomas-fryza/Digital-electronics-1/wiki/VHDL-cheat-sheet#processes) in the VHDL.

