# Field Oriented Control (FOC) of a PMSM

This is the final project of the course "311 - Automation and Electrical Machines" at [FIng - UNCuyo](http://ingenieria.uncuyo.edu.ar/). Lectures and guidance by EEng. Gabriel Julián. Mendoza, Argentina.

The objective is to design an automatic position controller for a 3 phase AC permanent-magnet synchonous motor (PMSM). The system consists of a 3 phase AC PMSM, an inverter (0-24Vrms), a planetary gear set, 1 position sensor (encoder) and 3 current sensors.

We modelled and simulated the open-loop performance of the system. 

Then we added a torque modulator using a Constant (delta = 90°) Torque Angle Control strategy (direct axis current is zero). The nonlinear system is linearized using the feedback linearization technique. A modified PID position/speed controller is added. Finally, we designed a Luenberger state observer in order to estimate the speed of the motor's shaft.

We obtained a robust, well performant controller which can succesfully follow position and speed profiles. 

| ![Modulador de Torque](/docs/imgs/Modulador_de_Torque.png?raw=true) | 
|:--:| 
| Torque modulator. Decouples non-linear terms using feedback linearization and provides direct access to the motor's torque.|

| ![Global Model](/docs/imgs/PMSM_control.png?raw=true) | 
|:--:| 
| Global system. Includes the torque modulator, a PID position/speed controller and a state observer.|

Gino Avanzini, Emiliano Cabrino.

Automática y Máquinas Eléctricas - Ing. Gabriel Julián.

Ingeniería en Mecatrónica. Facultad de Ingeniería, Universidad Nacional de Cuyo

Mendoza, Argentina, 2020
