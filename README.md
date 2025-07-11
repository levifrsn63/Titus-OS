# Titus OS


**RTL8720DN Deauther**


**Acknowledgement**
This project makes use of code from the following repositories. I acknowledge and appreciate the contributions of the original authors.

Cypher-5G-Deauther by dkyazzentwatwa
RTL8720dn-Deauther by tesa-klebeband
NovaX-5G-RTL8720dn-Bw16-Deauther by warwick320
I have used portions of their code in my work, and I highly recommend checking out their projects for further insights.

If you use this project and build upon it, please consider crediting these sources as well. Thank you to the original developers for their hard work and contributions to the community!



**How to Upload Firmware / Usage**
Download the Adafruit_BusIO, Adafruit_GFX_Library, & Adafruit_SSD1306. You need to first backup any files that will be replaced, and then add this into your Arduino/libraries folder.

This fixes bugs that make Adafruit SSD1306 library incompatible with BW16 board.
Upload the firmware using the .ino file via Arduino IDE.

Turn it on and select/attack!

You can also connect to web ui (change credentials in code)

wifi= titus x01 pw= titusrocks



**Requirements**

SSD1306

3 Buttons

BW16 Kit

Connections
Buttons
BTN_UP: PA30
BTN_DOWN: PA14
BTN_OK: PA12
SSD1306 128x64 .96inch Display
SDA: PA26
SCL: PA25
