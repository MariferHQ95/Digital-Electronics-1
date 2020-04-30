# Project- Count down module from set value to zero.

The aim for this project is to us VHDL modules from previous exercises is to create a module count down from set value to zero.

The set value mentioned before will be given by a periferic component which will be a rotatory encoder KY-040 with push-button, and this value will depend on the direction of rotation of the knob. The digit can be changed pushing the encoder’s button and the number of the selected digit will change depending on the value received. The output of this, should be displayed in the 7-segment display thanks to either the control circuit TM1637 or the CoolRunner-II CPLD starter board.

All the mentioned before would be possible thanks to the modules developed in previous practices such as clock_enable, binary_counter, and others.

### Rotary Encoder KY-040

The KY-040 rotary encoder is a rotary input device (as in knob) that provides an indication of how much the knob has been rotated AND what direction it is rotating in. It’s a great device for stepper and servo motor control. You could also use it to control devices like digital potentiometers.

A rotary encoder has a fixed number of positions per revolution. These positions are easily felt as small “clicks” you turn the encoder. The KY-040 module has thirty of these positions. On one side of the switch there are three pins. They are normally referred to as A, B and C. In the case of the KY-040, they are oriented as shown. Inside the encoder there are two switches. Once switch connects pin A to pin C and the other switch connects pin B to C.

[![Rotary Encoder KY-040](https://http2.mlstatic.com/rotary-encoder-rotativo-ky-040-20-pasos-por-vuelta-arduino-D_NQ_NP_908324-MLA31076716097_062019-F.jpg "Rotatory Encoder KY-040")](https://http2.mlstatic.com/rotary-encoder-rotativo-ky-040-20-pasos-por-vuelta-arduino-D_NQ_NP_908324-MLA31076716097_062019-F.jpg "Rotatory Encoder KY-040")
>Rotary Encoder KY-040.

In each encoder position, both switches are either opened or closed. Each click causes these switches to change states as follows: 

- If both switches are closed, turning the encoder either clockwise or counterclockwise one position will cause both switches to open 
- If both switches are open, turning the encoder either clockwise or counterclockwise one position will cause both switches to close. 

If we were to represent the opening and closing of the switches as wave forms, it would look something like this:

[![Representation of the opening and closing of the switches as wave forms.](https://i.stack.imgur.com/oEwqe.gif "Representation of the opening and closing of the switches as wave forms.")](https://i.stack.imgur.com/oEwqe.gif "Representation of the opening and closing of the switches as wave forms.")
>Representation of the opening and closing of the switches as wave forms.

Essentially, determining which switch changed states first is how the direction of rotation is determined. If A changed states first, the switch is rotating in a clockwise direction. If B changed states first, the switch is rotating in a counter clockwise direction.

This would be the circuit you can use to check the function of the rotatory encoder.

[![KY-040 Evaluation Circuit](https://i0.wp.com/henrysbench.capnfatz.com/wp-content/uploads/2015/05/Keyes-KY-040-Rotary-Encoder-Evaluation-Schematic.png?fit=636%2C570 "KY-040 Evaluation Circuit")](https://i0.wp.com/henrysbench.capnfatz.com/wp-content/uploads/2015/05/Keyes-KY-040-Rotary-Encoder-Evaluation-Schematic.png?fit=636%2C570 "KY-040 Evaluation Circuit")
>KY-040 Evaluation Circuit

### 7-Segment Display KW4-281 ASB

This would be the exact model of the 7-segment display we are used to practice with during lab practices. Now we are going to tal a little about general information about 7-segment displays.

The 7-segment display, also written as “seven segment display”, consists of seven LEDs (hence its name) arranged in a rectangular fashion as shown. Each of the seven LEDs is called a segment because when illuminated the segment forms part of a numerical digit (both Decimal and Hex) to be displayed.

Each one of the seven LEDs in the display is given a positional segment with one of its connection pins being brought straight out of the rectangular plastic package. These individually LED pins are labelled from a through to g representing each individual LED. The other LED pins are connected together and wired to form a common pin.

[![Internal Circuit Diagram (Common Anode) of a 4-digit 7-segment display](https://www.swharden.com/wp/images/2014/02/common-cathode-7-segment-display-lcd.jpg "Internal Circuit Diagram (Common Anode) of a 4-digit 7-segment display")](https://www.swharden.com/wp/images/2014/02/common-cathode-7-segment-display-lcd.jpg "Internal Circuit Diagram (Common Anode) of a 4-digit 7-segment display")
>Internal Circuit Diagram (Common Anode) of a 4-digit 7-segment display

[![The anodes of the seven LEDs forming each digit are tied together into one “common anode” circuit node, but the LED cathodes remain separate](https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR9OyQVqOQy58G0PW-P_ww4UmHhY6QiBKcn8LKuTaSY95124bEe&usqp=CAU "The anodes of the seven LEDs forming each digit are tied together into one “common anode” circuit node, but the LED cathodes remain separate")](https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR9OyQVqOQy58G0PW-P_ww4UmHhY6QiBKcn8LKuTaSY95124bEe&usqp=CAU "The anodes of the seven LEDs forming each digit are tied together into one “common anode” circuit node, but the LED cathodes remain separate")
>The anodes of the seven LEDs forming each digit are tied together into one “common anode” circuit node, but the LED cathodes remain separate.

### CoolRunner-II CPLD Starter Board.

The CoolRunnerTM-II Evaulation Board is a complete USB-powered circuit development platform for the Xilinx CoolRunner-II CPLD. The board includes highly efficient power supplies, a user configurable oscillator, several user I/O devices, a real-time current meter, and a USB port for board power and CPLD programming. The board includes five expansion connectors that route 64 signals available from the CPLD to external circuits to expand board capability.

[![CoolRunner-II CPLD Starter Board.](https://reference.digilentinc.com/_media/reference/programmable-logic/coolrunner-ii/cr2-0.png "CoolRunner-II CPLD Starter Board.")](https://reference.digilentinc.com/_media/reference/programmable-logic/coolrunner-ii/cr2-0.png "CoolRunner-II CPLD Starter Board.")
>CoolRunner-II CPLD Starter Board.

### References
- [7-segment display](https://www.electronics-tutorials.ws/blog/7-segment-display-tutorial.html "7-segment display")
- [CoolRunner-II Evaluation Board Reference Manual](https://www.xilinx.com/support/documentation/boards_and_kits/ug501.pdf "CoolRunner-II Evaluation Board Reference Manual")
- [Rotary Encoder KY-040](https://www.handsontec.com/dataspecs/module/Rotary%20Encoder.pdf "Rotary Encoder KY-040")
