********Final PLL*********
**************************


XX1 f_in f_VCO/8 up down pfd_501
XX2 up down Vin_vco charge_pump
XX3 Vin_vco f_out vco_19_16
XX5 f_out N003 freq_div_2
XX6 N003 N002 freq_div_2
XX7 N002 f_VCO/8 freq_div_2

****************************************************
*_____________Library/subcircuit files______________
.include pfd_501.lib
.include charge_pump.lib
.include vco_19_16.lib
.include freq_div_2.lib
.include cs_inv.lib
.include inv101.lib
.include inv_20_10.lib
.include nand101.lib
.include nand301.lib
.include nand401.lib

.include osu018.lib
.model NMOS nfet
.model PMOS pfet

****************************************************



*****************
*input sources
*V1=5MHz
*V2=10MHz
*V3=12MHz
*****************


********Connected input frequency=5MHz************
V1 f_in 0 PULSE 0 1.8 10p 10p 10p 100n 200n
**************************************************


**************************************************
*other sources are not connected at the moment
*V2 10MHz 0 PULSE(0 1.8 10p 10p 10p 50n 100n)
*V3 12MHz 0 PULSE(0 1.8 10p 10p 10p 41.665n 83.33n)
****************************************************

****************LPF******************************
C1 Vin_vco 0 200p
C2 N001 0 500p
R1 Vin_vco N001 500
************************************************


************simulation commands**************
.tran 1ns 5u
.ic V(vin_vco) = 0
.control
run
plot V(f_in) V(f_out)
.endc
.end
