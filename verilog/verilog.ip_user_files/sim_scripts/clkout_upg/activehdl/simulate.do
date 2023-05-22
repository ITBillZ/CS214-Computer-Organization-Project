onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clkout_upg -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.clkout_upg xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {clkout_upg.udo}

run -all

endsim

quit -force
