# regnbit.sdc
# DE10-Lite (MAX 10), ρολόι 50 MHz
create_clock -name clk -period 20.000 -waveform {0.000 10.000} [get_ports {clk}]
derive_clock_uncertainty

# Είσοδοι και έξοδοι σε σχέση με το ρολόι
set_input_delay -clock clk -max 3.000 [get_ports {din[*] ld inc}]
set_input_delay -clock clk -min 1.000 [get_ports {din[*] ld inc}]
set_output_delay -clock clk -max 3.000 [get_ports {dout[*]}]
set_output_delay -clock clk -min 0.000 [get_ports {dout[*]}]

# Το rst είναι ασύγχρονο (push button): εξαιρείται από την ανάλυση
set_false_path -from [get_ports {rst}]