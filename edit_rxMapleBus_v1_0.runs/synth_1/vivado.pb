
s
Command: %s
53*	vivadotcl2K
7synth_design -top rxMapleBus_v1_0 -part xc7z010clg400-12default:defaultZ4-113
/

Starting synthesis...

3*	vivadotclZ4-3
•
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-347
…
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7z0102default:defaultZ17-349
Þ
=concatenation with unsized literal; will interpret as 32 bits1849*oasys2g
Qc:/users/me/projects/zynq/ip_repo/rxmaplebus_1.0/hdl/rxMapleBus_v1_0_S_AXI_CRTL.v2default:default2
1262default:default8@Z8-1849
Þ
=concatenation with unsized literal; will interpret as 32 bits1849*oasys2g
Qc:/users/me/projects/zynq/ip_repo/rxmaplebus_1.0/hdl/rxMapleBus_v1_0_S_AXI_CRTL.v2default:default2
1272default:default8@Z8-1849
œ
%s*synth2Œ
xStarting RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 231.070 ; gain = 104.434
2default:default
Ï
synthesizing module '%s'638*oasys2#
rxMapleBus_v1_02default:default2\
Fc:/users/me/projects/zynq/ip_repo/rxmaplebus_1.0/hdl/rxMapleBus_v1_0.v2default:default2
42default:default8@Z8-638
d
%s*synth2U
A	Parameter C_S_AXI_CRTL_DATA_WIDTH bound to: 32 - type: integer 
2default:default
c
%s*synth2T
@	Parameter C_S_AXI_CRTL_ADDR_WIDTH bound to: 5 - type: integer 
2default:default
^
%s*synth2O
;	Parameter C_AXIS_TDATA_WIDTH bound to: 8 - type: integer 
2default:default
å
synthesizing module '%s'638*oasys2.
rxMapleBus_v1_0_S_AXI_CRTL2default:default2g
Qc:/users/me/projects/zynq/ip_repo/rxmaplebus_1.0/hdl/rxMapleBus_v1_0_S_AXI_CRTL.v2default:default2
42default:default8@Z8-638
_
%s*synth2P
<	Parameter C_S_AXI_DATA_WIDTH bound to: 32 - type: integer 
2default:default
^
%s*synth2O
;	Parameter C_S_AXI_ADDR_WIDTH bound to: 5 - type: integer 
2default:default
^
%s*synth2O
;	Parameter C_DATA_COUNTWIDTH bound to: 11 - type: integer 
2default:default
T
%s*synth2E
1	Parameter ADDR_LSB bound to: 2 - type: integer 
2default:default
]
%s*synth2N
:	Parameter OPT_MEM_ADDR_BITS bound to: 2 - type: integer 
2default:default
º
default block is never used226*oasys2g
Qc:/users/me/projects/zynq/ip_repo/rxmaplebus_1.0/hdl/rxMapleBus_v1_0_S_AXI_CRTL.v2default:default2
4102default:default8@Z8-226
 
%done synthesizing module '%s' (%s#%s)256*oasys2.
rxMapleBus_v1_0_S_AXI_CRTL2default:default2
12default:default2
12default:default2g
Qc:/users/me/projects/zynq/ip_repo/rxmaplebus_1.0/hdl/rxMapleBus_v1_0_S_AXI_CRTL.v2default:default2
42default:default8@Z8-256
ˆ
synthesizing module '%s'638*oasys2$
fifo_generator_02default:default2“
}c:/Users/me/Projects/Zynq/ip_repo/edit_rxMapleBus_v1_0.runs/synth_1/.Xil/Vivado-10724-speedy/realtime/fifo_generator_0_stub.v2default:default2
72default:default8@Z8-638
Ã
%done synthesizing module '%s' (%s#%s)256*oasys2$
fifo_generator_02default:default2
22default:default2
12default:default2“
}c:/Users/me/Projects/Zynq/ip_repo/edit_rxMapleBus_v1_0.runs/synth_1/.Xil/Vivado-10724-speedy/realtime/fifo_generator_0_stub.v2default:default2
72default:default8@Z8-256
Š
%done synthesizing module '%s' (%s#%s)256*oasys2#
rxMapleBus_v1_02default:default2
32default:default2
12default:default2\
Fc:/users/me/projects/zynq/ip_repo/rxmaplebus_1.0/hdl/rxMapleBus_v1_0.v2default:default2
42default:default8@Z8-256
œ
%s*synth2Œ
xFinished RTL Elaboration : Time (s): cpu = 00:00:10 ; elapsed = 00:00:10 . Memory (MB): peak = 249.035 ; gain = 122.398
2default:default
;
%s*synth2,

Report Check Netlist: 
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
–
Loading clock regions from %s
13*device2_
KC:/Xilinx/Vivado/2014.1/data\parts/xilinx/zynq/zynq/xc7z010/ClockRegion.xml2default:defaultZ21-13
—
Loading clock buffers from %s
11*device2`
LC:/Xilinx/Vivado/2014.1/data\parts/xilinx/zynq/zynq/xc7z010/ClockBuffers.xml2default:defaultZ21-11
—
&Loading clock placement rules from %s
318*place2W
CC:/Xilinx/Vivado/2014.1/data/parts/xilinx/zynq/ClockPlacerRules.xml2default:defaultZ30-318
•
)Loading package pin functions from %s...
17*device2S
?C:/Xilinx/Vivado/2014.1/data\parts/xilinx/zynq/PinFunctions.xml2default:defaultZ21-17
“
Loading package from %s
16*device2b
NC:/Xilinx/Vivado/2014.1/data\parts/xilinx/zynq/zynq/xc7z010/clg400/Package.xml2default:defaultZ21-16
Š
Loading io standards from %s
15*device2T
@C:/Xilinx/Vivado/2014.1/data\./parts/xilinx/zynq/IOStandards.xml2default:defaultZ21-15
5

Processing XDC Constraints
244*projectZ1-262

Parsing XDC File [%s]
179*designutils2g
Sc:/Users/me/Projects/Zynq/ip_repo/edit_rxMapleBus_v1_0.runs/synth_1/dont_buffer.xdc2default:defaultZ20-179
¦
Finished Parsing XDC File [%s]
178*designutils2g
Sc:/Users/me/Projects/Zynq/ip_repo/edit_rxMapleBus_v1_0.runs/synth_1/dont_buffer.xdc2default:defaultZ20-178
?
&Completed Processing XDC Constraints

245*projectZ1-263
u
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111
±
%s*synth2¡
ŒFinished Loading Part and Timing Information : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 450.730 ; gain = 324.094
2default:default
µ
%s*synth2¥
Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 450.730 ; gain = 324.094
2default:default

%s*synth2
yFinished RTL Optimization : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 450.730 ; gain = 324.094
2default:default
<
%s*synth2-

Report RTL Partitions: 
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
+| |RTL Partition |Replication |Instances |
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
N
%s*synth2?
++-+--------------+------------+----------+
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
4
%s*synth2%
+---Registers : 
2default:default
Q
%s*synth2B
.	               32 Bit    Registers := 8     
2default:default
Q
%s*synth2B
.	                5 Bit    Registers := 2     
2default:default
Q
%s*synth2B
.	                2 Bit    Registers := 2     
2default:default
Q
%s*synth2B
.	                1 Bit    Registers := 5     
2default:default
0
%s*synth2!
+---Muxes : 
2default:default
Q
%s*synth2B
.	   8 Input     32 Bit        Muxes := 7     
2default:default
Q
%s*synth2B
.	   2 Input     32 Bit        Muxes := 7     
2default:default
Q
%s*synth2B
.	   2 Input      1 Bit        Muxes := 6     
2default:default
F
%s*synth27
#Hierarchical RTL Component report 
2default:default
;
%s*synth2,
Module rxMapleBus_v1_0 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
F
%s*synth27
#Module rxMapleBus_v1_0_S_AXI_CRTL 
2default:default
B
%s*synth23
Detailed RTL Component Info : 
2default:default
4
%s*synth2%
+---Registers : 
2default:default
Q
%s*synth2B
.	               32 Bit    Registers := 8     
2default:default
Q
%s*synth2B
.	                5 Bit    Registers := 2     
2default:default
Q
%s*synth2B
.	                2 Bit    Registers := 2     
2default:default
Q
%s*synth2B
.	                1 Bit    Registers := 5     
2default:default
0
%s*synth2!
+---Muxes : 
2default:default
Q
%s*synth2B
.	   2 Input     32 Bit        Muxes := 7     
2default:default
Q
%s*synth2B
.	   8 Input     32 Bit        Muxes := 7     
2default:default
Q
%s*synth2B
.	   2 Input      1 Bit        Muxes := 6     
2default:default
y
%s*synth2j
VPart Resources:
DSPs: 80 (col length:40)
BRAMs: 120 (col length: RAMB18 40 RAMB36 20)
2default:default
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_awaddr_reg[1] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_awaddr_reg[0] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_araddr_reg[1] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_araddr_reg[0] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_araddr_reg[1] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_araddr_reg[0] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_awaddr_reg[1] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ì
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2G
3\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_awaddr_reg[0] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_awaddr[1]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_awaddr[0]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_awprot[2]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_awprot[1]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_awprot[0]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_araddr[1]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_araddr[0]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_arprot[2]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_arprot[1]2default:defaultZ8-3331
‰
!design %s has unconnected port %s3331*oasys2#
rxMapleBus_v1_02default:default2(
s_axi_crtl_arprot[0]2default:defaultZ8-3331
©
%s*synth2™
„Finished Cross Boundary Optimization : Time (s): cpu = 00:00:46 ; elapsed = 00:00:48 . Memory (MB): peak = 538.430 ; gain = 411.793
2default:default
¢
%s*synth2’
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¦
%s*synth2–
---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
®
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2F
2\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_rresp_reg[1] 2default:defaultZ8-3333
®
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default2F
2\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_bresp_reg[1] 2default:defaultZ8-3333
Ë
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2F
2\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_bresp_reg[1] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ë
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2F
2\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_bresp_reg[0] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ë
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2F
2\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_rresp_reg[1] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
Ë
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2F
2\rxMapleBus_v1_0_S_AXI_CRTL_inst/axi_rresp_reg[0] 2default:default2#
rxMapleBus_v1_02default:defaultZ8-3332
ž
%s*synth2Ž
zFinished Area Optimization : Time (s): cpu = 00:00:47 ; elapsed = 00:00:49 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
­
%s*synth2
ˆFinished Applying XDC Timing Constraints : Time (s): cpu = 00:00:47 ; elapsed = 00:00:50 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
 
%s*synth2
|Finished Timing Optimization : Time (s): cpu = 00:00:47 ; elapsed = 00:00:50 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
Ÿ
%s*synth2
{Finished Technology Mapping : Time (s): cpu = 00:00:48 ; elapsed = 00:00:50 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
™
%s*synth2‰
uFinished IO Insertion : Time (s): cpu = 00:00:48 ; elapsed = 00:00:51 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
;
%s*synth2,

Report Check Netlist: 
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
l
%s*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:default
l
%s*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:default
ª
%s*synth2š
…Finished Renaming Generated Instances : Time (s): cpu = 00:00:48 ; elapsed = 00:00:51 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
§
%s*synth2—
‚Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
¢
%s*synth2’
~---------------------------------------------------------------------------------
Start RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
¦
%s*synth2–
---------------------------------------------------------------------------------
Finished RAM, DSP and Shift Register Reporting
2default:default
u
%s*synth2f
R---------------------------------------------------------------------------------
2default:default
8
%s*synth2)

Report BlackBoxes: 
2default:default
I
%s*synth2:
&+------+-----------------+----------+
2default:default
I
%s*synth2:
&|      |BlackBox name    |Instances |
2default:default
I
%s*synth2:
&+------+-----------------+----------+
2default:default
I
%s*synth2:
&|1     |fifo_generator_0 |         2|
2default:default
I
%s*synth2:
&+------+-----------------+----------+
2default:default
8
%s*synth2)

Report Cell Usage: 
2default:default
H
%s*synth29
%+------+--------------------+------+
2default:default
H
%s*synth29
%|      |Cell                |Count |
2default:default
H
%s*synth29
%+------+--------------------+------+
2default:default
H
%s*synth29
%|1     |fifo_generator_0    |     1|
2default:default
H
%s*synth29
%|2     |fifo_generator_0__1 |     1|
2default:default
H
%s*synth29
%|3     |LUT1                |     1|
2default:default
H
%s*synth29
%|4     |LUT2                |     1|
2default:default
H
%s*synth29
%|5     |LUT3                |     2|
2default:default
H
%s*synth29
%|6     |LUT4                |     6|
2default:default
H
%s*synth29
%|7     |LUT5                |    42|
2default:default
H
%s*synth29
%|8     |LUT6                |    55|
2default:default
H
%s*synth29
%|9     |MUXF7               |    32|
2default:default
H
%s*synth29
%|10    |FDRE                |   267|
2default:default
H
%s*synth29
%|11    |IBUF                |    47|
2default:default
H
%s*synth29
%|12    |OBUF                |    41|
2default:default
H
%s*synth29
%+------+--------------------+------+
2default:default
<
%s*synth2-

Report Instance Areas: 
2default:default
r
%s*synth2c
O+------+----------------------------------+---------------------------+------+
2default:default
r
%s*synth2c
O|      |Instance                          |Module                     |Cells |
2default:default
r
%s*synth2c
O+------+----------------------------------+---------------------------+------+
2default:default
r
%s*synth2c
O|1     |top                               |                           |   586|
2default:default
r
%s*synth2c
O|2     |  rxMapleBus_v1_0_S_AXI_CRTL_inst |rxMapleBus_v1_0_S_AXI_CRTL |   406|
2default:default
r
%s*synth2c
O+------+----------------------------------+---------------------------+------+
2default:default
¦
%s*synth2–
Finished Writing Synthesis Report : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
j
%s*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 22 warnings.
2default:default
£
%s*synth2“
Synthesis Optimization Complete : Time (s): cpu = 00:00:49 ; elapsed = 00:00:51 . Memory (MB): peak = 561.484 ; gain = 434.848
2default:default
]
-Analyzing %s Unisim elements for replacement
17*netlist2
472default:defaultZ29-17
a
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28
^
1Inserted %s IBUFs to IO ports without IO buffers.100*opt2
02default:defaultZ31-140
^
1Inserted %s OBUFs to IO ports without IO buffers.101*opt2
02default:defaultZ31-141
C
Pushed %s inverter(s).
98*opt2
02default:defaultZ31-138
u
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111
L
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83
¾
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
182default:default2
242default:default2
02default:default2
02default:defaultZ4-41
U
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42
ü
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:482default:default2
00:00:512default:default2
561.4842default:default2
385.9572default:defaultZ17-268

sreport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.038 . Memory (MB): peak = 561.484 ; gain = 0.000
*common
w
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat May 31 09:18:33 20142default:defaultZ17-206