###################################################################

# Created by write_sdc on Tue Oct 31 19:19:32 2017

###################################################################
set sdc_version 1.7

create_clock [get_ports clock]  -name CLK  -period 1.7  -waveform {0 0.85}
