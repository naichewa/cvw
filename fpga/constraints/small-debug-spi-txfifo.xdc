create_debug_core u_ila_0 ila




set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
startgroup 
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0 ]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0 ]
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0 ]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0 ]
endgroup
connect_debug_port u_ila_0/clk [get_nets CPUCLK]

set_property port_width 64 [get_debug_ports u_ila_0/probe0]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {wallypipelinedsoc/core/PCM[0]} {wallypipelinedsoc/core/PCM[1]} {wallypipelinedsoc/core/PCM[2]} {wallypipelinedsoc/core/PCM[3]} {wallypipelinedsoc/core/PCM[4]} {wallypipelinedsoc/core/PCM[5]} {wallypipelinedsoc/core/PCM[6]} {wallypipelinedsoc/core/PCM[7]} {wallypipelinedsoc/core/PCM[8]} {wallypipelinedsoc/core/PCM[9]} {wallypipelinedsoc/core/PCM[10]} {wallypipelinedsoc/core/PCM[11]} {wallypipelinedsoc/core/PCM[12]} {wallypipelinedsoc/core/PCM[13]} {wallypipelinedsoc/core/PCM[14]} {wallypipelinedsoc/core/PCM[15]} {wallypipelinedsoc/core/PCM[16]} {wallypipelinedsoc/core/PCM[17]} {wallypipelinedsoc/core/PCM[18]} {wallypipelinedsoc/core/PCM[19]} {wallypipelinedsoc/core/PCM[20]} {wallypipelinedsoc/core/PCM[21]} {wallypipelinedsoc/core/PCM[22]} {wallypipelinedsoc/core/PCM[23]} {wallypipelinedsoc/core/PCM[24]} {wallypipelinedsoc/core/PCM[25]} {wallypipelinedsoc/core/PCM[26]} {wallypipelinedsoc/core/PCM[27]} {wallypipelinedsoc/core/PCM[28]} {wallypipelinedsoc/core/PCM[29]} {wallypipelinedsoc/core/PCM[30]} {wallypipelinedsoc/core/PCM[31]} {wallypipelinedsoc/core/PCM[32]} {wallypipelinedsoc/core/PCM[33]} {wallypipelinedsoc/core/PCM[34]} {wallypipelinedsoc/core/PCM[35]} {wallypipelinedsoc/core/PCM[36]} {wallypipelinedsoc/core/PCM[37]} {wallypipelinedsoc/core/PCM[38]} {wallypipelinedsoc/core/PCM[39]} {wallypipelinedsoc/core/PCM[40]} {wallypipelinedsoc/core/PCM[41]} {wallypipelinedsoc/core/PCM[42]} {wallypipelinedsoc/core/PCM[43]} {wallypipelinedsoc/core/PCM[44]} {wallypipelinedsoc/core/PCM[45]} {wallypipelinedsoc/core/PCM[46]} {wallypipelinedsoc/core/PCM[47]} {wallypipelinedsoc/core/PCM[48]} {wallypipelinedsoc/core/PCM[49]} {wallypipelinedsoc/core/PCM[50]} {wallypipelinedsoc/core/PCM[51]} {wallypipelinedsoc/core/PCM[52]} {wallypipelinedsoc/core/PCM[53]} {wallypipelinedsoc/core/PCM[54]} {wallypipelinedsoc/core/PCM[55]} {wallypipelinedsoc/core/PCM[56]} {wallypipelinedsoc/core/PCM[57]} {wallypipelinedsoc/core/PCM[58]} {wallypipelinedsoc/core/PCM[59]} {wallypipelinedsoc/core/PCM[60]} {wallypipelinedsoc/core/PCM[61]} {wallypipelinedsoc/core/PCM[62]} {wallypipelinedsoc/core/PCM[63]} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe1]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list wallypipelinedsoc/core/TrapM ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe2]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list wallypipelinedsoc/core/InstrValidM ]]

create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe3]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/FrameCount[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/FrameCount[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/FrameCount[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/FrameCount[3]} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/winc} ]]  

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rinc} ]]  

create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe6]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wptr[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wptr[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wptr[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wptr[3]} ]]  

create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe7]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rptr[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rptr[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rptr[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rptr[3]} ]]  

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ShiftIn} ]]

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftReg[7]} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SCLKenable} ]] 

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SampleEdge} ]] 

create_debug_port u_ila_0 probe
set_property port_width 3 [get_debug_ports u_ila_0/probe12]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/state[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/state[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/state[2]} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SPICLK} ]] 

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SPIOut} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SPICS[0]} ]] 

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ShiftEdge} ]] 

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe17]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftReg[7]} ]]

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe18]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveData[7]} ]]

create_debug_port u_ila_0 probe
set_property port_width 9 [get_debug_ports u_ila_0/probe19]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[7]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitData[8]} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftRegLoadSingleCycle} ]] 

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe21]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wdata[7]} ]]  

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe22]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rdata[7]} ]]  

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/winc} ]]  

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rinc} ]]  

create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe25]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wptr[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wptr[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wptr[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wptr[3]} ]]  

create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe26]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptr[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptr[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptr[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptr[3]} ]]  

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/wfull} ]]  

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rempty} ]]  

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftEmpty} ]] 

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftRegLoad} ]] 

create_debug_port u_ila_0 probe
set_property port_width 4 [get_debug_ports u_ila_0/probe31]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptrnext[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptrnext[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptrnext[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/txFIFO/rptrnext[3]} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ZeroDiv} ]]

create_debug_port u_ila_0 probe
set_property port_width 12 [get_debug_ports u_ila_0/probe33]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[7]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[8]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[9]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[10]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDiv[11]} ]]

create_debug_port u_ila_0 probe
set_property port_width 12 [get_debug_ports u_ila_0/probe34]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[7]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[8]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[9]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[10]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/SckDivLock[11]} ]]

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/TransmitShiftFullFlag} ]] 

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe36]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/PADDR[7]} ]] 

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/Memwrite} ]] 

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe38]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/wdata[7]} ]]  

create_debug_port u_ila_0 probe
set_property port_width 8 [get_debug_ports u_ila_0/probe39]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[0]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[1]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[2]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[3]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[4]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[5]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[6]} {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/rxFIFO/rdata[7]} ]] 

create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {wallypipelinedsoc/uncoregen.uncore/sdc.sdc/ReceiveShiftFull} ]] 


# the debug hub has issues with the clocks from the mmcm so lets give up an connect to the 100Mhz input clock.
#connect_debug_port dbg_hub/clk [get_nets default_100mhz_clk]
connect_debug_port dbg_hub/clk [get_nets CPUCLK]