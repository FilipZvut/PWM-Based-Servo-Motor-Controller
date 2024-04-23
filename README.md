# PWM-Based-Servo-Motor-Controller

### Členové týmu

* Dominik Fidler (zodpovědný za - README, doladění kódu)
* Filip Žádník (zodpovědný za - Struktura kódu)
* Matěj Hrdlička (zodpovědný za - README, RGB Controllers)
* Vít Urban (zodpovědný za - Úprava a finalizace kódu)

## Teoretický popis problému

Jako zadání našeho projektu jsme si vybrali ovladač PWM servo motorů. K řešení této problematiky jsme přistoupíili takovým způsobem, že jsme si zvolili 14 (SW0-SW6) + (SW9-SW15) přepínačů pro ovládání dvou na sobě nezávislých motorů, poté jsme navrhli 2 RGB diody, které znázorňují polohu jednotlivých servo motorů. Tlačítko BTNC (reset) je navrženo tak, aby při jeho stisknutí servo motory nepřijímaly nové příkazy. 
Pro každý servo motor je přiřazených 7 switchů, což umožní každému servu až 128 pozic.

![image](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114609552/b9a2d77b-ad37-4b39-85c9-1f665019ac6a)

_PWM servo controller_

Našim cílem bylo najít minimální potřebnou výstupní frekvenci 64 kHz (clk_out). To jsme získali vydělením rozsahu šířky pulzu počtem nastavitelných pozic serva.

$$ f = ({2ms \over 128})^{-1} = 64kHz $$

Pro zaručení, že naše frekvence bude mít velikost o 20ms, implementujeme counter od 0 do 1279

$$ f = ({20ms * 64kHz}) = 1280 $$


## Hardware popis
Program ve VHDL jsme importovali na desku Nexys A7-50t, kde využíváme celkem 14 switchů pro binární zadání pozic servo motorů, které jsou ovládany přes JA a JB PMOD headry. Dále máme implementované tlačítko BTNC pro pozastavení. Deska Nexys A7-50t napětí 3,3V což je dostačující pro tento typ použití.

<img src="https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114728810/7f086bb0-13bd-4dc6-8bc1-ec9378d10972" width="425"> 

_použitý typ servomotoru_ ‎ 

<img src="https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114609552/259c79a2-7a2c-4b5c-89ca-de4d788b58a3" width = 567>                                                                                                                                

_použitá deska Nexys A7-50t_ ‎

![PMOD](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114609552/2300790a-4b8a-4120-9727-85808ec0304b)

_připojení servomotoru pomocí PMOD konektoru na desce Nexys A7-50t_


## Software popis


![top_level struktura](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114609552/3dc20b12-acff-41b6-9fe2-a019c41c8f2e)

_struktura top_level_

[ukázka z top_level](PWM-Based-Servo-Motor-Controller.srcs/sources_1/new/top_level.vhd) <br>
N_PERIODS je určena na 1562 z důvodu zachování správné frekvence.

$$ T = ({100MHz \over 64kHz}) = 1562 $$
```
 signal clk_out : std_logic := '0';
begin
    clock_enable_map : component clock_enable
        generic map (
            N_PERIODS => 1562
        )
        port map (
            clk   => CLK100MHZ,
            rst   => BTNC,
            pulse => clk_out
        );
```

### Simulace komponent
![simulace ](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114728810/c913d20c-7a3d-422d-84a7-c1fe0706536c)

_simulace funkcí PWM motorů_


![simulace z blizka](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114728810/31491d51-ab36-4e90-ad54-29dd67505910)

_simulace zblízka - náběžná hrana clk_out spouští signál na servo motory_

## Instrukce a video
Na videu demonstrujeme ovládání PWM servopohonů pomocí 7 spínačů, které určují binárně polohu motoru. RGB LED diody znázorňují polohu, červená barva - 0 až 43, modrá barva - 44 až 86 a zelená barva - 87 až 127. Když se zmáčkne tlačítko resetu, tak se motor zastaví na aktuální poloze a poté se přesune na jinou nastavenou polohu. V ideálním případě se motory otočí v rozsahu 0-180 stupňů. Z důvodu nedokonalostí však nemusí být pozicování přesné.

[PWM-BasedServoController](https://github.com/FilipZvut/PWM-Based-Servo-Motor-Controller/assets/114609552/6cdad9c0-5efa-47d9-b98b-9a0cde744f41)

_znazornění funkce na videu_

## Zdroje

1. https://www.codeproject.com/Articles/513169/Servomotor-Control-with-PWM-and-VHDL
2. https://vhdlwhiz.com/pwm-controller/
3. https://digilent.com/reference/programmable-logic/nexys-a7/reference-manual

