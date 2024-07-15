# VERSION 202212

## Cell
202212######################################
Add：【BER_simu】-【Checker_9x9】/【Checker_21】
Add：【BER_simu】-【202212-*】
2021########################################
Add：【BER_simu】-【BERtbNew-8x32】
Add：【BER_simu】-【array-8x32】
Add：【BER_simu】-【BERtbNew-4x64】
Add：【BER_simu】-【array-4x64】
Add：【BER_simu】-【BERtbNew-mosaic_7x54】
Add：【BER_simu】-【array-mosaic_7x54】

# VERSION 20210424

## Cell

库中文件有过多次不同时间的改动，未经整理，包含大量无用的旧cell，这些cell已被废弃，或是包含错误，或是仅用于debug，因此不应当被再次使用。

可用的cell如下：

- 【BER_simu】-【BERtbNew-16x16】：普通16x16阵列的顶层设计，包含一个BER模块，可用于仿真BER和传输功耗。部分参数：（1）TSV阵列的输出负载电容在【BER_simu】-【Checker_1】中指定；（2）BER的检查参数在【BER_ahdlLib】-【BER_ahdl_BER】中指定，其中tstart、tperiod、vtrans分别为检查的初始时刻、相邻两次检查的间距时刻、逻辑1的最低电平值。
- 【BER_simu】-【BERtbNew-mosaic_19x19】：Mosaic-3C1S 19x19阵列的顶层设计，包含一个BER模块，可用于仿真BER和传输功耗。部分参数：（1）TSV阵列的输出负载电容在【BER_simu】-【Checker_1】中指定；（2）BER的检查参数在【BER_ahdlLib】-【BER_ahdl_BER】中指定，其中tstart、tperiod、vtrans分别为检查的初始时刻、相邻两次检查的间距时刻、逻辑1的最低电平值。
- 【BER_simu】-【array-16x16】：16x16普通TSV阵列。
- 【BER_simu】-【array-mosaic_19x19】：19x19 Mosaic-3C1S TSV阵列。
- 【tsv_simu】-【mis-tsv*】：单个TSV的模型。包括【mis-tsv】/【mis-tsv_a】/【mis-tsv_w】/【mis-tsv_d】/【mis-tsv_s】/【mis-tsv_aw】/【mis-tsv_dw】/【mis-tsv_ds】/【mis-tsv_as】/【mis-tsv_2】/【mis-tsv_2x】/【mis-tsv_1】/【mis-tsv_1x】。它们的区别在于，与【mis-tsv】相比，其余模型缺少了一个或几个方向的连接。
- 【tsv_simu】-【adjancent】：直接相邻TSV件的耦合电容模型。
- 【tsv_simu】-【diagonal_2x2】：2组对角相邻TSV之间（即左上-右下，与左下-右上）的耦合电容模型。
- 【tsv_simu】-【diag】：对角相邻TSV之间的耦合电容模型。
- 【BER_simu】-【Checker_16x16】/【Checker_9x9】/【Checker_21】：256/81/21个BER检查器，包含256/81/21个【Checker_1】。
- 【BER_simu】-【Checker_280】：280个BER检查器，包含280个【Checker_1】。
- 【BER_simu】-【Checker_1】：BER检查器。A输入端有一个电容。功能由【BER-ahdl_BER】实现。
- 【BER_ahdlLib】-【BER_ahdl_BER】：BER检查器的verilog-A描述，BER的功能由其实现。其中tstart、tperiod、vtrans分别为检查的初始时刻、相邻两次检查的间距时刻、逻辑1的最低电平值。
- 【tsv_simu】-【tsv_arraynoff_3x3*】：用于仿真信号延迟的设计。包含【tsv_arraynoff_3x3】/【tsv_arraynoff_3x3_Mosaic_a】/【tsv_arraynoff_3x3_Mosaic_b】/【tsv_arraynoff_3x3_Mosaic_edge1】/【tsv_arraynoff_3x3_Mosaic_edge2】，分别用于仿真普通阵列中的TSV、Mosaic-3C1S编码区中的TSV A、Mosaic-3C1S编码区中的TSV B&C、Mosaic-3C1S非编码区中的一种TSV 、Mosaic-3C1非S编码区中的另一种TSV。
- 【BER_simu】-【202212-*】：BER Simu for DyMFNS



## 注意

#### 解压压缩包

请不要在Windows中解压tar，tar.gz或tar.bz2压缩包！请在Linux中解压到Linux文件系统中！

#### 请使用root账户

否则可能会出现权限问题。

#### 更换信号频率时

涉及到的改动：VCD文件的单位时间、【BER_ahdl_BER】模块中的BER检查参数、仿真时长。

#### 运行仿真时

仿真生成的文件占用空间较大。注意确保仿真文件目录具有足够的可用空间。

#### VDD

VDD为1.2V。若需要更改，涉及到的需要修改的地方包括但不限于：使用到的Cell中存在的VDD电压、VCD描述文件、【BER_ahdl_BER】中的vtrans参数，等等。

#### 如何使用EXCEL快速统计BER结果

将输出报告中BER的部分复制到空文本文件中，将逗号视为分隔符，通过“替换”功能去除所需数据前面的文字。然后使用excel的“数据”-“从文本/CSV”功能去除空行并分割列。
