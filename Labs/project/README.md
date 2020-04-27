# Lab 9-13: Project title
# Čt 8h: Ultrazvukový měřič vzdálenosti HC-SR04. Výstup na 7segmentovém displeji.
#### Contents

1. [Introduction](#Introduction)
2. [Hardware description](#Hardware-description)
3. [Video](#Video)
4. [Diagram](#Diagram)
5. [Sources](#Sources)



## Introduction
Ultrazvukový měřič vzdálenosti HC-SR04 je založen na vysílaných vlnách, které se následně odrazí zpět a vypočítá se vzdálenost. Velice přesné měření vzdálenosti, s přesností až 3mm na vzdálenost od 2centimetrů do 4 metrů. Ultrazvukový měřič vzdálenosti najde využití v Arduino projektech, kde se kontroluje například vzdálenost od překážky. Typickým příkladem je použití měřiče jako detektor překážky pro Arduino robota. K dispozici je Arduino knihovna a tak je získávání dat ze senzoru velmi jednoduché.

<img src="https://github.com/xalkan00/Digital-electronics-1/blob/master/Images/meric.jpg" />

## Hardware description
###### ► Pracovní rozsah 2 cm až 4 m. Vysoká přesnost 
###### ► Knihovna pro jednoduché Arduino programování
###### ► Jednoduché připojení díky 4pinovému konektoru se standardní roztečí 2,54 mm
###### ► Piny:
######    **VCC -> napájecí zdroj pro ultrazvukový senzor vzdálenosti HC-SR04**
######    **GND -> uzemnění**
######    **TRIG = trigger_pin -> pin se používá ke spouštění ultrazvukových pulzů.**
######    **ECHO = pulse_pin -> pin produkuje puls, když je přijat odražený signál. Délka impulsu je úměrná době, kterou zabral detekovaný vysílaný signál.**
###### ► 4 montážní otvory pro uchycení

Pomocí Arduina aktivujeme signál "TRIG" na měřiči vzdálenosti a to na dobu minimálně 10 μs. Po této aktivaci vyšle modul ultrazvukový signál a čeká na jeho odražení od překážky a zpětné zachycení měřičem. Mezi tím se aktivuje signál "ECHO", jehož délka je pak úměrná vzdálenosti překážky. Signál "ECHO" se deaktivuje po zachycení odraženého signálu měřičem vzdálenosti.

<img src="https://github.com/xalkan00/Digital-electronics-1/blob/master/Images/funkce_sensor.png" />

## Diagram

<img src="https://github.com/xalkan00/Digital-electronics-1/blob/master/Images/schtop.png" />

## Video

https://howtomechatronics.com/tutorials/arduino/ultrasonic-sensor-hc-sr04/

## Sources

#### https://drive.google.com/file/d/0B4B30jzMyzG8bk80Wk05cmVqdmc/view
#### https://www.laskarduino.cz/arduino-ultrazvukovy-meric-vzdalenosti-hc-sr04/
#### https://www.hwkitchen.cz/ultrazvukovy-meric-vzdalenosti-hc-sr04/
#### https://lastminuteengineers.com/arduino-sr04-ultrasonic-sensor-tutorial/
