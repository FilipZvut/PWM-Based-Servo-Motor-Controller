# PWM-Based-Servo-Motor-Controller

### Team members

* Dominik Fidler (responsible for ...)
* Filip Žádník (responsible for ...)
* Matěj Hrdlička (responsible for ...)
* Vít Urban (responsible for ...)

## Theoretical description and explanation

Jako zadání našeho projektu jsme si vybrali ovladač PWM servo motorů. K řešení této problematiky jsme přistoupíili takovým způsobem, že jsme si zvolili 14 tlačítek pro ovládání dvou motorů, poté jsme navrhli 2 RGB diody, které znázorňují polohu jednotlivých servo motorů. Dále jsme vytvořili tlačítko reset, které drží motory v poloze. 
Enter a description of the problem and how to solve it.

## Hardware description of demo application

Insert descriptive text and schematic(s) of your implementation.

## Software description
![top_level struktura](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114609552/3dc20b12-acff-41b6-9fe2-a019c41c8f2e)
_struktura top_level_

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Component(s) simulation
![simulace ](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114728810/c913d20c-7a3d-422d-84a7-c1fe0706536c)
_simulace funkcí PWM motorů_


![simulace z blizka](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114728810/31491d51-ab36-4e90-ad54-29dd67505910)
_simulace zblízka - náběžná hrana clk_out spouští signál na servo motory_

## Instructions
Ovládání PWM motorů pomocí 7 spínačů, které určují binárně polohu motoru. RGB LED diody znázorňují polohu, červená barva - 0 až 43, modrá barva - 44 až 86 a zelená barva - 87 až 127. Když se zmáčkne tlačítko resetu, tak se motor zastaví na aktuální poloze a poté se přesune na jinou nastavenou polohu.

https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114609552/189e8503-0039-4d16-a9b2-e80ff4e623cc
_znazornění funkce na videu_

## References

1. https://www.codeproject.com/Articles/513169/Servomotor-Control-with-PWM-and-VHDL
2. https://vhdlwhiz.com/pwm-controller/
3. https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual
