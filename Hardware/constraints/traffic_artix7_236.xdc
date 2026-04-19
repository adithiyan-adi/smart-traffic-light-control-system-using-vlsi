## ------------------------------------------------
## BASYS 3 CLOCK
## ------------------------------------------------
set_property PACKAGE_PIN W5 [get_ports clk_100mhz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100mhz]
create_clock -period 10.0 [get_ports clk_100mhz]

## ------------------------------------------------
## RESET BUTTON (CENTER BUTTON)
## ------------------------------------------------
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## ------------------------------------------------
## EMERGENCY BUTTONS
## ------------------------------------------------
set_property PACKAGE_PIN T18 [get_ports btn_N]
set_property PACKAGE_PIN W19 [get_ports btn_E]
set_property PACKAGE_PIN T17 [get_ports btn_S]
set_property PACKAGE_PIN U17 [get_ports btn_W]

set_property IOSTANDARD LVCMOS33 [get_ports {btn_N btn_E btn_S btn_W}]

## ------------------------------------------------
## TRAFFIC DENSITY SWITCHES
## ------------------------------------------------
set_property PACKAGE_PIN W16 [get_ports {density_N[0]}]
set_property PACKAGE_PIN W17 [get_ports {density_N[1]}]
set_property PACKAGE_PIN W15 [get_ports {density_N[2]}]

set_property PACKAGE_PIN V15 [get_ports {density_E[0]}]
set_property PACKAGE_PIN W14 [get_ports {density_E[1]}]
set_property PACKAGE_PIN W13 [get_ports {density_E[2]}]

set_property PACKAGE_PIN V2 [get_ports {density_S[0]}]
set_property PACKAGE_PIN T3 [get_ports {density_S[1]}]
set_property PACKAGE_PIN T2 [get_ports {density_S[2]}]

set_property PACKAGE_PIN R3 [get_ports {density_W[0]}]
set_property PACKAGE_PIN W2 [get_ports {density_W[1]}]
set_property PACKAGE_PIN U1 [get_ports {density_W[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {density_N[*] density_E[*] density_S[*] density_W[*]}]

## ------------------------------------------------
## TRAFFIC LIGHT LED OUTPUTS
## ------------------------------------------------
# NORTH
set_property PACKAGE_PIN U16 [get_ports {N_light[0]}]
set_property PACKAGE_PIN E19 [get_ports {N_light[1]}]
set_property PACKAGE_PIN U19 [get_ports {N_light[2]}]

# EAST
set_property PACKAGE_PIN V19 [get_ports {E_light[0]}]
set_property PACKAGE_PIN W18 [get_ports {E_light[1]}]
set_property PACKAGE_PIN U15 [get_ports {E_light[2]}]

# SOUTH
set_property PACKAGE_PIN U14 [get_ports {S_light[0]}]
set_property PACKAGE_PIN V14 [get_ports {S_light[1]}]
set_property PACKAGE_PIN V13 [get_ports {S_light[2]}]

# WEST
set_property PACKAGE_PIN V3 [get_ports {W_light[0]}]
set_property PACKAGE_PIN W3 [get_ports {W_light[1]}]
set_property PACKAGE_PIN U3 [get_ports {W_light[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports {N_light[*] E_light[*] S_light[*] W_light[*]}]

## ------------------------------------------------
## SEVEN SEGMENT DISPLAY
## ------------------------------------------------
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports seg]

## ANODES
set_property PACKAGE_PIN W4 [get_ports {an[0]}]
set_property PACKAGE_PIN V4 [get_ports {an[1]}]

set_property IOSTANDARD LVCMOS33 [get_ports an]

## ------------------------------------------------
## REQUIRED CONFIG VOLTAGE (Fixes CFGBVS warning)
## ------------------------------------------------
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]