# Lab 9-13: Project title
# Čt 8h: Ultrazvukový měřič vzdálenosti HC-SR04. Výstup na 7segmentovém displeji.
#### Contents

1. [Introduction](#Introduction)
2. [Hardware description](#Hardware-description)
3. [Sources](#Sources)



## Introduction
Ultrazvukový měřič vzdálenosti HC-SR04 je založen na vysílaných vlnách, které se následně odrazí zpět a vypočítá se vzdálenost. Velice přesné měření vzdálenosti, s přesností až 3mm na vzdálenost od 2centimetrů do 4 metrů. Ultrazvukový měřič vzdálenosti najde využití v Arduino projektech, kde se kontroluje například vzdálenost od překážky. Typickým příkladem je použití měřiče jako detektor překážky pro Arduino robota. K dispozici je Arduino knihovna a tak je získávání dat ze senzoru velmi jednoduché.

<img src="https://github.com/xalkan00/Digital-electronics-1/blob/master/Images/meric.jpg" />

## Hardware description
► Pracovní rozsah 2 cm až 4 m. Vysoká přesnost
► Knihovna pro jednoduché Arduino programování
► Jednoduché připojení díky 4pinovému konektoru se standardní roztečí 2,54 mm
► Piny VCC, GND, TRIG, ECHO
► 4 montážní otvory pro uchycení

Pomocí Arduina aktivujeme signál "TRIG" na měřiči vzdálenosti a to na dobu minimálně 10 μs. Po této aktivaci vyšle modul ultrazvukový signál a čeká na jeho odražení od překážky a zpětné zachycení měřičem. Mezi tím se aktivuje signál "ECHO", jehož délka je pak úměrná vzdálenosti překážky. Signál "ECHO" se deaktivuje po zachycení odraženého signálu měřičem vzdálenosti.

<img src="https://github.com/xalkan00/Digital-electronics-1/blob/master/Images/funkce_sensor.png" />


## Sources

https://drive.google.com/file/d/0B4B30jzMyzG8bk80Wk05cmVqdmc/view
https://www.laskarduino.cz/arduino-ultrazvukovy-meric-vzdalenosti-hc-sr04/
https://www.hwkitchen.cz/ultrazvukovy-meric-vzdalenosti-hc-sr04/

