2. Run any text editor, such as Visual Studio Code, open `Digital-electronics-1/Labs/01-gates/README.md` file, create/complete tables with logical values, and add a screenshot from the simulator.

    ![and_gates](../../Documents/alkan00/01-gates/2. ukol.png) 

   | **A** | **NOT** |
    | :-: | :-: |
    | 0 | 1 |
    | 1 | 0 |

    | **A** | **B** | **AND** | **NAND** |
    | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 |
    | 0 | 1 | 0 | 1 |
    | 1 | 0 | 0 | 1 |
    | 1 | 1 | 1 | 0 |

    | **A** | **B** | **OR** | **NOR** |
    | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 |
    | 0 | 1 | 1 | 0 |
    | 1 | 0 | 1 | 0 |
    | 1 | 1 | 1 | 0 |

    | **A** | **B** | **XOR** | **XNOR** |
    | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 |
    | 0 | 1 | 1 | 0 |
    | 1 | 0 | 1 | 0 |
    | 1 | 1 | 0 | 1 |

3. Use online simulator and verify De Morgan's laws.

   ![equation](https://latex.codecogs.com/gif.latex?f&space;=&space;a&space;\cdot&space;\bar{b}\:&space;&plus;&space;\bar{b}\:\cdot\:&space;\bar{c})

    &nbsp;

    ![equation](https://latex.codecogs.com/gif.latex?f_{AND}&space;=&space;\overline{\overline{(a&space;\cdot&space;\bar{b}\:)}&space;\cdot&space;\overline{&space;(\bar{b}\:\cdot\:&space;\bar{c})}})
    
    &nbsp;
    
    ![equation](https://latex.codecogs.com/gif.latex?f_{OR}&space;=&space;\overline{(\bar{a}&space;&plus;&space;b\:)}&space;&plus;&space;\overline{&space;(b\:&plus;\:&space;c)})
    
    &nbsp;

    | **A** | **B** |**C** | ![equation](https://latex.codecogs.com/gif.latex?f) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BAND%7D) | ![equation](https://latex.codecogs.com/gif.latex?f_%7BOR%7D) |
    | :-: | :-: | :-: | :-: | :-: | :-: |
    | 0 | 0 | 0 | 1 | 1 | 1 |
    | 0 | 0 | 1 | 0 | 0 | 1 |
    | 0 | 1 | 0 | 0 | 0 | 0 |
    | 0 | 1 | 1 | 0 | 0 | 0 |
    | 1 | 0 | 0 | 1 | 1 | 1 |
    | 1 | 0 | 1 | 1 | 1 | 1 |
    | 1 | 1 | 0 | 0 | 0 | 1 |
    | 1 | 1 | 1 | 0 | 0 | 0 |

## Ideas for other tasks

1. Use online digital circuit simulator, draw the logic diagram according to figure, complete the truth table, and determine the circuit function.

    ![logic](../../Images/gates_2-4.png)

    | **A** | **B** | **Q3** | **Q2** | **Q1** | **Q0** |
    | :-: | :-: | :-: | :-: | :-: | :-: |
    | 0 | 0 |  |  |
    | 0 | 1 |  |  |
    | 1 | 0 |  |  |
    | 1 | 1 |  |  |

    > Figure was created in online [draw.io](https://www.draw.io/) diagram editor.
    >
