# InstrumentCluster

## Introduction
This is the instrument cluster app in Coda: a Qt6 application with C++ backend for the best performance possible and the sleekest drip. The main design inspiration was the instrument cluster of Tesla Model Y's. 

## Design Overview
![](./README_Assets/light.png)
![](./README_Assets/dark.png)

## Main Features
1. Light Control: interactive buttons for low, high, and fog beams.
2. Speedometer: show the speed in the middle of the screen.
3. Detected Road sign Displayed: With the Help of the AI ECU, the detected road sign is displayed on the cluster.
4. Selected Gear: the selected gear is highlighted.
5. Interactive Car Model: car animation that stops and moves depending on the current speed.
6. Dark/Light Mode.
7. Blinkers: interactive buttons for left and right blinkers.
8. Clock.
9. Ambient Temperature.

## Design Architecture

### Frontend: QML
The design strategy was to create custom components for every element in the app. The main components present in the `Main.qml` are:
1. FooterBar: contains ITI's logo, clock, and temperature.
2. MainScreen: this is the frame that governs the rest of the components.

Inside `MainScreen`, these components are used:
1. GearShiftBar: shows gears.
2. LightControlBar: shows light beam controls.
3. CarModel: shows the car animation.
4. SpeedometerPlusSign: the frame that governs the components at the right hand side (except for the GearShiftBar).

Inside `SpeedometerPlusSign`, these components are used:
1. Indicators: left and right blinkers.
2. Speed: speed value + unit + road sign image.
3. BottomLine: for styling.

### Backend: C++
There are 4 classes defined and used in the app:
1. System: this is responsible for updating the clock.
2. ReadingsCommPortal: this is responsible for fetching the readings sent by the CommManagerService via a Unix Domain Socket.
3. LightControl: this is responsible for handling UI light beam buttons' clicks to set the value of certain GPIO pins accordingly.
4. Indicators: similar to LightControl, this is responsible for handling blinkers' button clicks to set the value of certain GPIO pins accordingly.
