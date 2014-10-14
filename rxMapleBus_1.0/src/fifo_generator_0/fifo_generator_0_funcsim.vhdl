-- Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2014.2 (lin64) Build 932637 Wed Jun 11 13:08:52 MDT 2014
-- Date        : Tue Oct 14 10:45:20 2014
-- Host        : aida-ipod.ad.ismell.org running 64-bit CentOS Linux release 7.0.1406 (Core)
-- Command     : write_vhdl -force -mode funcsim
--               /home/me/Projects/ip_repo/rxMapleBus_1.0/src/fifo_generator_0/fifo_generator_0_funcsim.vhdl
-- Design      : fifo_generator_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_blk_mem_gen_prim_wrapper is
  port (
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_blk_mem_gen_prim_wrapper : entity is "blk_mem_gen_prim_wrapper";
end fifo_generator_0_blk_mem_gen_prim_wrapper;

architecture STRUCTURE of fifo_generator_0_blk_mem_gen_prim_wrapper is
  signal \n_52_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \n_53_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \n_54_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \n_60_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \n_61_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \n_74_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \n_75_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute box_type : string;
  attribute box_type of \DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\ : label is "PRIMITIVE";
begin
\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\: unisim.vcomponents.RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => false,
      EN_ECC_WRITE => false,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      IS_CLKARDCLK_INVERTED => '0',
      IS_CLKBWRCLK_INVERTED => '0',
      IS_ENARDEN_INVERTED => '0',
      IS_ENBWREN_INVERTED => '0',
      IS_RSTRAMARSTRAM_INVERTED => '0',
      IS_RSTRAMB_INVERTED => '0',
      IS_RSTREGARSTREG_INVERTED => '0',
      IS_RSTREGB_INVERTED => '0',
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
    port map (
      ADDRARDADDR(15) => '1',
      ADDRARDADDR(14 downto 4) => O3(10 downto 0),
      ADDRARDADDR(3) => '1',
      ADDRARDADDR(2) => '1',
      ADDRARDADDR(1) => '1',
      ADDRARDADDR(0) => '1',
      ADDRBWRADDR(15) => '1',
      ADDRBWRADDR(14 downto 4) => O2(10 downto 0),
      ADDRBWRADDR(3) => '1',
      ADDRBWRADDR(2) => '1',
      ADDRBWRADDR(1) => '1',
      ADDRBWRADDR(0) => '1',
      CASCADEINA => '0',
      CASCADEINB => '0',
      CASCADEOUTA => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED\,
      CASCADEOUTB => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED\,
      CLKARDCLK => s_aclk,
      CLKBWRCLK => s_aclk,
      DBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED\,
      DIADI(31) => '0',
      DIADI(30) => '0',
      DIADI(29) => '0',
      DIADI(28) => '0',
      DIADI(27) => '0',
      DIADI(26) => '0',
      DIADI(25) => '0',
      DIADI(24) => '0',
      DIADI(23) => '0',
      DIADI(22) => '0',
      DIADI(21) => '0',
      DIADI(20) => '0',
      DIADI(19) => '0',
      DIADI(18) => '0',
      DIADI(17) => '0',
      DIADI(16) => '0',
      DIADI(15) => '0',
      DIADI(14) => '0',
      DIADI(13) => '0',
      DIADI(12 downto 8) => DIADI(10 downto 6),
      DIADI(7) => '0',
      DIADI(6) => '0',
      DIADI(5 downto 0) => DIADI(5 downto 0),
      DIBDI(31) => '0',
      DIBDI(30) => '0',
      DIBDI(29) => '0',
      DIBDI(28) => '0',
      DIBDI(27) => '0',
      DIBDI(26) => '0',
      DIBDI(25) => '0',
      DIBDI(24) => '0',
      DIBDI(23) => '0',
      DIBDI(22) => '0',
      DIBDI(21) => '0',
      DIBDI(20) => '0',
      DIBDI(19) => '0',
      DIBDI(18) => '0',
      DIBDI(17) => '0',
      DIBDI(16) => '0',
      DIBDI(15) => '0',
      DIBDI(14) => '0',
      DIBDI(13) => '0',
      DIBDI(12) => '0',
      DIBDI(11) => '0',
      DIBDI(10) => '0',
      DIBDI(9) => '0',
      DIBDI(8) => '0',
      DIBDI(7) => '0',
      DIBDI(6) => '0',
      DIBDI(5) => '0',
      DIBDI(4) => '0',
      DIBDI(3) => '0',
      DIBDI(2) => '0',
      DIBDI(1) => '0',
      DIBDI(0) => '0',
      DIPADIP(3) => '0',
      DIPADIP(2) => '0',
      DIPADIP(1) => '0',
      DIPADIP(0) => '0',
      DIPBDIP(3) => '0',
      DIPBDIP(2) => '0',
      DIPBDIP(1) => '0',
      DIPBDIP(0) => '0',
      DOADO(31 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED\(31 downto 0),
      DOBDO(31 downto 16) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED\(31 downto 16),
      DOBDO(15) => \n_52_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      DOBDO(14) => \n_53_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      DOBDO(13) => \n_54_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      DOBDO(12 downto 8) => D(10 downto 6),
      DOBDO(7) => \n_60_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      DOBDO(6) => \n_61_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      DOBDO(5 downto 0) => D(5 downto 0),
      DOPADOP(3 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED\(3 downto 0),
      DOPBDOP(3 downto 2) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED\(3 downto 2),
      DOPBDOP(1) => \n_74_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      DOPBDOP(0) => \n_75_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram\,
      ECCPARITY(7 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED\(7 downto 0),
      ENARDEN => WEA(0),
      ENBWREN => I1,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED\,
      WEA(3) => WEA(0),
      WEA(2) => WEA(0),
      WEA(1) => WEA(0),
      WEA(0) => WEA(0),
      WEBWE(7) => '0',
      WEBWE(6) => '0',
      WEBWE(5) => '0',
      WEBWE(4) => '0',
      WEBWE(3) => '0',
      WEBWE(2) => '0',
      WEBWE(1) => '0',
      WEBWE(0) => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_compare is
  port (
    comp0 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_compare : entity is "compare";
end fifo_generator_0_compare;

architecture STRUCTURE of fifo_generator_0_compare is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => comp0,
      CO(0) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 2),
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 2),
      S(1) => I1,
      S(0) => v1_reg(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_compare_0 is
  port (
    comp1 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_compare_0 : entity is "compare";
end fifo_generator_0_compare_0;

architecture STRUCTURE of fifo_generator_0_compare_0 is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => comp1,
      CO(0) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 2),
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 2),
      S(1) => I2,
      S(0) => v1_reg_0(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_compare_1 is
  port (
    p_0_in : out STD_LOGIC;
    v1_reg_1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I3 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_compare_1 : entity is "compare";
end fifo_generator_0_compare_1;

architecture STRUCTURE of fifo_generator_0_compare_1 is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_1(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => p_0_in,
      CO(0) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 2),
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 2),
      S(1) => I3,
      S(0) => v1_reg_1(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_compare_2 is
  port (
    comp0 : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_compare_2 : entity is "compare";
end fifo_generator_0_compare_2;

architecture STRUCTURE of fifo_generator_0_compare_2 is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => comp0,
      CO(0) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 2),
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 2),
      S(1) => I1,
      S(0) => v1_reg(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_compare_3 is
  port (
    comp1 : out STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I2 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_compare_3 : entity is "compare";
end fifo_generator_0_compare_3;

architecture STRUCTURE of fifo_generator_0_compare_3 is
  signal \n_0_gmux.gm[3].gms.ms\ : STD_LOGIC;
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gmux.gm[0].gm1.m1_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type : string;
  attribute box_type of \gmux.gm[0].gm1.m1_CARRY4\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM of \gmux.gm[4].gms.ms_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute box_type of \gmux.gm[4].gms.ms_CARRY4\ : label is "PRIMITIVE";
begin
\gmux.gm[0].gm1.m1_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gmux.gm[3].gms.ms\,
      CO(2 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_CO_UNCONNECTED\(2 downto 0),
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[0].gm1.m1_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 0) => v1_reg_0(3 downto 0)
    );
\gmux.gm[4].gms.ms_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gmux.gm[3].gms.ms\,
      CO(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => comp1,
      CO(0) => \NLW_gmux.gm[4].gms.ms_CARRY4_CO_UNCONNECTED\(0),
      CYINIT => '0',
      DI(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_DI_UNCONNECTED\(3 downto 2),
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gmux.gm[4].gms.ms_CARRY4_O_UNCONNECTED\(3 downto 0),
      S(3 downto 2) => \NLW_gmux.gm[4].gms.ms_CARRY4_S_UNCONNECTED\(3 downto 2),
      S(1) => I2,
      S(0) => v1_reg_0(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_rd_bin_cntr is
  port (
    O1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    p_2_out : out STD_LOGIC;
    ram_full_comb : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O7 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    p_0_in : in STD_LOGIC;
    rst_full_gen_i : in STD_LOGIC;
    axis_almost_full : in STD_LOGIC;
    I9 : in STD_LOGIC;
    p_14_out : in STD_LOGIC;
    comp1 : in STD_LOGIC;
    p_2_out_1 : in STD_LOGIC;
    comp0 : in STD_LOGIC;
    comp0_0 : in STD_LOGIC;
    p_18_out : in STD_LOGIC;
    comp1_1 : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_rd_bin_cntr : entity is "rd_bin_cntr";
end fifo_generator_0_rd_bin_cntr;

architecture STRUCTURE of fifo_generator_0_rd_bin_cntr is
  signal \^o7\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \n_0_gc0.count[10]_i_2\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 10 to 10 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gc0.count[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gc0.count[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gc0.count[3]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gc0.count[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gc0.count[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \gc0.count[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \gc0.count[8]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \gc0.count[9]_i_1\ : label is "soft_lutpair2";
  attribute counter : integer;
  attribute counter of \gc0.count_reg[0]\ : label is 7;
  attribute counter of \gc0.count_reg[10]\ : label is 7;
  attribute counter of \gc0.count_reg[1]\ : label is 7;
  attribute counter of \gc0.count_reg[2]\ : label is 7;
  attribute counter of \gc0.count_reg[3]\ : label is 7;
  attribute counter of \gc0.count_reg[4]\ : label is 7;
  attribute counter of \gc0.count_reg[5]\ : label is 7;
  attribute counter of \gc0.count_reg[6]\ : label is 7;
  attribute counter of \gc0.count_reg[7]\ : label is 7;
  attribute counter of \gc0.count_reg[8]\ : label is 7;
  attribute counter of \gc0.count_reg[9]\ : label is 7;
begin
  O7(9 downto 0) <= \^o7\(9 downto 0);
  Q(10 downto 0) <= \^q\(10 downto 0);
\gaf.gaf0.ram_afull_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3000BA303030BA30"
    )
    port map (
      I0 => p_0_in,
      I1 => rst_full_gen_i,
      I2 => axis_almost_full,
      I3 => I9,
      I4 => p_14_out,
      I5 => comp1,
      O => p_2_out
    );
\gc0.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^o7\(0),
      O => plusOp(0)
    );
\gc0.count[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \^o7\(8),
      I1 => \^o7\(6),
      I2 => \n_0_gc0.count[10]_i_2\,
      I3 => \^o7\(7),
      I4 => \^o7\(9),
      I5 => rd_pntr_plus1(10),
      O => plusOp(10)
    );
\gc0.count[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => \^o7\(5),
      I1 => \^o7\(3),
      I2 => \^o7\(1),
      I3 => \^o7\(0),
      I4 => \^o7\(2),
      I5 => \^o7\(4),
      O => \n_0_gc0.count[10]_i_2\
    );
\gc0.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \^o7\(0),
      I1 => \^o7\(1),
      O => plusOp(1)
    );
\gc0.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \^o7\(0),
      I1 => \^o7\(1),
      I2 => \^o7\(2),
      O => plusOp(2)
    );
\gc0.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \^o7\(1),
      I1 => \^o7\(0),
      I2 => \^o7\(2),
      I3 => \^o7\(3),
      O => plusOp(3)
    );
\gc0.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \^o7\(2),
      I1 => \^o7\(0),
      I2 => \^o7\(1),
      I3 => \^o7\(3),
      I4 => \^o7\(4),
      O => plusOp(4)
    );
\gc0.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => \^o7\(3),
      I1 => \^o7\(1),
      I2 => \^o7\(0),
      I3 => \^o7\(2),
      I4 => \^o7\(4),
      I5 => \^o7\(5),
      O => plusOp(5)
    );
\gc0.count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_gc0.count[10]_i_2\,
      I1 => \^o7\(6),
      O => plusOp(6)
    );
\gc0.count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_0_gc0.count[10]_i_2\,
      I1 => \^o7\(6),
      I2 => \^o7\(7),
      O => plusOp(7)
    );
\gc0.count[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => \^o7\(6),
      I1 => \n_0_gc0.count[10]_i_2\,
      I2 => \^o7\(7),
      I3 => \^o7\(8),
      O => plusOp(8)
    );
\gc0.count[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => \^o7\(7),
      I1 => \n_0_gc0.count[10]_i_2\,
      I2 => \^o7\(6),
      I3 => \^o7\(8),
      I4 => \^o7\(9),
      O => plusOp(9)
    );
\gc0.count_d1_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(0),
      Q => \^q\(0)
    );
\gc0.count_d1_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => rd_pntr_plus1(10),
      Q => \^q\(10)
    );
\gc0.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(1),
      Q => \^q\(1)
    );
\gc0.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(2),
      Q => \^q\(2)
    );
\gc0.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(3),
      Q => \^q\(3)
    );
\gc0.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(4),
      Q => \^q\(4)
    );
\gc0.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(5),
      Q => \^q\(5)
    );
\gc0.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(6),
      Q => \^q\(6)
    );
\gc0.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(7),
      Q => \^q\(7)
    );
\gc0.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(8),
      Q => \^q\(8)
    );
\gc0.count_d1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => \^o7\(9),
      Q => \^q\(9)
    );
\gc0.count_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      D => plusOp(0),
      PRE => I1(0),
      Q => \^o7\(0)
    );
\gc0.count_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(10),
      Q => rd_pntr_plus1(10)
    );
\gc0.count_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(1),
      Q => \^o7\(1)
    );
\gc0.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(2),
      Q => \^o7\(2)
    );
\gc0.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(3),
      Q => \^o7\(3)
    );
\gc0.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(4),
      Q => \^o7\(4)
    );
\gc0.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(5),
      Q => \^o7\(5)
    );
\gc0.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(6),
      Q => \^o7\(6)
    );
\gc0.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(7),
      Q => \^o7\(7)
    );
\gc0.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(8),
      Q => \^o7\(8)
    );
\gc0.count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => p_14_out,
      CLR => I1(0),
      D => plusOp(9),
      Q => \^o7\(9)
    );
\gmux.gm[5].gms.ms_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(10),
      I1 => I2(0),
      O => O1
    );
\gmux.gm[5].gms.ms_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => rd_pntr_plus1(10),
      I1 => I2(0),
      O => O2
    );
\gmux.gm[5].gms.ms_i_1__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(10),
      I1 => I2(0),
      O => O4
    );
\gmux.gm[5].gms.ms_i_1__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(10),
      I1 => I3(0),
      O => O5
    );
\gmux.gm[5].gms.ms_i_1__3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => \^q\(10),
      I1 => I4(0),
      O => O6
    );
ram_empty_fb_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4444FCCC"
    )
    port map (
      I0 => comp0_0,
      I1 => p_18_out,
      I2 => p_14_out,
      I3 => comp1_1,
      I4 => I9,
      O => O3
    );
ram_full_fb_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00008F880F008F88"
    )
    port map (
      I0 => comp1,
      I1 => I9,
      I2 => rst_full_gen_i,
      I3 => p_2_out_1,
      I4 => p_14_out,
      I5 => comp0,
      O => ram_full_comb
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_rd_fwft is
  port (
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O7 : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O15 : out STD_LOGIC;
    O26 : out STD_LOGIC;
    p_14_out : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    p_18_out : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    ram_full_i : in STD_LOGIC;
    axis_data_count : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_almost_full : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_wr_eop_d1 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    lopt : in STD_LOGIC;
    lopt_1 : out STD_LOGIC;
    lopt_2 : in STD_LOGIC;
    lopt_3 : in STD_LOGIC;
    lopt_4 : out STD_LOGIC;
    lopt_5 : in STD_LOGIC;
    lopt_6 : in STD_LOGIC;
    lopt_7 : out STD_LOGIC;
    lopt_8 : in STD_LOGIC;
    lopt_9 : out STD_LOGIC;
    lopt_10 : out STD_LOGIC;
    lopt_11 : out STD_LOGIC;
    lopt_12 : out STD_LOGIC;
    lopt_13 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_rd_fwft : entity is "rd_fwft";
end fifo_generator_0_rd_fwft;

architecture STRUCTURE of fifo_generator_0_rd_fwft is
  signal \^o1\ : STD_LOGIC;
  signal \^o26\ : STD_LOGIC;
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 0 to 0 );
  signal empty_fwft_fb : STD_LOGIC;
  signal empty_fwft_i0 : STD_LOGIC;
  signal \^lopt_1\ : STD_LOGIC;
  signal \^lopt_10\ : STD_LOGIC;
  signal \^lopt_11\ : STD_LOGIC;
  signal \^lopt_12\ : STD_LOGIC;
  signal \^lopt_2\ : STD_LOGIC;
  signal \^lopt_3\ : STD_LOGIC;
  signal \^lopt_4\ : STD_LOGIC;
  signal \^lopt_5\ : STD_LOGIC;
  signal \^lopt_6\ : STD_LOGIC;
  signal \^lopt_7\ : STD_LOGIC;
  signal \^lopt_8\ : STD_LOGIC;
  signal \^lopt_9\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[0]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[11]_i_4\ : STD_LOGIC;
  signal \n_0_gpregsm1.curr_fwft_state_reg[1]\ : STD_LOGIC;
  signal next_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of empty_fwft_fb_reg : label is "no";
  attribute equivalent_register_removal of empty_fwft_i_reg : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2\ : label is "soft_lutpair0";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1]_i_3_CARRY4\ : label is "LO:O";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \gpregsm1.curr_fwft_state_reg[1]\ : label is "no";
  attribute SOFT_HLUTNM of m_axis_tvalid_INST_0 : label is "soft_lutpair0";
begin
  O1 <= \^o1\;
  O26 <= \^o26\;
  \^lopt_1\ <= lopt;
  \^lopt_3\ <= lopt_2;
  \^lopt_4\ <= lopt_3;
  \^lopt_6\ <= lopt_5;
  \^lopt_7\ <= lopt_6;
  \^lopt_9\ <= lopt_8;
  \^o26\ <= lopt_13;
  lopt_1 <= \^lopt_2\;
  lopt_10 <= \^lopt_11\;
  lopt_11 <= \^lopt_12\;
  lopt_12 <= \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[11]_i_4\;
  lopt_4 <= \^lopt_5\;
  lopt_7 <= \^lopt_8\;
  lopt_9 <= \^lopt_10\;
\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000007F777777"
    )
    port map (
      I0 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I1 => curr_fwft_state(0),
      I2 => \^o1\,
      I3 => I1,
      I4 => m_axis_tready,
      I5 => p_18_out,
      O => O2
    );
empty_fwft_fb_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"ABAAAAAA22222222"
    )
    port map (
      I0 => empty_fwft_fb,
      I1 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I2 => \^o1\,
      I3 => I1,
      I4 => m_axis_tready,
      I5 => curr_fwft_state(0),
      O => empty_fwft_i0
    );
empty_fwft_fb_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => Q(1),
      Q => empty_fwft_fb
    );
empty_fwft_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => empty_fwft_i0,
      PRE => Q(1),
      Q => \^o1\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7777777770777070"
    )
    port map (
      I0 => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2\,
      I1 => CO(0),
      I2 => I5(0),
      I3 => \^o1\,
      I4 => axis_almost_full,
      I5 => I1,
      O => O7
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00004000"
    )
    port map (
      I0 => \^o1\,
      I1 => I1,
      I2 => m_axis_tready,
      I3 => I6(0),
      I4 => axis_wr_eop_d1,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF40FF0000BF00"
    )
    port map (
      I0 => \^o1\,
      I1 => I1,
      I2 => m_axis_tready,
      I3 => s_axis_tvalid,
      I4 => ram_full_i,
      I5 => axis_data_count(0),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[0]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000BF00FFFF40FF"
    )
    port map (
      I0 => \^o1\,
      I1 => I1,
      I2 => m_axis_tready,
      I3 => s_axis_tvalid,
      I4 => ram_full_i,
      I5 => axis_data_count(1),
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[11]_i_4\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \^lopt_8\,
      CO(2) => \^lopt_5\,
      CO(1) => \^lopt_2\,
      CO(0) => O8,
      CYINIT => I7,
      DI(3) => \^lopt_7\,
      DI(2) => \^lopt_4\,
      DI(1) => \^lopt_1\,
      DI(0) => axis_data_count(0),
      O(3) => \^lopt_12\,
      O(2) => \^lopt_11\,
      O(1) => \^lopt_10\,
      O(0) => O15,
      S(3) => \^lopt_9\,
      S(2) => \^lopt_6\,
      S(1) => \^lopt_3\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[0]_i_2\
    );
\gc0.count_d1[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008FFFFFF"
    )
    port map (
      I0 => m_axis_tready,
      I1 => I1,
      I2 => \^o1\,
      I3 => curr_fwft_state(0),
      I4 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I5 => p_18_out,
      O => p_14_out
    );
\goreg_bm.dout_i[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008FF0000"
    )
    port map (
      I0 => m_axis_tready,
      I1 => I1,
      I2 => \^o1\,
      I3 => curr_fwft_state(0),
      I4 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I5 => Q(0),
      O => E(0)
    );
\gpregsm1.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFAAAA"
    )
    port map (
      I0 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I1 => \^o1\,
      I2 => I1,
      I3 => m_axis_tready,
      I4 => curr_fwft_state(0),
      O => next_fwft_state(0)
    );
\gpregsm1.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7000000FFFFFFFF"
    )
    port map (
      I0 => m_axis_tready,
      I1 => I1,
      I2 => \^o1\,
      I3 => curr_fwft_state(0),
      I4 => \n_0_gpregsm1.curr_fwft_state_reg[1]\,
      I5 => p_18_out,
      O => next_fwft_state(1)
    );
\gpregsm1.curr_fwft_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => Q(1),
      D => next_fwft_state(0),
      Q => curr_fwft_state(0)
    );
\gpregsm1.curr_fwft_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => Q(1),
      D => next_fwft_state(1),
      Q => \n_0_gpregsm1.curr_fwft_state_reg[1]\
    );
m_axis_tvalid_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => I1,
      I1 => \^o1\,
      O => m_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_reset_blk_ramfifo is
  port (
    O1 : out STD_LOGIC;
    rst_full_gen_i : out STD_LOGIC;
    AR : out STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d2 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_reset_blk_ramfifo : entity is "reset_blk_ramfifo";
end fifo_generator_0_reset_blk_ramfifo;

architecture STRUCTURE of fifo_generator_0_reset_blk_ramfifo is
  signal \^o1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\ : STD_LOGIC;
  signal \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\ : STD_LOGIC;
  signal rd_rst_asreg : STD_LOGIC;
  signal rd_rst_asreg_d1 : STD_LOGIC;
  signal rd_rst_asreg_d2 : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal \^rst_d2\ : STD_LOGIC;
  signal rst_d3 : STD_LOGIC;
  signal wr_rst_asreg : STD_LOGIC;
  signal wr_rst_asreg_d1 : STD_LOGIC;
  signal wr_rst_asreg_d2 : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is std.standard.true;
  attribute msgon : string;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d1_reg\ : label is "true";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is std.standard.true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d2_reg\ : label is "true";
  attribute ASYNC_REG of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is std.standard.true;
  attribute msgon of \grstd1.grst_full.grst_f.rst_d3_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\ : label is "true";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\ : label is "no";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\ : label is "no";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\ : label is "true";
  attribute ASYNC_REG of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is std.standard.true;
  attribute msgon of \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\ : label is "true";
  attribute equivalent_register_removal of \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\ : label is "no";
begin
  O1 <= \^o1\;
  rst_d2 <= \^rst_d2\;
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[11]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => s_aresetn,
      O => \^o1\
    );
\grstd1.grst_full.grst_f.RST_FULL_GEN_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => \^o1\,
      D => rst_d3,
      Q => rst_full_gen_i
    );
\grstd1.grst_full.grst_f.rst_d1_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => \^o1\,
      Q => rst_d1
    );
\grstd1.grst_full.grst_f.rst_d2_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => rst_d1,
      PRE => \^o1\,
      Q => \^rst_d2\
    );
\grstd1.grst_full.grst_f.rst_d3_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => \^rst_d2\,
      PRE => \^o1\,
      Q => rst_d3
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => rd_rst_asreg,
      Q => rd_rst_asreg_d1,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => rd_rst_asreg_d1,
      Q => rd_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.rd_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => s_aclk,
      CE => rd_rst_asreg_d1,
      D => '0',
      PRE => \^o1\,
      Q => rd_rst_asreg
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_rst_asreg,
      I1 => rd_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => Q(0)
    );
\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1\,
      Q => Q(1)
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d1_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => wr_rst_asreg,
      Q => wr_rst_asreg_d1,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_d2_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => wr_rst_asreg_d1,
      Q => wr_rst_asreg_d2,
      R => '0'
    );
\ngwrdrst.grst.g7serrst.wr_rst_asreg_reg\: unisim.vcomponents.FDPE
    port map (
      C => s_aclk,
      CE => wr_rst_asreg_d1,
      D => '0',
      PRE => \^o1\,
      Q => wr_rst_asreg
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wr_rst_asreg,
      I1 => wr_rst_asreg_d2,
      O => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\
    );
\ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => '0',
      PRE => \n_0_ngwrdrst.grst.g7serrst.wr_rst_reg[1]_i_1\,
      Q => AR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_wr_bin_cntr is
  port (
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    v1_reg : out STD_LOGIC_VECTOR ( 4 downto 0 );
    O1 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    v1_reg_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_1 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_2 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_3 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    O4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    AR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_wr_bin_cntr : entity is "wr_bin_cntr";
end fifo_generator_0_wr_bin_cntr;

architecture STRUCTURE of fifo_generator_0_wr_bin_cntr is
  signal \^o1\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \^o4\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \n_0_gcc0.gc1.gsym.count[10]_i_2\ : STD_LOGIC;
  signal p_8_out_0 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of \gcc0.gc1.gsym.count[0]_i_1\ : label is std.standard.true;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[0]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[7]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[8]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gcc0.gc1.gsym.count[9]_i_1\ : label is "soft_lutpair7";
  attribute counter : integer;
  attribute counter of \gcc0.gc1.gsym.count_reg[0]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[10]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[1]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[2]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[3]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[4]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[5]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[6]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[7]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[8]\ : label is 8;
  attribute counter of \gcc0.gc1.gsym.count_reg[9]\ : label is 8;
begin
  O1(10 downto 0) <= \^o1\(10 downto 0);
  O4(0) <= \^o4\(0);
  Q(0) <= \^q\(0);
\gcc0.gc1.gsym.count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      O => \plusOp__0\(0)
    );
\gcc0.gc1.gsym.count[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => wr_pntr_plus2(8),
      I1 => wr_pntr_plus2(6),
      I2 => \n_0_gcc0.gc1.gsym.count[10]_i_2\,
      I3 => wr_pntr_plus2(7),
      I4 => wr_pntr_plus2(9),
      I5 => \^q\(0),
      O => \plusOp__0\(10)
    );
\gcc0.gc1.gsym.count[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => wr_pntr_plus2(5),
      I1 => wr_pntr_plus2(3),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(0),
      I4 => wr_pntr_plus2(2),
      I5 => wr_pntr_plus2(4),
      O => \n_0_gcc0.gc1.gsym.count[10]_i_2\
    );
\gcc0.gc1.gsym.count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      O => \plusOp__0\(1)
    );
\gcc0.gc1.gsym.count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(2),
      O => \plusOp__0\(2)
    );
\gcc0.gc1.gsym.count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => wr_pntr_plus2(1),
      I1 => wr_pntr_plus2(0),
      I2 => wr_pntr_plus2(2),
      I3 => wr_pntr_plus2(3),
      O => \plusOp__0\(3)
    );
\gcc0.gc1.gsym.count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => wr_pntr_plus2(2),
      I1 => wr_pntr_plus2(0),
      I2 => wr_pntr_plus2(1),
      I3 => wr_pntr_plus2(3),
      I4 => wr_pntr_plus2(4),
      O => \plusOp__0\(4)
    );
\gcc0.gc1.gsym.count[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
    port map (
      I0 => wr_pntr_plus2(3),
      I1 => wr_pntr_plus2(1),
      I2 => wr_pntr_plus2(0),
      I3 => wr_pntr_plus2(2),
      I4 => wr_pntr_plus2(4),
      I5 => wr_pntr_plus2(5),
      O => \plusOp__0\(5)
    );
\gcc0.gc1.gsym.count[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => \n_0_gcc0.gc1.gsym.count[10]_i_2\,
      I1 => wr_pntr_plus2(6),
      O => \plusOp__0\(6)
    );
\gcc0.gc1.gsym.count[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
    port map (
      I0 => \n_0_gcc0.gc1.gsym.count[10]_i_2\,
      I1 => wr_pntr_plus2(6),
      I2 => wr_pntr_plus2(7),
      O => \plusOp__0\(7)
    );
\gcc0.gc1.gsym.count[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
    port map (
      I0 => wr_pntr_plus2(6),
      I1 => \n_0_gcc0.gc1.gsym.count[10]_i_2\,
      I2 => wr_pntr_plus2(7),
      I3 => wr_pntr_plus2(8),
      O => \plusOp__0\(8)
    );
\gcc0.gc1.gsym.count[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
    port map (
      I0 => wr_pntr_plus2(7),
      I1 => \n_0_gcc0.gc1.gsym.count[10]_i_2\,
      I2 => wr_pntr_plus2(6),
      I3 => wr_pntr_plus2(8),
      I4 => wr_pntr_plus2(9),
      O => \plusOp__0\(9)
    );
\gcc0.gc1.gsym.count_d1_reg[0]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => wr_pntr_plus2(0),
      PRE => AR(0),
      Q => p_8_out_0(0)
    );
\gcc0.gc1.gsym.count_d1_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \^q\(0),
      Q => \^o4\(0)
    );
\gcc0.gc1.gsym.count_d1_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(1),
      Q => p_8_out_0(1)
    );
\gcc0.gc1.gsym.count_d1_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(2),
      Q => p_8_out_0(2)
    );
\gcc0.gc1.gsym.count_d1_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(3),
      Q => p_8_out_0(3)
    );
\gcc0.gc1.gsym.count_d1_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(4),
      Q => p_8_out_0(4)
    );
\gcc0.gc1.gsym.count_d1_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(5),
      Q => p_8_out_0(5)
    );
\gcc0.gc1.gsym.count_d1_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(6),
      Q => p_8_out_0(6)
    );
\gcc0.gc1.gsym.count_d1_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(7),
      Q => p_8_out_0(7)
    );
\gcc0.gc1.gsym.count_d1_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(8),
      Q => p_8_out_0(8)
    );
\gcc0.gc1.gsym.count_d1_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => wr_pntr_plus2(9),
      Q => p_8_out_0(9)
    );
\gcc0.gc1.gsym.count_d2_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(0),
      Q => \^o1\(0)
    );
\gcc0.gc1.gsym.count_d2_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \^o4\(0),
      Q => \^o1\(10)
    );
\gcc0.gc1.gsym.count_d2_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(1),
      Q => \^o1\(1)
    );
\gcc0.gc1.gsym.count_d2_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(2),
      Q => \^o1\(2)
    );
\gcc0.gc1.gsym.count_d2_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(3),
      Q => \^o1\(3)
    );
\gcc0.gc1.gsym.count_d2_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(4),
      Q => \^o1\(4)
    );
\gcc0.gc1.gsym.count_d2_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(5),
      Q => \^o1\(5)
    );
\gcc0.gc1.gsym.count_d2_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(6),
      Q => \^o1\(6)
    );
\gcc0.gc1.gsym.count_d2_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(7),
      Q => \^o1\(7)
    );
\gcc0.gc1.gsym.count_d2_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(8),
      Q => \^o1\(8)
    );
\gcc0.gc1.gsym.count_d2_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => p_8_out_0(9),
      Q => \^o1\(9)
    );
\gcc0.gc1.gsym.count_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(0),
      Q => wr_pntr_plus2(0)
    );
\gcc0.gc1.gsym.count_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(10),
      Q => \^q\(0)
    );
\gcc0.gc1.gsym.count_reg[1]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => \plusOp__0\(1),
      PRE => AR(0),
      Q => wr_pntr_plus2(1)
    );
\gcc0.gc1.gsym.count_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(2),
      Q => wr_pntr_plus2(2)
    );
\gcc0.gc1.gsym.count_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(3),
      Q => wr_pntr_plus2(3)
    );
\gcc0.gc1.gsym.count_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(4),
      Q => wr_pntr_plus2(4)
    );
\gcc0.gc1.gsym.count_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(5),
      Q => wr_pntr_plus2(5)
    );
\gcc0.gc1.gsym.count_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(6),
      Q => wr_pntr_plus2(6)
    );
\gcc0.gc1.gsym.count_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(7),
      Q => wr_pntr_plus2(7)
    );
\gcc0.gc1.gsym.count_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(8),
      Q => wr_pntr_plus2(8)
    );
\gcc0.gc1.gsym.count_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      CLR => AR(0),
      D => \plusOp__0\(9),
      Q => wr_pntr_plus2(9)
    );
\gmux.gm[0].gm1.m1_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(0),
      I1 => I6(0),
      I2 => \^o1\(1),
      I3 => I6(1),
      O => v1_reg(0)
    );
\gmux.gm[0].gm1.m1_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(0),
      I1 => I7(0),
      I2 => \^o1\(1),
      I3 => I7(1),
      O => v1_reg_0(0)
    );
\gmux.gm[0].gm1.m1_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(0),
      I1 => I6(0),
      I2 => \^o1\(1),
      I3 => I6(1),
      O => v1_reg_1(0)
    );
\gmux.gm[0].gm1.m1_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out_0(0),
      I1 => I6(0),
      I2 => p_8_out_0(1),
      I3 => I6(1),
      O => v1_reg_2(0)
    );
\gmux.gm[0].gm1.m1_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(0),
      I1 => I6(0),
      I2 => wr_pntr_plus2(1),
      I3 => I6(1),
      O => v1_reg_3(0)
    );
\gmux.gm[1].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(2),
      I1 => I6(2),
      I2 => \^o1\(3),
      I3 => I6(3),
      O => v1_reg(1)
    );
\gmux.gm[1].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(2),
      I1 => I7(2),
      I2 => \^o1\(3),
      I3 => I7(3),
      O => v1_reg_0(1)
    );
\gmux.gm[1].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(2),
      I1 => I6(2),
      I2 => \^o1\(3),
      I3 => I6(3),
      O => v1_reg_1(1)
    );
\gmux.gm[1].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out_0(2),
      I1 => I6(2),
      I2 => p_8_out_0(3),
      I3 => I6(3),
      O => v1_reg_2(1)
    );
\gmux.gm[1].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(2),
      I1 => I6(2),
      I2 => wr_pntr_plus2(3),
      I3 => I6(3),
      O => v1_reg_3(1)
    );
\gmux.gm[2].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(4),
      I1 => I6(4),
      I2 => \^o1\(5),
      I3 => I6(5),
      O => v1_reg(2)
    );
\gmux.gm[2].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(4),
      I1 => I7(4),
      I2 => \^o1\(5),
      I3 => I7(5),
      O => v1_reg_0(2)
    );
\gmux.gm[2].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(4),
      I1 => I6(4),
      I2 => \^o1\(5),
      I3 => I6(5),
      O => v1_reg_1(2)
    );
\gmux.gm[2].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out_0(4),
      I1 => I6(4),
      I2 => p_8_out_0(5),
      I3 => I6(5),
      O => v1_reg_2(2)
    );
\gmux.gm[2].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(4),
      I1 => I6(4),
      I2 => wr_pntr_plus2(5),
      I3 => I6(5),
      O => v1_reg_3(2)
    );
\gmux.gm[3].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(6),
      I1 => I6(6),
      I2 => \^o1\(7),
      I3 => I6(7),
      O => v1_reg(3)
    );
\gmux.gm[3].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(6),
      I1 => I7(6),
      I2 => \^o1\(7),
      I3 => I7(7),
      O => v1_reg_0(3)
    );
\gmux.gm[3].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(6),
      I1 => I6(6),
      I2 => \^o1\(7),
      I3 => I6(7),
      O => v1_reg_1(3)
    );
\gmux.gm[3].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out_0(6),
      I1 => I6(6),
      I2 => p_8_out_0(7),
      I3 => I6(7),
      O => v1_reg_2(3)
    );
\gmux.gm[3].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(6),
      I1 => I6(6),
      I2 => wr_pntr_plus2(7),
      I3 => I6(7),
      O => v1_reg_3(3)
    );
\gmux.gm[4].gms.ms_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(8),
      I1 => I6(8),
      I2 => \^o1\(9),
      I3 => I6(9),
      O => v1_reg(4)
    );
\gmux.gm[4].gms.ms_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(8),
      I1 => I7(8),
      I2 => \^o1\(9),
      I3 => I7(9),
      O => v1_reg_0(4)
    );
\gmux.gm[4].gms.ms_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => \^o1\(8),
      I1 => I6(8),
      I2 => \^o1\(9),
      I3 => I6(9),
      O => v1_reg_1(4)
    );
\gmux.gm[4].gms.ms_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => p_8_out_0(8),
      I1 => I6(8),
      I2 => p_8_out_0(9),
      I3 => I6(9),
      O => v1_reg_2(4)
    );
\gmux.gm[4].gms.ms_i_1__3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => wr_pntr_plus2(8),
      I1 => I6(8),
      I2 => wr_pntr_plus2(9),
      I3 => I6(9),
      O => v1_reg_3(4)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_blk_mem_gen_prim_width is
  port (
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_blk_mem_gen_prim_width : entity is "blk_mem_gen_prim_width";
end fifo_generator_0_blk_mem_gen_prim_width;

architecture STRUCTURE of fifo_generator_0_blk_mem_gen_prim_width is
begin
\prim_noinit.ram\: entity work.fifo_generator_0_blk_mem_gen_prim_wrapper
    port map (
      D(10 downto 0) => D(10 downto 0),
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => I1,
      O2(10 downto 0) => O2(10 downto 0),
      O3(10 downto 0) => O3(10 downto 0),
      WEA(0) => WEA(0),
      s_aclk => s_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_rd_status_flags_ss is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_18_out : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I1 : in STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_rd_status_flags_ss : entity is "rd_status_flags_ss";
end fifo_generator_0_rd_status_flags_ss;

architecture STRUCTURE of fifo_generator_0_rd_status_flags_ss is
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of ram_empty_fb_i_reg : label is "no";
begin
c1: entity work.fifo_generator_0_compare_2
    port map (
      I1 => I1,
      comp0 => comp0,
      v1_reg(4 downto 0) => v1_reg(4 downto 0)
    );
c2: entity work.fifo_generator_0_compare_3
    port map (
      I2 => I2,
      comp1 => comp1,
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0)
    );
ram_empty_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => I3,
      PRE => Q(0),
      Q => p_18_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_wr_status_flags_ss is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    p_2_out : out STD_LOGIC;
    axis_almost_full : out STD_LOGIC;
    O1 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O16 : out STD_LOGIC;
    O17 : out STD_LOGIC;
    O18 : out STD_LOGIC;
    O19 : out STD_LOGIC;
    O20 : out STD_LOGIC;
    O21 : out STD_LOGIC;
    O22 : out STD_LOGIC;
    O23 : out STD_LOGIC;
    O24 : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O25 : out STD_LOGIC;
    O27 : out STD_LOGIC;
    axis_wr_eop : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I1 : in STD_LOGIC;
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I2 : in STD_LOGIC;
    v1_reg_1 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    I3 : in STD_LOGIC;
    ram_full_comb : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    p_2_out_1 : in STD_LOGIC;
    axis_data_count : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    p_8_out : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 0 to 0 );
    lopt : in STD_LOGIC;
    lopt_1 : out STD_LOGIC;
    lopt_2 : in STD_LOGIC;
    lopt_3 : out STD_LOGIC;
    lopt_4 : in STD_LOGIC;
    lopt_5 : out STD_LOGIC;
    lopt_6 : in STD_LOGIC;
    lopt_7 : in STD_LOGIC;
    lopt_8 : in STD_LOGIC;
    lopt_9 : in STD_LOGIC;
    lopt_10 : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_wr_status_flags_ss : entity is "wr_status_flags_ss";
end fifo_generator_0_wr_status_flags_ss;

architecture STRUCTURE of fifo_generator_0_wr_status_flags_ss is
  signal \^o1\ : STD_LOGIC;
  signal \^o16\ : STD_LOGIC;
  signal \^o17\ : STD_LOGIC;
  signal \^o18\ : STD_LOGIC;
  signal \^lopt_2\ : STD_LOGIC;
  signal \^lopt_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[1]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[2]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[4]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[5]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[6]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[8]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[9]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3\ : STD_LOGIC;
  signal \^p_2_out\ : STD_LOGIC;
  signal \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \gaf.gaf0.ram_afull_i_reg\ : label is "no";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[11]_i_1\ : label is "soft_lutpair5";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]_i_3_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3_CARRY4\ : label is "LO:O";
  attribute equivalent_register_removal of ram_full_fb_i_reg : label is "no";
  attribute equivalent_register_removal of ram_full_i_reg : label is "no";
  attribute RETAIN_INVERTER : boolean;
  attribute RETAIN_INVERTER of s_axis_tready_INST_0 : label is std.standard.true;
  attribute SOFT_HLUTNM of s_axis_tready_INST_0 : label is "soft_lutpair5";
begin
  O1 <= \^o1\;
  O16 <= \^o16\;
  O17 <= \^o17\;
  O18 <= \^o18\;
  \^lopt_2\ <= lopt_9;
  \^o16\ <= lopt_6;
  \^o17\ <= lopt_7;
  \^o18\ <= lopt_8;
  lopt_1 <= \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[1]_i_2\;
  lopt_10 <= \^lopt_3\;
  lopt_3 <= \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[2]_i_2\;
  lopt_5 <= \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\;
  \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2]_i_3\ <= lopt;
  \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]_i_3\ <= lopt_2;
  \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4]_i_3\ <= lopt_4;
  p_2_out <= \^p_2_out\;
  O3 <= 'Z';
\DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => \^o1\,
      I1 => s_axis_tvalid,
      I2 => \^p_2_out\,
      O => E(0)
    );
c0: entity work.fifo_generator_0_compare
    port map (
      I1 => I1,
      comp0 => comp0,
      v1_reg(4 downto 0) => v1_reg(4 downto 0)
    );
c1: entity work.fifo_generator_0_compare_0
    port map (
      I2 => I2,
      comp1 => comp1,
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0)
    );
\gaf.c2\: entity work.fifo_generator_0_compare_1
    port map (
      I3 => I3,
      p_0_in => p_0_in,
      v1_reg_1(4 downto 0) => v1_reg_1(4 downto 0)
    );
\gaf.gaf0.ram_afull_i_reg\: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => p_2_out_1,
      PRE => rst_d2,
      Q => axis_almost_full
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => DIADI(0),
      I1 => \^o1\,
      I2 => s_axis_tvalid,
      O => axis_wr_eop
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBFBBBBB"
    )
    port map (
      I0 => \^o1\,
      I1 => s_axis_tvalid,
      I2 => I4,
      I3 => p_8_out,
      I4 => m_axis_tready,
      O => O2
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(9),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2D222222"
    )
    port map (
      I0 => s_axis_tvalid,
      I1 => \^o1\,
      I2 => p_8_out,
      I3 => I4,
      I4 => m_axis_tready,
      O => O27
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(0),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[1]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(1),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[2]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(2),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[3]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(3),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[4]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(4),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[5]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(5),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[6]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(6),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(7),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[8]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5959555959595959"
    )
    port map (
      I0 => axis_data_count(8),
      I1 => s_axis_tvalid,
      I2 => \^o1\,
      I3 => m_axis_tready,
      I4 => p_8_out,
      I5 => I4,
      O => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[9]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4]_i_3\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8]_i_3\,
      CO(2) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]_i_3\,
      CO(1) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6]_i_3\,
      CO(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]_i_3\,
      CYINIT => '0',
      DI(3 downto 0) => axis_data_count(6 downto 3),
      O(3) => O22,
      O(2) => O21,
      O(1) => O20,
      O(0) => O19,
      S(3) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[7]_i_2\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[6]_i_2\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[5]_i_2\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[4]_i_2\
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8]_i_3\,
      CO(3 downto 2) => \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]_i_3\,
      CO(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3\,
      CYINIT => '0',
      DI(3) => \NLW_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]_i_3_CARRY4_DI_UNCONNECTED\(3),
      DI(2 downto 0) => axis_data_count(9 downto 7),
      O(3) => \^lopt_3\,
      O(2) => O25,
      O(1) => O24,
      O(0) => O23,
      S(3) => \^lopt_2\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[10]_i_2\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[9]_i_2\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo[8]_i_2\
    );
ram_full_fb_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => ram_full_comb,
      PRE => rst_d2,
      Q => \^p_2_out\
    );
ram_full_i_reg: unisim.vcomponents.FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => s_aclk,
      CE => '1',
      D => ram_full_comb,
      PRE => rst_d2,
      Q => \^o1\
    );
s_axis_tready_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \^o1\,
      O => s_axis_tready
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_blk_mem_gen_generic_cstr is
  port (
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_blk_mem_gen_generic_cstr : entity is "blk_mem_gen_generic_cstr";
end fifo_generator_0_blk_mem_gen_generic_cstr;

architecture STRUCTURE of fifo_generator_0_blk_mem_gen_generic_cstr is
begin
\ramloop[0].ram.r\: entity work.fifo_generator_0_blk_mem_gen_prim_width
    port map (
      D(10 downto 0) => D(10 downto 0),
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => I1,
      O2(10 downto 0) => O2(10 downto 0),
      O3(10 downto 0) => O3(10 downto 0),
      WEA(0) => WEA(0),
      s_aclk => s_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_rd_logic is
  port (
    p_8_out : out STD_LOGIC;
    O1 : out STD_LOGIC;
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    O2 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O3 : out STD_LOGIC_VECTOR ( 9 downto 0 );
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O15 : out STD_LOGIC;
    O26 : out STD_LOGIC;
    p_2_out : out STD_LOGIC;
    ram_full_comb : out STD_LOGIC;
    v1_reg : in STD_LOGIC_VECTOR ( 4 downto 0 );
    v1_reg_0 : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_aclk : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I1 : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    ram_full_i : in STD_LOGIC;
    axis_data_count : in STD_LOGIC_VECTOR ( 1 downto 0 );
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    I4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    I5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_almost_full : in STD_LOGIC;
    I6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    axis_wr_eop_d1 : in STD_LOGIC;
    I7 : in STD_LOGIC;
    I8 : in STD_LOGIC;
    p_0_in : in STD_LOGIC;
    rst_full_gen_i : in STD_LOGIC;
    I9 : in STD_LOGIC;
    comp1 : in STD_LOGIC;
    p_2_out_1 : in STD_LOGIC;
    comp0 : in STD_LOGIC;
    lopt : in STD_LOGIC;
    lopt_1 : out STD_LOGIC;
    lopt_2 : in STD_LOGIC;
    lopt_3 : in STD_LOGIC;
    lopt_4 : out STD_LOGIC;
    lopt_5 : in STD_LOGIC;
    lopt_6 : in STD_LOGIC;
    lopt_7 : out STD_LOGIC;
    lopt_8 : in STD_LOGIC;
    lopt_9 : out STD_LOGIC;
    lopt_10 : out STD_LOGIC;
    lopt_11 : out STD_LOGIC;
    lopt_12 : out STD_LOGIC;
    lopt_13 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_rd_logic : entity is "rd_logic";
end fifo_generator_0_rd_logic;

architecture STRUCTURE of fifo_generator_0_rd_logic is
  signal comp0_1 : STD_LOGIC;
  signal comp1_0 : STD_LOGIC;
  signal n_0_rpntr : STD_LOGIC;
  signal n_12_rpntr : STD_LOGIC;
  signal n_18_rpntr : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal p_18_out : STD_LOGIC;
begin
\gr1.rfwft\: entity work.fifo_generator_0_rd_fwft
    port map (
      CO(0) => CO(0),
      E(0) => E(0),
      I1 => I1,
      I5(0) => I5(0),
      I6(0) => I6(0),
      I7 => I7,
      I8 => I8,
      O1 => p_8_out,
      O15 => O15,
      O2 => O1,
      O26 => O26,
      O7 => O7,
      O8 => O8,
      Q(1 downto 0) => Q(1 downto 0),
      axis_almost_full => axis_almost_full,
      axis_data_count(1 downto 0) => axis_data_count(1 downto 0),
      axis_wr_eop_d1 => axis_wr_eop_d1,
      lopt => lopt,
      lopt_1 => lopt_1,
      lopt_10 => lopt_10,
      lopt_11 => lopt_11,
      lopt_12 => lopt_12,
      lopt_13 => lopt_13,
      lopt_2 => lopt_2,
      lopt_3 => lopt_3,
      lopt_4 => lopt_4,
      lopt_5 => lopt_5,
      lopt_6 => lopt_6,
      lopt_7 => lopt_7,
      lopt_8 => lopt_8,
      lopt_9 => lopt_9,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      p_14_out => p_14_out,
      p_18_out => p_18_out,
      ram_full_i => ram_full_i,
      s_aclk => s_aclk,
      s_axis_tvalid => s_axis_tvalid
    );
\grss.rsts\: entity work.fifo_generator_0_rd_status_flags_ss
    port map (
      I1 => n_0_rpntr,
      I2 => n_12_rpntr,
      I3 => n_18_rpntr,
      Q(0) => Q(1),
      comp0 => comp0_1,
      comp1 => comp1_0,
      p_18_out => p_18_out,
      s_aclk => s_aclk,
      v1_reg(4 downto 0) => v1_reg(4 downto 0),
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0)
    );
rpntr: entity work.fifo_generator_0_rd_bin_cntr
    port map (
      I1(0) => Q(1),
      I2(0) => I2(0),
      I3(0) => I3(0),
      I4(0) => I4(0),
      I9 => I9,
      O1 => n_0_rpntr,
      O2 => n_12_rpntr,
      O3 => n_18_rpntr,
      O4 => O4,
      O5 => O5,
      O6 => O6,
      O7(9 downto 0) => O3(9 downto 0),
      Q(10 downto 0) => O2(10 downto 0),
      axis_almost_full => axis_almost_full,
      comp0 => comp0,
      comp0_0 => comp0_1,
      comp1 => comp1,
      comp1_1 => comp1_0,
      p_0_in => p_0_in,
      p_14_out => p_14_out,
      p_18_out => p_18_out,
      p_2_out => p_2_out,
      p_2_out_1 => p_2_out_1,
      ram_full_comb => ram_full_comb,
      rst_full_gen_i => rst_full_gen_i,
      s_aclk => s_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_wr_logic is
  port (
    comp0 : out STD_LOGIC;
    comp1 : out STD_LOGIC;
    p_0_in : out STD_LOGIC;
    p_2_out : out STD_LOGIC;
    axis_almost_full : out STD_LOGIC;
    ram_full_i : out STD_LOGIC;
    O1 : out STD_LOGIC;
    WEA : out STD_LOGIC_VECTOR ( 0 to 0 );
    O16 : out STD_LOGIC;
    O17 : out STD_LOGIC;
    O18 : out STD_LOGIC;
    O19 : out STD_LOGIC;
    O20 : out STD_LOGIC;
    O21 : out STD_LOGIC;
    O22 : out STD_LOGIC;
    O23 : out STD_LOGIC;
    O24 : out STD_LOGIC;
    O2 : out STD_LOGIC;
    O25 : out STD_LOGIC;
    O27 : out STD_LOGIC;
    axis_wr_eop : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    v1_reg : out STD_LOGIC_VECTOR ( 4 downto 0 );
    O3 : out STD_LOGIC_VECTOR ( 10 downto 0 );
    v1_reg_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    O4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    I1 : in STD_LOGIC;
    I2 : in STD_LOGIC;
    I3 : in STD_LOGIC;
    ram_full_comb : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    rst_d2 : in STD_LOGIC;
    p_2_out_1 : in STD_LOGIC;
    axis_data_count : in STD_LOGIC_VECTOR ( 9 downto 0 );
    s_axis_tvalid : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    p_8_out : in STD_LOGIC;
    I4 : in STD_LOGIC;
    I5 : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 0 to 0 );
    I6 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    I7 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    AR : in STD_LOGIC_VECTOR ( 0 to 0 );
    lopt : in STD_LOGIC;
    lopt_1 : out STD_LOGIC;
    lopt_2 : in STD_LOGIC;
    lopt_3 : out STD_LOGIC;
    lopt_4 : in STD_LOGIC;
    lopt_5 : out STD_LOGIC;
    lopt_6 : in STD_LOGIC;
    lopt_7 : in STD_LOGIC;
    lopt_8 : in STD_LOGIC;
    lopt_9 : in STD_LOGIC;
    lopt_10 : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_wr_logic : entity is "wr_logic";
end fifo_generator_0_wr_logic;

architecture STRUCTURE of fifo_generator_0_wr_logic is
  signal \^wea\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \c0/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \c1/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \gaf.c2/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
begin
  WEA(0) <= \^wea\(0);
\gwss.wsts\: entity work.fifo_generator_0_wr_status_flags_ss
    port map (
      DIADI(0) => DIADI(0),
      E(0) => \^wea\(0),
      I1 => I1,
      I2 => I2,
      I3 => I3,
      I4 => I4,
      I5 => I5,
      O1 => ram_full_i,
      O16 => O16,
      O17 => O17,
      O18 => O18,
      O19 => O19,
      O2 => O1,
      O20 => O20,
      O21 => O21,
      O22 => O22,
      O23 => O23,
      O24 => O24,
      O25 => O25,
      O27 => O27,
      O3 => O2,
      axis_almost_full => axis_almost_full,
      axis_data_count(9 downto 0) => axis_data_count(9 downto 0),
      axis_wr_eop => axis_wr_eop,
      comp0 => comp0,
      comp1 => comp1,
      lopt => lopt,
      lopt_1 => lopt_1,
      lopt_10 => lopt_10,
      lopt_2 => lopt_2,
      lopt_3 => lopt_3,
      lopt_4 => lopt_4,
      lopt_5 => lopt_5,
      lopt_6 => lopt_6,
      lopt_7 => lopt_7,
      lopt_8 => lopt_8,
      lopt_9 => lopt_9,
      m_axis_tready => m_axis_tready,
      p_0_in => p_0_in,
      p_2_out => p_2_out,
      p_2_out_1 => p_2_out_1,
      p_8_out => p_8_out,
      ram_full_comb => ram_full_comb,
      rst_d2 => rst_d2,
      s_aclk => s_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid,
      v1_reg(4 downto 0) => \c0/v1_reg\(4 downto 0),
      v1_reg_0(4 downto 0) => \c1/v1_reg\(4 downto 0),
      v1_reg_1(4 downto 0) => \gaf.c2/v1_reg\(4 downto 0)
    );
wpntr: entity work.fifo_generator_0_wr_bin_cntr
    port map (
      AR(0) => AR(0),
      E(0) => \^wea\(0),
      I6(9 downto 0) => I6(9 downto 0),
      I7(9 downto 0) => I7(9 downto 0),
      O1(10 downto 0) => O3(10 downto 0),
      O4(0) => O4(0),
      Q(0) => Q(0),
      s_aclk => s_aclk,
      v1_reg(4 downto 0) => v1_reg(4 downto 0),
      v1_reg_0(4 downto 0) => v1_reg_0(4 downto 0),
      v1_reg_1(4 downto 0) => \c0/v1_reg\(4 downto 0),
      v1_reg_2(4 downto 0) => \c1/v1_reg\(4 downto 0),
      v1_reg_3(4 downto 0) => \gaf.c2/v1_reg\(4 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_blk_mem_gen_top is
  port (
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_blk_mem_gen_top : entity is "blk_mem_gen_top";
end fifo_generator_0_blk_mem_gen_top;

architecture STRUCTURE of fifo_generator_0_blk_mem_gen_top is
begin
\valid.cstr\: entity work.fifo_generator_0_blk_mem_gen_generic_cstr
    port map (
      D(10 downto 0) => D(10 downto 0),
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => I1,
      O2(10 downto 0) => O2(10 downto 0),
      O3(10 downto 0) => O3(10 downto 0),
      WEA(0) => WEA(0),
      s_aclk => s_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_blk_mem_gen_v8_2_synth is
  port (
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_blk_mem_gen_v8_2_synth : entity is "blk_mem_gen_v8_2_synth";
end fifo_generator_0_blk_mem_gen_v8_2_synth;

architecture STRUCTURE of fifo_generator_0_blk_mem_gen_v8_2_synth is
begin
\gnativebmg.native_blk_mem_gen\: entity work.fifo_generator_0_blk_mem_gen_top
    port map (
      D(10 downto 0) => D(10 downto 0),
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => I1,
      O2(10 downto 0) => O2(10 downto 0),
      O3(10 downto 0) => O3(10 downto 0),
      WEA(0) => WEA(0),
      s_aclk => s_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \fifo_generator_0_blk_mem_gen_v8_2__parameterized0\ is
  port (
    D : out STD_LOGIC_VECTOR ( 10 downto 0 );
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \fifo_generator_0_blk_mem_gen_v8_2__parameterized0\ : entity is "blk_mem_gen_v8_2";
end \fifo_generator_0_blk_mem_gen_v8_2__parameterized0\;

architecture STRUCTURE of \fifo_generator_0_blk_mem_gen_v8_2__parameterized0\ is
begin
inst_blk_mem_gen: entity work.fifo_generator_0_blk_mem_gen_v8_2_synth
    port map (
      D(10 downto 0) => D(10 downto 0),
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => I1,
      O2(10 downto 0) => O2(10 downto 0),
      O3(10 downto 0) => O3(10 downto 0),
      WEA(0) => WEA(0),
      s_aclk => s_aclk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_memory is
  port (
    Q : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O1 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    O11 : out STD_LOGIC;
    O12 : out STD_LOGIC;
    O13 : out STD_LOGIC;
    O14 : out STD_LOGIC;
    O28 : out STD_LOGIC;
    WEA : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aclk : in STD_LOGIC;
    I1 : in STD_LOGIC;
    O3 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : in STD_LOGIC_VECTOR ( 10 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 );
    m_axis_tready : in STD_LOGIC;
    I2 : in STD_LOGIC;
    p_8_out : in STD_LOGIC;
    axis_wr_eop_d1 : in STD_LOGIC;
    \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    E : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_memory : entity is "memory";
end fifo_generator_0_memory;

architecture STRUCTURE of fifo_generator_0_memory is
  signal \^q\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal doutb : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_4\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[11]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[1]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[2]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[4]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[5]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[6]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[8]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[9]_i_2\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8]_i_3\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3\ : STD_LOGIC;
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3_CARRY4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3_CARRY4_DI_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]_i_3_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]_i_3_CARRY4\ : label is "LO:O";
  attribute XILINX_LEGACY_PRIM of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3_CARRY4\ : label is "(MUXCY,XORCY)";
  attribute XILINX_TRANSFORM_PINMAP of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3_CARRY4\ : label is "LO:O";
begin
  Q(10 downto 0) <= \^q\(10 downto 0);
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA6AAA"
    )
    port map (
      I0 => axis_wr_eop_d1,
      I1 => \^q\(0),
      I2 => m_axis_tready,
      I3 => I2,
      I4 => p_8_out,
      O => O28
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080FFFFFF7F0000"
    )
    port map (
      I0 => \^q\(0),
      I1 => m_axis_tready,
      I2 => I2,
      I3 => p_8_out,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(0),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_3\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0080FFFF"
    )
    port map (
      I0 => \^q\(0),
      I1 => m_axis_tready,
      I2 => I2,
      I3 => p_8_out,
      I4 => axis_wr_eop_d1,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_4\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(10),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7F00000080FFFF"
    )
    port map (
      I0 => \^q\(0),
      I1 => m_axis_tready,
      I2 => I2,
      I3 => p_8_out,
      I4 => axis_wr_eop_d1,
      I5 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[11]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(1),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[1]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(2),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[2]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(3),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(4),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[4]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(5),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[5]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(6),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[6]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(7),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(8),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[8]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9999999959999999"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(9),
      I1 => axis_wr_eop_d1,
      I2 => \^q\(0),
      I3 => m_axis_tready,
      I4 => I2,
      I5 => p_8_out,
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[9]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4]_i_3\,
      CO(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]_i_3\,
      CO(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2]_i_3\,
      CO(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]_i_3\,
      CYINIT => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_4\,
      DI(3 downto 0) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(3 downto 0),
      O(3) => O6,
      O(2) => O5,
      O(1) => O4,
      O(0) => O1,
      S(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[3]_i_2\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[2]_i_2\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[1]_i_2\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[0]_i_3\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4]_i_3\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8]_i_3\,
      CO(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]_i_3\,
      CO(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6]_i_3\,
      CO(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]_i_3\,
      CYINIT => '0',
      DI(3 downto 0) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(7 downto 4),
      O(3) => O10,
      O(2) => O9,
      O(1) => O8,
      O(0) => O7,
      S(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[7]_i_2\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[6]_i_2\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[5]_i_2\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[4]_i_2\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3_CARRY4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8]_i_3\,
      CO(3 downto 2) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3_CARRY4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]_i_3\,
      CO(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3\,
      CYINIT => '0',
      DI(3) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]_i_3_CARRY4_DI_UNCONNECTED\(3),
      DI(2 downto 0) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(10 downto 8),
      O(3) => O14,
      O(2) => O13,
      O(1) => O12,
      O(0) => O11,
      S(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[11]_i_2\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[10]_i_2\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[9]_i_2\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt[8]_i_2\
    );
\gbm.gbmg.gbmga.ngecc.bmg\: entity work.\fifo_generator_0_blk_mem_gen_v8_2__parameterized0\
    port map (
      D(10 downto 0) => doutb(10 downto 0),
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => I1,
      O2(10 downto 0) => O2(10 downto 0),
      O3(10 downto 0) => O3(10 downto 0),
      WEA(0) => WEA(0),
      s_aclk => s_aclk
    );
\goreg_bm.dout_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(0),
      Q => \^q\(0),
      R => '0'
    );
\goreg_bm.dout_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(10),
      Q => \^q\(10),
      R => '0'
    );
\goreg_bm.dout_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(1),
      Q => \^q\(1),
      R => '0'
    );
\goreg_bm.dout_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(2),
      Q => \^q\(2),
      R => '0'
    );
\goreg_bm.dout_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(3),
      Q => \^q\(3),
      R => '0'
    );
\goreg_bm.dout_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(4),
      Q => \^q\(4),
      R => '0'
    );
\goreg_bm.dout_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(5),
      Q => \^q\(5),
      R => '0'
    );
\goreg_bm.dout_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(6),
      Q => \^q\(6),
      R => '0'
    );
\goreg_bm.dout_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(7),
      Q => \^q\(7),
      R => '0'
    );
\goreg_bm.dout_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(8),
      Q => \^q\(8),
      R => '0'
    );
\goreg_bm.dout_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => E(0),
      D => doutb(9),
      Q => \^q\(9),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_fifo_generator_ramfifo is
  port (
    O1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    O11 : out STD_LOGIC;
    O12 : out STD_LOGIC;
    O13 : out STD_LOGIC;
    O14 : out STD_LOGIC;
    O15 : out STD_LOGIC;
    O16 : out STD_LOGIC;
    O17 : out STD_LOGIC;
    O18 : out STD_LOGIC;
    O19 : out STD_LOGIC;
    O20 : out STD_LOGIC;
    O21 : out STD_LOGIC;
    O22 : out STD_LOGIC;
    O23 : out STD_LOGIC;
    O24 : out STD_LOGIC;
    O25 : out STD_LOGIC;
    O26 : out STD_LOGIC;
    O27 : out STD_LOGIC;
    axis_wr_eop : out STD_LOGIC;
    O28 : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 );
    I1 : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    axis_data_count : in STD_LOGIC_VECTOR ( 11 downto 0 );
    axis_wr_eop_d1 : in STD_LOGIC;
    \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_fifo_generator_ramfifo : entity is "fifo_generator_ramfifo";
end fifo_generator_0_fifo_generator_ramfifo;

architecture STRUCTURE of fifo_generator_0_fifo_generator_ramfifo is
  signal \^q\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal RST : STD_LOGIC;
  signal axis_almost_full : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal \grss.rsts/c1/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \grss.rsts/c2/v1_reg\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \gwss.wsts/comp0\ : STD_LOGIC;
  signal \gwss.wsts/comp1\ : STD_LOGIC;
  signal \gwss.wsts/p_0_in\ : STD_LOGIC;
  signal \gwss.wsts/p_2_out\ : STD_LOGIC;
  signal \gwss.wsts/ram_full_comb\ : STD_LOGIC;
  signal lopt : STD_LOGIC;
  signal lopt_1 : STD_LOGIC;
  signal lopt_10 : STD_LOGIC;
  signal lopt_2 : STD_LOGIC;
  signal lopt_3 : STD_LOGIC;
  signal lopt_4 : STD_LOGIC;
  signal lopt_5 : STD_LOGIC;
  signal lopt_6 : STD_LOGIC;
  signal lopt_7 : STD_LOGIC;
  signal lopt_8 : STD_LOGIC;
  signal lopt_9 : STD_LOGIC;
  signal \n_17_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal \n_1_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_24_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_25_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_26_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_29_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal \n_2_gntv_or_sync_fifo.gl0.rd\ : STD_LOGIC;
  signal n_5_rstblk : STD_LOGIC;
  signal \n_6_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal \n_7_gntv_or_sync_fifo.gl0.wr\ : STD_LOGIC;
  signal p_20_out : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal p_2_out : STD_LOGIC;
  signal p_8_out : STD_LOGIC;
  signal p_8_out_0 : STD_LOGIC_VECTOR ( 10 to 10 );
  signal p_9_out : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal ram_full_i : STD_LOGIC;
  signal rd_pntr_plus1 : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal rst_d2 : STD_LOGIC;
  signal rst_full_gen_i : STD_LOGIC;
  signal wr_pntr_plus2 : STD_LOGIC_VECTOR ( 10 to 10 );
begin
  Q(10 downto 0) <= \^q\(10 downto 0);
\gntv_or_sync_fifo.gl0.rd\: entity work.fifo_generator_0_rd_logic
    port map (
      CO(0) => CO(0),
      E(0) => \n_2_gntv_or_sync_fifo.gl0.rd\,
      I1 => I1,
      I2(0) => p_9_out(10),
      I3(0) => p_8_out_0(10),
      I4(0) => wr_pntr_plus2(10),
      I5(0) => I2(0),
      I6(0) => \^q\(0),
      I7 => \n_6_gntv_or_sync_fifo.gl0.wr\,
      I8 => \n_17_gntv_or_sync_fifo.gl0.wr\,
      I9 => \n_7_gntv_or_sync_fifo.gl0.wr\,
      O1 => \n_1_gntv_or_sync_fifo.gl0.rd\,
      O15 => O15,
      O2(10 downto 0) => p_20_out(10 downto 0),
      O26 => O26,
      O3(9 downto 0) => rd_pntr_plus1(9 downto 0),
      O4 => \n_24_gntv_or_sync_fifo.gl0.rd\,
      O5 => \n_25_gntv_or_sync_fifo.gl0.rd\,
      O6 => \n_26_gntv_or_sync_fifo.gl0.rd\,
      O7 => O2,
      O8 => \n_29_gntv_or_sync_fifo.gl0.rd\,
      Q(1) => clear,
      Q(0) => n_5_rstblk,
      axis_almost_full => axis_almost_full,
      axis_data_count(1) => axis_data_count(11),
      axis_data_count(0) => axis_data_count(0),
      axis_wr_eop_d1 => axis_wr_eop_d1,
      comp0 => \gwss.wsts/comp0\,
      comp1 => \gwss.wsts/comp1\,
      lopt => axis_data_count(1),
      lopt_1 => lopt,
      lopt_10 => lopt_7,
      lopt_11 => lopt_8,
      lopt_12 => lopt_9,
      lopt_13 => lopt_10,
      lopt_2 => lopt_1,
      lopt_3 => axis_data_count(2),
      lopt_4 => lopt_2,
      lopt_5 => lopt_3,
      lopt_6 => axis_data_count(3),
      lopt_7 => lopt_4,
      lopt_8 => lopt_5,
      lopt_9 => lopt_6,
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      p_0_in => \gwss.wsts/p_0_in\,
      p_2_out => \gwss.wsts/p_2_out\,
      p_2_out_1 => p_2_out,
      p_8_out => p_8_out,
      ram_full_comb => \gwss.wsts/ram_full_comb\,
      ram_full_i => ram_full_i,
      rst_full_gen_i => rst_full_gen_i,
      s_aclk => s_aclk,
      s_axis_tvalid => s_axis_tvalid,
      v1_reg(4 downto 0) => \grss.rsts/c1/v1_reg\(4 downto 0),
      v1_reg_0(4 downto 0) => \grss.rsts/c2/v1_reg\(4 downto 0)
    );
\gntv_or_sync_fifo.gl0.wr\: entity work.fifo_generator_0_wr_logic
    port map (
      AR(0) => RST,
      DIADI(0) => DIADI(0),
      I1 => \n_24_gntv_or_sync_fifo.gl0.rd\,
      I2 => \n_25_gntv_or_sync_fifo.gl0.rd\,
      I3 => \n_26_gntv_or_sync_fifo.gl0.rd\,
      I4 => I1,
      I5 => \n_29_gntv_or_sync_fifo.gl0.rd\,
      I6(9 downto 0) => p_20_out(9 downto 0),
      I7(9 downto 0) => rd_pntr_plus1(9 downto 0),
      O1 => \n_6_gntv_or_sync_fifo.gl0.wr\,
      O16 => O16,
      O17 => O17,
      O18 => O18,
      O19 => O19,
      O2 => \n_17_gntv_or_sync_fifo.gl0.wr\,
      O20 => O20,
      O21 => O21,
      O22 => O22,
      O23 => O23,
      O24 => O24,
      O25 => O25,
      O27 => O27,
      O3(10 downto 0) => p_9_out(10 downto 0),
      O4(0) => p_8_out_0(10),
      Q(0) => wr_pntr_plus2(10),
      WEA(0) => \n_7_gntv_or_sync_fifo.gl0.wr\,
      axis_almost_full => axis_almost_full,
      axis_data_count(9 downto 0) => axis_data_count(10 downto 1),
      axis_wr_eop => axis_wr_eop,
      comp0 => \gwss.wsts/comp0\,
      comp1 => \gwss.wsts/comp1\,
      lopt => lopt,
      lopt_1 => lopt_1,
      lopt_10 => lopt_10,
      lopt_2 => lopt_2,
      lopt_3 => lopt_3,
      lopt_4 => lopt_4,
      lopt_5 => lopt_5,
      lopt_6 => lopt_6,
      lopt_7 => lopt_7,
      lopt_8 => lopt_8,
      lopt_9 => lopt_9,
      m_axis_tready => m_axis_tready,
      p_0_in => \gwss.wsts/p_0_in\,
      p_2_out => p_2_out,
      p_2_out_1 => \gwss.wsts/p_2_out\,
      p_8_out => p_8_out,
      ram_full_comb => \gwss.wsts/ram_full_comb\,
      ram_full_i => ram_full_i,
      rst_d2 => rst_d2,
      s_aclk => s_aclk,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid,
      v1_reg(4 downto 0) => \grss.rsts/c1/v1_reg\(4 downto 0),
      v1_reg_0(4 downto 0) => \grss.rsts/c2/v1_reg\(4 downto 0)
    );
\gntv_or_sync_fifo.mem\: entity work.fifo_generator_0_memory
    port map (
      DIADI(10 downto 0) => DIADI(10 downto 0),
      E(0) => \n_2_gntv_or_sync_fifo.gl0.rd\,
      I1 => \n_1_gntv_or_sync_fifo.gl0.rd\,
      I2 => I1,
      O1 => O3,
      O10 => O10,
      O11 => O11,
      O12 => O12,
      O13 => O13,
      O14 => O14,
      O2(10 downto 0) => p_20_out(10 downto 0),
      O28 => O28,
      O3(10 downto 0) => p_9_out(10 downto 0),
      O4 => O4,
      O5 => O5,
      O6 => O6,
      O7 => O7,
      O8 => O8,
      O9 => O9,
      Q(10 downto 0) => \^q\(10 downto 0),
      WEA(0) => \n_7_gntv_or_sync_fifo.gl0.wr\,
      axis_wr_eop_d1 => axis_wr_eop_d1,
      \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11 downto 0) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11 downto 0),
      m_axis_tready => m_axis_tready,
      p_8_out => p_8_out,
      s_aclk => s_aclk
    );
rstblk: entity work.fifo_generator_0_reset_blk_ramfifo
    port map (
      AR(0) => RST,
      O1 => O1,
      Q(1) => clear,
      Q(0) => n_5_rstblk,
      rst_d2 => rst_d2,
      rst_full_gen_i => rst_full_gen_i,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_fifo_generator_top is
  port (
    O1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 10 downto 0 );
    O2 : out STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    O3 : out STD_LOGIC;
    O4 : out STD_LOGIC;
    O5 : out STD_LOGIC;
    O6 : out STD_LOGIC;
    O7 : out STD_LOGIC;
    O8 : out STD_LOGIC;
    O9 : out STD_LOGIC;
    O10 : out STD_LOGIC;
    O11 : out STD_LOGIC;
    O12 : out STD_LOGIC;
    O13 : out STD_LOGIC;
    O14 : out STD_LOGIC;
    O15 : out STD_LOGIC;
    O16 : out STD_LOGIC;
    O17 : out STD_LOGIC;
    O18 : out STD_LOGIC;
    O19 : out STD_LOGIC;
    O20 : out STD_LOGIC;
    O21 : out STD_LOGIC;
    O22 : out STD_LOGIC;
    O23 : out STD_LOGIC;
    O24 : out STD_LOGIC;
    O25 : out STD_LOGIC;
    O26 : out STD_LOGIC;
    O27 : out STD_LOGIC;
    axis_wr_eop : out STD_LOGIC;
    O28 : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_aclk : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 );
    I1 : in STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    axis_data_count : in STD_LOGIC_VECTOR ( 11 downto 0 );
    axis_wr_eop_d1 : in STD_LOGIC;
    \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\ : in STD_LOGIC_VECTOR ( 11 downto 0 );
    CO : in STD_LOGIC_VECTOR ( 0 to 0 );
    I2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_fifo_generator_top : entity is "fifo_generator_top";
end fifo_generator_0_fifo_generator_top;

architecture STRUCTURE of fifo_generator_0_fifo_generator_top is
begin
\grf.rf\: entity work.fifo_generator_0_fifo_generator_ramfifo
    port map (
      CO(0) => CO(0),
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => I1,
      I2(0) => I2(0),
      O1 => O1,
      O10 => O10,
      O11 => O11,
      O12 => O12,
      O13 => O13,
      O14 => O14,
      O15 => O15,
      O16 => O16,
      O17 => O17,
      O18 => O18,
      O19 => O19,
      O2 => O2,
      O20 => O20,
      O21 => O21,
      O22 => O22,
      O23 => O23,
      O24 => O24,
      O25 => O25,
      O26 => O26,
      O27 => O27,
      O28 => O28,
      O3 => O3,
      O4 => O4,
      O5 => O5,
      O6 => O6,
      O7 => O7,
      O8 => O8,
      O9 => O9,
      Q(10 downto 0) => Q(10 downto 0),
      axis_data_count(11 downto 0) => axis_data_count(11 downto 0),
      axis_wr_eop => axis_wr_eop,
      axis_wr_eop_d1 => axis_wr_eop_d1,
      \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11 downto 0) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11 downto 0),
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0_fifo_generator_v12_0_synth is
  port (
    axis_data_count : out STD_LOGIC_VECTOR ( 11 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 10 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_generator_0_fifo_generator_v12_0_synth : entity is "fifo_generator_v12_0_synth";
end fifo_generator_0_fifo_generator_v12_0_synth;

architecture STRUCTURE of fifo_generator_0_fifo_generator_v12_0_synth is
  signal \^axis_data_count\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal axis_wr_eop : STD_LOGIC;
  signal axis_wr_eop_d1 : STD_LOGIC;
  signal \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal \n_0_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_12\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_13\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_14\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_15\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_16\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_17\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_18\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_19\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_20\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_21\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_22\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_23\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_7\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\ : STD_LOGIC;
  signal \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_12_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_14_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_15_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_16_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_17_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_18_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_19_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\ : STD_LOGIC;
  signal \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_20_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_21_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_22_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_23_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_24_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_25_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_26_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_27_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_28_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_29_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\ : STD_LOGIC;
  signal \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_30_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_31_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_32_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_33_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_34_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_35_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_36_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_37_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_38_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\ : STD_LOGIC;
  signal \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\ : STD_LOGIC;
  signal \n_40_gaxis_fifo.gaxisf.axisf\ : STD_LOGIC;
  signal p_13_in : STD_LOGIC;
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute counter : integer;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[0]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[11]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]\ : label is 5;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[0]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[11]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8]\ : label is 6;
  attribute counter of \gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]\ : label is 6;
begin
  axis_data_count(11 downto 0) <= \^axis_data_count\(11 downto 0);
\gaxis_fifo.gaxisf.axisf\: entity work.fifo_generator_0_fifo_generator_top
    port map (
      CO(0) => p_13_in,
      DIADI(10 downto 0) => DIADI(10 downto 0),
      I1 => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg\,
      I2(0) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\,
      O1 => \n_0_gaxis_fifo.gaxisf.axisf\,
      O10 => \n_21_gaxis_fifo.gaxisf.axisf\,
      O11 => \n_22_gaxis_fifo.gaxisf.axisf\,
      O12 => \n_23_gaxis_fifo.gaxisf.axisf\,
      O13 => \n_24_gaxis_fifo.gaxisf.axisf\,
      O14 => \n_25_gaxis_fifo.gaxisf.axisf\,
      O15 => \n_26_gaxis_fifo.gaxisf.axisf\,
      O16 => \n_27_gaxis_fifo.gaxisf.axisf\,
      O17 => \n_28_gaxis_fifo.gaxisf.axisf\,
      O18 => \n_29_gaxis_fifo.gaxisf.axisf\,
      O19 => \n_30_gaxis_fifo.gaxisf.axisf\,
      O2 => \n_12_gaxis_fifo.gaxisf.axisf\,
      O20 => \n_31_gaxis_fifo.gaxisf.axisf\,
      O21 => \n_32_gaxis_fifo.gaxisf.axisf\,
      O22 => \n_33_gaxis_fifo.gaxisf.axisf\,
      O23 => \n_34_gaxis_fifo.gaxisf.axisf\,
      O24 => \n_35_gaxis_fifo.gaxisf.axisf\,
      O25 => \n_36_gaxis_fifo.gaxisf.axisf\,
      O26 => \n_37_gaxis_fifo.gaxisf.axisf\,
      O27 => \n_38_gaxis_fifo.gaxisf.axisf\,
      O28 => \n_40_gaxis_fifo.gaxisf.axisf\,
      O3 => \n_14_gaxis_fifo.gaxisf.axisf\,
      O4 => \n_15_gaxis_fifo.gaxisf.axisf\,
      O5 => \n_16_gaxis_fifo.gaxisf.axisf\,
      O6 => \n_17_gaxis_fifo.gaxisf.axisf\,
      O7 => \n_18_gaxis_fifo.gaxisf.axisf\,
      O8 => \n_19_gaxis_fifo.gaxisf.axisf\,
      O9 => \n_20_gaxis_fifo.gaxisf.axisf\,
      Q(10 downto 0) => Q(10 downto 0),
      axis_data_count(11 downto 0) => \^axis_data_count\(11 downto 0),
      axis_wr_eop => axis_wr_eop,
      axis_wr_eop_d1 => axis_wr_eop_d1,
      \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11 downto 0) => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11 downto 0),
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_14_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(0)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_24_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(10)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_25_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_15_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(1)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_16_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(2)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_17_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(3)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_18_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(4)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_19_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(5)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_20_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(6)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_21_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(7)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_22_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(8)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_40_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_23_gaxis_fifo.gaxisf.axisf\,
      Q => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(9)
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(8),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(9),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(6),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(7),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_12\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(4),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(5),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_13\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(2),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(3),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_14\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(0),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(1),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_15\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(6),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(7),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_16\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(4),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(5),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_17\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(2),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(3),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_18\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(0),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(1),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_19\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_20\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(10),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(9),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_20\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_21\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(8),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(7),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(6),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_21\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_22\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(5),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(4),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(3),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_22\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_23\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(0),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(2),
      I2 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(1),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_23\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(10),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_7\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(8),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(9),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(10),
      I1 => \gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_cnt_reg\(11),
      O => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_12_gaxis_fifo.gaxisf.axisf\,
      Q => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\,
      CYINIT => '1',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_20\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_21\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_22\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_23\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\,
      CO(3) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3_CO_UNCONNECTED\(3),
      CO(2) => p_13_in,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_3_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '1',
      S(1) => '1',
      S(0) => '1'
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(3 downto 2) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_7\,
      DI(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_8\,
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_4_O_UNCONNECTED\(3 downto 0),
      S(3) => '0',
      S(2) => '0',
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_9\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_10\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\: unisim.vcomponents.CARRY4
    port map (
      CI => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_11\,
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_5_O_UNCONNECTED\(3 downto 0),
      S(3) => '1',
      S(2) => '1',
      S(1) => '1',
      S(0) => '1'
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\: unisim.vcomponents.CARRY4
    port map (
      CI => '0',
      CO(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(2) => \n_1_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(1) => \n_2_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CO(0) => \n_3_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6\,
      CYINIT => '0',
      DI(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_12\,
      DI(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_13\,
      DI(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_14\,
      DI(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_15\,
      O(3 downto 0) => \NLW_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_reg_i_6_O_UNCONNECTED\(3 downto 0),
      S(3) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_16\,
      S(2) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_17\,
      S(1) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_18\,
      S(0) => \n_0_gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_pkt_read_i_19\
    );
\gaxis_fifo.gaxisf.gaxis_pkt_fifo.axis_wr_eop_d1_reg\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => '1',
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => axis_wr_eop,
      Q => axis_wr_eop_d1
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_26_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(0)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[10]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_36_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(10)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[11]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_37_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(11)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_27_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(1)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_28_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(2)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_29_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(3)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_30_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(4)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_31_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(5)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_32_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(6)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_33_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(7)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[8]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_34_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(8)
    );
\gaxis_fifo.gaxisf.gdc_pkt.axis_dc_pkt_fifo_reg[9]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => s_aclk,
      CE => \n_38_gaxis_fifo.gaxisf.axisf\,
      CLR => \n_0_gaxis_fifo.gaxisf.axisf\,
      D => \n_35_gaxis_fifo.gaxisf.axisf\,
      Q => \^axis_data_count\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \fifo_generator_0_fifo_generator_v12_0__parameterized0\ is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 9 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 9 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 11 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 11 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 11 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "fifo_generator_v12_0";
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 8;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 8;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "zynq";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "BlankString";
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "4kx4";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1024;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1024;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 32;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 64;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 8;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is "2kx18";
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 64;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 11;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 16;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1024;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2048;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 10;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 11;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2047;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 2046;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ : entity is 0;
end \fifo_generator_0_fifo_generator_v12_0__parameterized0\;

architecture STRUCTURE of \fifo_generator_0_fifo_generator_v12_0__parameterized0\ is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  almost_empty <= \<const1>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const0>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(11) <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(11) <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(9) <= \<const0>\;
  data_count(8) <= \<const0>\;
  data_count(7) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  dout(7) <= \<const0>\;
  dout(6) <= \<const0>\;
  dout(5) <= \<const0>\;
  dout(4) <= \<const0>\;
  dout(3) <= \<const0>\;
  dout(2) <= \<const0>\;
  dout(1) <= \<const0>\;
  dout(0) <= \<const0>\;
  empty <= \<const1>\;
  full <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const1>\;
  prog_full <= \<const0>\;
  rd_data_count(9) <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  valid <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(9) <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const0>\;
GND: unisim.vcomponents.GND
    port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.fifo_generator_0_fifo_generator_v12_0_synth
    port map (
      DIADI(10 downto 3) => s_axis_tdata(7 downto 0),
      DIADI(2) => s_axis_tstrb(0),
      DIADI(1) => s_axis_tkeep(0),
      DIADI(0) => s_axis_tlast,
      Q(10 downto 3) => m_axis_tdata(7 downto 0),
      Q(2) => m_axis_tstrb(0),
      Q(1) => m_axis_tkeep(0),
      Q(0) => m_axis_tlast,
      axis_data_count(11 downto 0) => axis_data_count(11 downto 0),
      m_axis_tready => m_axis_tready,
      m_axis_tvalid => m_axis_tvalid,
      s_aclk => s_aclk,
      s_aresetn => s_aresetn,
      s_axis_tready => s_axis_tready,
      s_axis_tvalid => s_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_generator_0 is
  port (
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    axis_data_count : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fifo_generator_0 : entity is true;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_generator_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of fifo_generator_0 : entity is "fifo_generator_v12_0,Vivado 2014.2";
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of fifo_generator_0 : entity is "fifo_generator_0,fifo_generator_v12_0,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of fifo_generator_0 : entity is "fifo_generator_0,fifo_generator_v12_0,{x_ipProduct=Vivado 2014.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=fifo_generator,x_ipVersion=12.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,C_COMMON_CLOCK=1,C_COUNT_TYPE=0,C_DATA_COUNT_WIDTH=10,C_DEFAULT_VALUE=BlankString,C_DIN_WIDTH=8,C_DOUT_RST_VAL=0,C_DOUT_WIDTH=8,C_ENABLE_RLOCS=0,C_FAMILY=zynq,C_FULL_FLAGS_RST_VAL=0,C_HAS_ALMOST_EMPTY=0,C_HAS_ALMOST_FULL=0,C_HAS_BACKUP=0,C_HAS_DATA_COUNT=0,C_HAS_INT_CLK=0,C_HAS_MEMINIT_FILE=0,C_HAS_OVERFLOW=0,C_HAS_RD_DATA_COUNT=0,C_HAS_RD_RST=0,C_HAS_RST=1,C_HAS_SRST=0,C_HAS_UNDERFLOW=0,C_HAS_VALID=0,C_HAS_WR_ACK=0,C_HAS_WR_DATA_COUNT=0,C_HAS_WR_RST=0,C_IMPLEMENTATION_TYPE=0,C_INIT_WR_PNTR_VAL=0,C_MEMORY_TYPE=1,C_MIF_FILE_NAME=BlankString,C_OPTIMIZATION_MODE=0,C_OVERFLOW_LOW=0,C_PRELOAD_LATENCY=0,C_PRELOAD_REGS=1,C_PRIM_FIFO_TYPE=4kx4,C_PROG_EMPTY_THRESH_ASSERT_VAL=4,C_PROG_EMPTY_THRESH_NEGATE_VAL=5,C_PROG_EMPTY_TYPE=0,C_PROG_FULL_THRESH_ASSERT_VAL=1023,C_PROG_FULL_THRESH_NEGATE_VAL=1022,C_PROG_FULL_TYPE=0,C_RD_DATA_COUNT_WIDTH=10,C_RD_DEPTH=1024,C_RD_FREQ=1,C_RD_PNTR_WIDTH=10,C_UNDERFLOW_LOW=0,C_USE_DOUT_RST=0,C_USE_ECC=0,C_USE_EMBEDDED_REG=0,C_USE_PIPELINE_REG=0,C_POWER_SAVING_MODE=0,C_USE_FIFO16_FLAGS=0,C_USE_FWFT_DATA_COUNT=0,C_VALID_LOW=0,C_WR_ACK_LOW=0,C_WR_DATA_COUNT_WIDTH=10,C_WR_DEPTH=1024,C_WR_FREQ=1,C_WR_PNTR_WIDTH=10,C_WR_RESPONSE_LATENCY=1,C_MSGON_VAL=1,C_ENABLE_RST_SYNC=1,C_ERROR_INJECTION_TYPE=0,C_SYNCHRONIZER_STAGE=2,C_INTERFACE_TYPE=1,C_AXI_TYPE=1,C_HAS_AXI_WR_CHANNEL=1,C_HAS_AXI_RD_CHANNEL=1,C_HAS_SLAVE_CE=0,C_HAS_MASTER_CE=0,C_ADD_NGC_CONSTRAINT=0,C_USE_COMMON_OVERFLOW=0,C_USE_COMMON_UNDERFLOW=0,C_USE_DEFAULT_SETTINGS=0,C_AXI_ID_WIDTH=1,C_AXI_ADDR_WIDTH=32,C_AXI_DATA_WIDTH=64,C_AXI_LEN_WIDTH=8,C_AXI_LOCK_WIDTH=1,C_HAS_AXI_ID=0,C_HAS_AXI_AWUSER=0,C_HAS_AXI_WUSER=0,C_HAS_AXI_BUSER=0,C_HAS_AXI_ARUSER=0,C_HAS_AXI_RUSER=0,C_AXI_ARUSER_WIDTH=1,C_AXI_AWUSER_WIDTH=1,C_AXI_WUSER_WIDTH=1,C_AXI_BUSER_WIDTH=1,C_AXI_RUSER_WIDTH=1,C_HAS_AXIS_TDATA=1,C_HAS_AXIS_TID=0,C_HAS_AXIS_TDEST=0,C_HAS_AXIS_TUSER=0,C_HAS_AXIS_TREADY=1,C_HAS_AXIS_TLAST=1,C_HAS_AXIS_TSTRB=1,C_HAS_AXIS_TKEEP=1,C_AXIS_TDATA_WIDTH=8,C_AXIS_TID_WIDTH=1,C_AXIS_TDEST_WIDTH=1,C_AXIS_TUSER_WIDTH=1,C_AXIS_TSTRB_WIDTH=1,C_AXIS_TKEEP_WIDTH=1,C_WACH_TYPE=0,C_WDCH_TYPE=0,C_WRCH_TYPE=0,C_RACH_TYPE=0,C_RDCH_TYPE=0,C_AXIS_TYPE=0,C_IMPLEMENTATION_TYPE_WACH=2,C_IMPLEMENTATION_TYPE_WDCH=1,C_IMPLEMENTATION_TYPE_WRCH=2,C_IMPLEMENTATION_TYPE_RACH=2,C_IMPLEMENTATION_TYPE_RDCH=1,C_IMPLEMENTATION_TYPE_AXIS=1,C_APPLICATION_TYPE_WACH=0,C_APPLICATION_TYPE_WDCH=0,C_APPLICATION_TYPE_WRCH=0,C_APPLICATION_TYPE_RACH=0,C_APPLICATION_TYPE_RDCH=0,C_APPLICATION_TYPE_AXIS=1,C_PRIM_FIFO_TYPE_WACH=512x36,C_PRIM_FIFO_TYPE_WDCH=1kx36,C_PRIM_FIFO_TYPE_WRCH=512x36,C_PRIM_FIFO_TYPE_RACH=512x36,C_PRIM_FIFO_TYPE_RDCH=1kx36,C_PRIM_FIFO_TYPE_AXIS=2kx18,C_USE_ECC_WACH=0,C_USE_ECC_WDCH=0,C_USE_ECC_WRCH=0,C_USE_ECC_RACH=0,C_USE_ECC_RDCH=0,C_USE_ECC_AXIS=0,C_ERROR_INJECTION_TYPE_WACH=0,C_ERROR_INJECTION_TYPE_WDCH=0,C_ERROR_INJECTION_TYPE_WRCH=0,C_ERROR_INJECTION_TYPE_RACH=0,C_ERROR_INJECTION_TYPE_RDCH=0,C_ERROR_INJECTION_TYPE_AXIS=0,C_DIN_WIDTH_WACH=32,C_DIN_WIDTH_WDCH=64,C_DIN_WIDTH_WRCH=2,C_DIN_WIDTH_RACH=32,C_DIN_WIDTH_RDCH=64,C_DIN_WIDTH_AXIS=11,C_WR_DEPTH_WACH=16,C_WR_DEPTH_WDCH=1024,C_WR_DEPTH_WRCH=16,C_WR_DEPTH_RACH=16,C_WR_DEPTH_RDCH=1024,C_WR_DEPTH_AXIS=2048,C_WR_PNTR_WIDTH_WACH=4,C_WR_PNTR_WIDTH_WDCH=10,C_WR_PNTR_WIDTH_WRCH=4,C_WR_PNTR_WIDTH_RACH=4,C_WR_PNTR_WIDTH_RDCH=10,C_WR_PNTR_WIDTH_AXIS=11,C_HAS_DATA_COUNTS_WACH=0,C_HAS_DATA_COUNTS_WDCH=0,C_HAS_DATA_COUNTS_WRCH=0,C_HAS_DATA_COUNTS_RACH=0,C_HAS_DATA_COUNTS_RDCH=0,C_HAS_DATA_COUNTS_AXIS=1,C_HAS_PROG_FLAGS_WACH=0,C_HAS_PROG_FLAGS_WDCH=0,C_HAS_PROG_FLAGS_WRCH=0,C_HAS_PROG_FLAGS_RACH=0,C_HAS_PROG_FLAGS_RDCH=0,C_HAS_PROG_FLAGS_AXIS=0,C_PROG_FULL_TYPE_WACH=0,C_PROG_FULL_TYPE_WDCH=0,C_PROG_FULL_TYPE_WRCH=0,C_PROG_FULL_TYPE_RACH=0,C_PROG_FULL_TYPE_RDCH=0,C_PROG_FULL_TYPE_AXIS=0,C_PROG_FULL_THRESH_ASSERT_VAL_WACH=15,C_PROG_FULL_THRESH_ASSERT_VAL_WDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_WRCH=15,C_PROG_FULL_THRESH_ASSERT_VAL_RACH=15,C_PROG_FULL_THRESH_ASSERT_VAL_RDCH=1023,C_PROG_FULL_THRESH_ASSERT_VAL_AXIS=2047,C_PROG_EMPTY_TYPE_WACH=0,C_PROG_EMPTY_TYPE_WDCH=0,C_PROG_EMPTY_TYPE_WRCH=0,C_PROG_EMPTY_TYPE_RACH=0,C_PROG_EMPTY_TYPE_RDCH=0,C_PROG_EMPTY_TYPE_AXIS=0,C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH=14,C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH=14,C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH=14,C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH=1022,C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS=2046,C_REG_SLICE_MODE_WACH=0,C_REG_SLICE_MODE_WDCH=0,C_REG_SLICE_MODE_WRCH=0,C_REG_SLICE_MODE_RACH=0,C_REG_SLICE_MODE_RDCH=0,C_REG_SLICE_MODE_AXIS=0}";
end fifo_generator_0;

architecture STRUCTURE of fifo_generator_0 is
  signal NLW_U0_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_valid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_dout_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of U0 : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of U0 : label is 1;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of U0 : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of U0 : label is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of U0 : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of U0 : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of U0 : label is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of U0 : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of U0 : label is 1;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of U0 : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of U0 : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of U0 : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of U0 : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of U0 : label is 1;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 10;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 8;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of U0 : label is 11;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of U0 : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of U0 : label is 32;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of U0 : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of U0 : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of U0 : label is 8;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of U0 : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of U0 : label is 1;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynq";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of U0 : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of U0 : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of U0 : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of U0 : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of U0 : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of U0 : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of U0 : label is 1;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of U0 : label is 1;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of U0 : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of U0 : label is 1;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of U0 : label is 0;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of U0 : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of U0 : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of U0 : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of U0 : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of U0 : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of U0 : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of U0 : label is 1;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of U0 : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of U0 : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of U0 : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of U0 : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of U0 : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of U0 : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of U0 : label is 1;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of U0 : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of U0 : label is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of U0 : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of U0 : label is 0;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of U0 : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 2;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 2;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 2;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of U0 : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 1;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of U0 : label is 1;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of U0 : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of U0 : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of U0 : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of U0 : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of U0 : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of U0 : label is 0;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of U0 : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of U0 : label is "4kx4";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of U0 : label is "2kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of U0 : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 4;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of U0 : label is 2046;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of U0 : label is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of U0 : label is 14;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of U0 : label is 14;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 5;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of U0 : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of U0 : label is 2047;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of U0 : label is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of U0 : label is 15;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of U0 : label is 15;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 1022;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of U0 : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of U0 : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of U0 : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 10;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 1024;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 1;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 10;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of U0 : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of U0 : label is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of U0 : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of U0 : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of U0 : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of U0 : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of U0 : label is 0;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of U0 : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of U0 : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of U0 : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of U0 : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of U0 : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of U0 : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of U0 : label is 0;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of U0 : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of U0 : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of U0 : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of U0 : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of U0 : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of U0 : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of U0 : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of U0 : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 10;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 1024;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of U0 : label is 2048;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of U0 : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of U0 : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of U0 : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of U0 : label is 1;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of U0 : label is 11;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of U0 : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of U0 : label is 1;
begin
U0: entity work.\fifo_generator_0_fifo_generator_v12_0__parameterized0\
    port map (
      almost_empty => NLW_U0_almost_empty_UNCONNECTED,
      almost_full => NLW_U0_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_U0_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_U0_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_U0_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_U0_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3) => '0',
      axi_ar_prog_empty_thresh(2) => '0',
      axi_ar_prog_empty_thresh(1) => '0',
      axi_ar_prog_empty_thresh(0) => '0',
      axi_ar_prog_full => NLW_U0_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3) => '0',
      axi_ar_prog_full_thresh(2) => '0',
      axi_ar_prog_full_thresh(1) => '0',
      axi_ar_prog_full_thresh(0) => '0',
      axi_ar_rd_data_count(4 downto 0) => NLW_U0_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_U0_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_U0_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_U0_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_U0_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_U0_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_U0_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_U0_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3) => '0',
      axi_aw_prog_empty_thresh(2) => '0',
      axi_aw_prog_empty_thresh(1) => '0',
      axi_aw_prog_empty_thresh(0) => '0',
      axi_aw_prog_full => NLW_U0_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3) => '0',
      axi_aw_prog_full_thresh(2) => '0',
      axi_aw_prog_full_thresh(1) => '0',
      axi_aw_prog_full_thresh(0) => '0',
      axi_aw_rd_data_count(4 downto 0) => NLW_U0_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_U0_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_U0_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_U0_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_U0_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_U0_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_U0_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_U0_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3) => '0',
      axi_b_prog_empty_thresh(2) => '0',
      axi_b_prog_empty_thresh(1) => '0',
      axi_b_prog_empty_thresh(0) => '0',
      axi_b_prog_full => NLW_U0_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3) => '0',
      axi_b_prog_full_thresh(2) => '0',
      axi_b_prog_full_thresh(1) => '0',
      axi_b_prog_full_thresh(0) => '0',
      axi_b_rd_data_count(4 downto 0) => NLW_U0_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_U0_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_U0_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_U0_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_U0_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_U0_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_U0_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_U0_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9) => '0',
      axi_r_prog_empty_thresh(8) => '0',
      axi_r_prog_empty_thresh(7) => '0',
      axi_r_prog_empty_thresh(6) => '0',
      axi_r_prog_empty_thresh(5) => '0',
      axi_r_prog_empty_thresh(4) => '0',
      axi_r_prog_empty_thresh(3) => '0',
      axi_r_prog_empty_thresh(2) => '0',
      axi_r_prog_empty_thresh(1) => '0',
      axi_r_prog_empty_thresh(0) => '0',
      axi_r_prog_full => NLW_U0_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9) => '0',
      axi_r_prog_full_thresh(8) => '0',
      axi_r_prog_full_thresh(7) => '0',
      axi_r_prog_full_thresh(6) => '0',
      axi_r_prog_full_thresh(5) => '0',
      axi_r_prog_full_thresh(4) => '0',
      axi_r_prog_full_thresh(3) => '0',
      axi_r_prog_full_thresh(2) => '0',
      axi_r_prog_full_thresh(1) => '0',
      axi_r_prog_full_thresh(0) => '0',
      axi_r_rd_data_count(10 downto 0) => NLW_U0_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_U0_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_U0_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_U0_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_U0_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_U0_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_U0_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_U0_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9) => '0',
      axi_w_prog_empty_thresh(8) => '0',
      axi_w_prog_empty_thresh(7) => '0',
      axi_w_prog_empty_thresh(6) => '0',
      axi_w_prog_empty_thresh(5) => '0',
      axi_w_prog_empty_thresh(4) => '0',
      axi_w_prog_empty_thresh(3) => '0',
      axi_w_prog_empty_thresh(2) => '0',
      axi_w_prog_empty_thresh(1) => '0',
      axi_w_prog_empty_thresh(0) => '0',
      axi_w_prog_full => NLW_U0_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9) => '0',
      axi_w_prog_full_thresh(8) => '0',
      axi_w_prog_full_thresh(7) => '0',
      axi_w_prog_full_thresh(6) => '0',
      axi_w_prog_full_thresh(5) => '0',
      axi_w_prog_full_thresh(4) => '0',
      axi_w_prog_full_thresh(3) => '0',
      axi_w_prog_full_thresh(2) => '0',
      axi_w_prog_full_thresh(1) => '0',
      axi_w_prog_full_thresh(0) => '0',
      axi_w_rd_data_count(10 downto 0) => NLW_U0_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_U0_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_U0_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_U0_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(11 downto 0) => axis_data_count(11 downto 0),
      axis_dbiterr => NLW_U0_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_U0_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_U0_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(10) => '0',
      axis_prog_empty_thresh(9) => '0',
      axis_prog_empty_thresh(8) => '0',
      axis_prog_empty_thresh(7) => '0',
      axis_prog_empty_thresh(6) => '0',
      axis_prog_empty_thresh(5) => '0',
      axis_prog_empty_thresh(4) => '0',
      axis_prog_empty_thresh(3) => '0',
      axis_prog_empty_thresh(2) => '0',
      axis_prog_empty_thresh(1) => '0',
      axis_prog_empty_thresh(0) => '0',
      axis_prog_full => NLW_U0_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(10) => '0',
      axis_prog_full_thresh(9) => '0',
      axis_prog_full_thresh(8) => '0',
      axis_prog_full_thresh(7) => '0',
      axis_prog_full_thresh(6) => '0',
      axis_prog_full_thresh(5) => '0',
      axis_prog_full_thresh(4) => '0',
      axis_prog_full_thresh(3) => '0',
      axis_prog_full_thresh(2) => '0',
      axis_prog_full_thresh(1) => '0',
      axis_prog_full_thresh(0) => '0',
      axis_rd_data_count(11 downto 0) => NLW_U0_axis_rd_data_count_UNCONNECTED(11 downto 0),
      axis_sbiterr => NLW_U0_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_U0_axis_underflow_UNCONNECTED,
      axis_wr_data_count(11 downto 0) => NLW_U0_axis_wr_data_count_UNCONNECTED(11 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => '0',
      data_count(9 downto 0) => NLW_U0_data_count_UNCONNECTED(9 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(7) => '0',
      din(6) => '0',
      din(5) => '0',
      din(4) => '0',
      din(3) => '0',
      din(2) => '0',
      din(1) => '0',
      din(0) => '0',
      dout(7 downto 0) => NLW_U0_dout_UNCONNECTED(7 downto 0),
      empty => NLW_U0_empty_UNCONNECTED,
      full => NLW_U0_full_UNCONNECTED,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_U0_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_U0_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_U0_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_U0_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_U0_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_U0_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_U0_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_U0_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_U0_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_U0_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_U0_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_U0_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_U0_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_U0_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_U0_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_U0_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_U0_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_U0_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_U0_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_U0_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_U0_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_U0_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_U0_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_U0_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_U0_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1) => '0',
      m_axi_bresp(0) => '0',
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63) => '0',
      m_axi_rdata(62) => '0',
      m_axi_rdata(61) => '0',
      m_axi_rdata(60) => '0',
      m_axi_rdata(59) => '0',
      m_axi_rdata(58) => '0',
      m_axi_rdata(57) => '0',
      m_axi_rdata(56) => '0',
      m_axi_rdata(55) => '0',
      m_axi_rdata(54) => '0',
      m_axi_rdata(53) => '0',
      m_axi_rdata(52) => '0',
      m_axi_rdata(51) => '0',
      m_axi_rdata(50) => '0',
      m_axi_rdata(49) => '0',
      m_axi_rdata(48) => '0',
      m_axi_rdata(47) => '0',
      m_axi_rdata(46) => '0',
      m_axi_rdata(45) => '0',
      m_axi_rdata(44) => '0',
      m_axi_rdata(43) => '0',
      m_axi_rdata(42) => '0',
      m_axi_rdata(41) => '0',
      m_axi_rdata(40) => '0',
      m_axi_rdata(39) => '0',
      m_axi_rdata(38) => '0',
      m_axi_rdata(37) => '0',
      m_axi_rdata(36) => '0',
      m_axi_rdata(35) => '0',
      m_axi_rdata(34) => '0',
      m_axi_rdata(33) => '0',
      m_axi_rdata(32) => '0',
      m_axi_rdata(31) => '0',
      m_axi_rdata(30) => '0',
      m_axi_rdata(29) => '0',
      m_axi_rdata(28) => '0',
      m_axi_rdata(27) => '0',
      m_axi_rdata(26) => '0',
      m_axi_rdata(25) => '0',
      m_axi_rdata(24) => '0',
      m_axi_rdata(23) => '0',
      m_axi_rdata(22) => '0',
      m_axi_rdata(21) => '0',
      m_axi_rdata(20) => '0',
      m_axi_rdata(19) => '0',
      m_axi_rdata(18) => '0',
      m_axi_rdata(17) => '0',
      m_axi_rdata(16) => '0',
      m_axi_rdata(15) => '0',
      m_axi_rdata(14) => '0',
      m_axi_rdata(13) => '0',
      m_axi_rdata(12) => '0',
      m_axi_rdata(11) => '0',
      m_axi_rdata(10) => '0',
      m_axi_rdata(9) => '0',
      m_axi_rdata(8) => '0',
      m_axi_rdata(7) => '0',
      m_axi_rdata(6) => '0',
      m_axi_rdata(5) => '0',
      m_axi_rdata(4) => '0',
      m_axi_rdata(3) => '0',
      m_axi_rdata(2) => '0',
      m_axi_rdata(1) => '0',
      m_axi_rdata(0) => '0',
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_U0_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1) => '0',
      m_axi_rresp(0) => '0',
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_U0_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_U0_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_U0_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_U0_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_U0_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_U0_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => m_axis_tdata(7 downto 0),
      m_axis_tdest(0) => NLW_U0_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_U0_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => m_axis_tkeep(0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(0) => m_axis_tstrb(0),
      m_axis_tuser(0) => NLW_U0_m_axis_tuser_UNCONNECTED(0),
      m_axis_tvalid => m_axis_tvalid,
      overflow => NLW_U0_overflow_UNCONNECTED,
      prog_empty => NLW_U0_prog_empty_UNCONNECTED,
      prog_empty_thresh(9) => '0',
      prog_empty_thresh(8) => '0',
      prog_empty_thresh(7) => '0',
      prog_empty_thresh(6) => '0',
      prog_empty_thresh(5) => '0',
      prog_empty_thresh(4) => '0',
      prog_empty_thresh(3) => '0',
      prog_empty_thresh(2) => '0',
      prog_empty_thresh(1) => '0',
      prog_empty_thresh(0) => '0',
      prog_empty_thresh_assert(9) => '0',
      prog_empty_thresh_assert(8) => '0',
      prog_empty_thresh_assert(7) => '0',
      prog_empty_thresh_assert(6) => '0',
      prog_empty_thresh_assert(5) => '0',
      prog_empty_thresh_assert(4) => '0',
      prog_empty_thresh_assert(3) => '0',
      prog_empty_thresh_assert(2) => '0',
      prog_empty_thresh_assert(1) => '0',
      prog_empty_thresh_assert(0) => '0',
      prog_empty_thresh_negate(9) => '0',
      prog_empty_thresh_negate(8) => '0',
      prog_empty_thresh_negate(7) => '0',
      prog_empty_thresh_negate(6) => '0',
      prog_empty_thresh_negate(5) => '0',
      prog_empty_thresh_negate(4) => '0',
      prog_empty_thresh_negate(3) => '0',
      prog_empty_thresh_negate(2) => '0',
      prog_empty_thresh_negate(1) => '0',
      prog_empty_thresh_negate(0) => '0',
      prog_full => NLW_U0_prog_full_UNCONNECTED,
      prog_full_thresh(9) => '0',
      prog_full_thresh(8) => '0',
      prog_full_thresh(7) => '0',
      prog_full_thresh(6) => '0',
      prog_full_thresh(5) => '0',
      prog_full_thresh(4) => '0',
      prog_full_thresh(3) => '0',
      prog_full_thresh(2) => '0',
      prog_full_thresh(1) => '0',
      prog_full_thresh(0) => '0',
      prog_full_thresh_assert(9) => '0',
      prog_full_thresh_assert(8) => '0',
      prog_full_thresh_assert(7) => '0',
      prog_full_thresh_assert(6) => '0',
      prog_full_thresh_assert(5) => '0',
      prog_full_thresh_assert(4) => '0',
      prog_full_thresh_assert(3) => '0',
      prog_full_thresh_assert(2) => '0',
      prog_full_thresh_assert(1) => '0',
      prog_full_thresh_assert(0) => '0',
      prog_full_thresh_negate(9) => '0',
      prog_full_thresh_negate(8) => '0',
      prog_full_thresh_negate(7) => '0',
      prog_full_thresh_negate(6) => '0',
      prog_full_thresh_negate(5) => '0',
      prog_full_thresh_negate(4) => '0',
      prog_full_thresh_negate(3) => '0',
      prog_full_thresh_negate(2) => '0',
      prog_full_thresh_negate(1) => '0',
      prog_full_thresh_negate(0) => '0',
      rd_clk => '0',
      rd_data_count(9 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(9 downto 0),
      rd_en => '0',
      rd_rst => '0',
      rd_rst_busy => NLW_U0_rd_rst_busy_UNCONNECTED,
      rst => '0',
      s_aclk => s_aclk,
      s_aclk_en => '0',
      s_aresetn => s_aresetn,
      s_axi_araddr(31) => '0',
      s_axi_araddr(30) => '0',
      s_axi_araddr(29) => '0',
      s_axi_araddr(28) => '0',
      s_axi_araddr(27) => '0',
      s_axi_araddr(26) => '0',
      s_axi_araddr(25) => '0',
      s_axi_araddr(24) => '0',
      s_axi_araddr(23) => '0',
      s_axi_araddr(22) => '0',
      s_axi_araddr(21) => '0',
      s_axi_araddr(20) => '0',
      s_axi_araddr(19) => '0',
      s_axi_araddr(18) => '0',
      s_axi_araddr(17) => '0',
      s_axi_araddr(16) => '0',
      s_axi_araddr(15) => '0',
      s_axi_araddr(14) => '0',
      s_axi_araddr(13) => '0',
      s_axi_araddr(12) => '0',
      s_axi_araddr(11) => '0',
      s_axi_araddr(10) => '0',
      s_axi_araddr(9) => '0',
      s_axi_araddr(8) => '0',
      s_axi_araddr(7) => '0',
      s_axi_araddr(6) => '0',
      s_axi_araddr(5) => '0',
      s_axi_araddr(4) => '0',
      s_axi_araddr(3) => '0',
      s_axi_araddr(2) => '0',
      s_axi_araddr(1) => '0',
      s_axi_araddr(0) => '0',
      s_axi_arburst(1) => '0',
      s_axi_arburst(0) => '0',
      s_axi_arcache(3) => '0',
      s_axi_arcache(2) => '0',
      s_axi_arcache(1) => '0',
      s_axi_arcache(0) => '0',
      s_axi_arid(0) => '0',
      s_axi_arlen(7) => '0',
      s_axi_arlen(6) => '0',
      s_axi_arlen(5) => '0',
      s_axi_arlen(4) => '0',
      s_axi_arlen(3) => '0',
      s_axi_arlen(2) => '0',
      s_axi_arlen(1) => '0',
      s_axi_arlen(0) => '0',
      s_axi_arlock(0) => '0',
      s_axi_arprot(2) => '0',
      s_axi_arprot(1) => '0',
      s_axi_arprot(0) => '0',
      s_axi_arqos(3) => '0',
      s_axi_arqos(2) => '0',
      s_axi_arqos(1) => '0',
      s_axi_arqos(0) => '0',
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3) => '0',
      s_axi_arregion(2) => '0',
      s_axi_arregion(1) => '0',
      s_axi_arregion(0) => '0',
      s_axi_arsize(2) => '0',
      s_axi_arsize(1) => '0',
      s_axi_arsize(0) => '0',
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31) => '0',
      s_axi_awaddr(30) => '0',
      s_axi_awaddr(29) => '0',
      s_axi_awaddr(28) => '0',
      s_axi_awaddr(27) => '0',
      s_axi_awaddr(26) => '0',
      s_axi_awaddr(25) => '0',
      s_axi_awaddr(24) => '0',
      s_axi_awaddr(23) => '0',
      s_axi_awaddr(22) => '0',
      s_axi_awaddr(21) => '0',
      s_axi_awaddr(20) => '0',
      s_axi_awaddr(19) => '0',
      s_axi_awaddr(18) => '0',
      s_axi_awaddr(17) => '0',
      s_axi_awaddr(16) => '0',
      s_axi_awaddr(15) => '0',
      s_axi_awaddr(14) => '0',
      s_axi_awaddr(13) => '0',
      s_axi_awaddr(12) => '0',
      s_axi_awaddr(11) => '0',
      s_axi_awaddr(10) => '0',
      s_axi_awaddr(9) => '0',
      s_axi_awaddr(8) => '0',
      s_axi_awaddr(7) => '0',
      s_axi_awaddr(6) => '0',
      s_axi_awaddr(5) => '0',
      s_axi_awaddr(4) => '0',
      s_axi_awaddr(3) => '0',
      s_axi_awaddr(2) => '0',
      s_axi_awaddr(1) => '0',
      s_axi_awaddr(0) => '0',
      s_axi_awburst(1) => '0',
      s_axi_awburst(0) => '0',
      s_axi_awcache(3) => '0',
      s_axi_awcache(2) => '0',
      s_axi_awcache(1) => '0',
      s_axi_awcache(0) => '0',
      s_axi_awid(0) => '0',
      s_axi_awlen(7) => '0',
      s_axi_awlen(6) => '0',
      s_axi_awlen(5) => '0',
      s_axi_awlen(4) => '0',
      s_axi_awlen(3) => '0',
      s_axi_awlen(2) => '0',
      s_axi_awlen(1) => '0',
      s_axi_awlen(0) => '0',
      s_axi_awlock(0) => '0',
      s_axi_awprot(2) => '0',
      s_axi_awprot(1) => '0',
      s_axi_awprot(0) => '0',
      s_axi_awqos(3) => '0',
      s_axi_awqos(2) => '0',
      s_axi_awqos(1) => '0',
      s_axi_awqos(0) => '0',
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3) => '0',
      s_axi_awregion(2) => '0',
      s_axi_awregion(1) => '0',
      s_axi_awregion(0) => '0',
      s_axi_awsize(2) => '0',
      s_axi_awsize(1) => '0',
      s_axi_awsize(0) => '0',
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_U0_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_U0_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63) => '0',
      s_axi_wdata(62) => '0',
      s_axi_wdata(61) => '0',
      s_axi_wdata(60) => '0',
      s_axi_wdata(59) => '0',
      s_axi_wdata(58) => '0',
      s_axi_wdata(57) => '0',
      s_axi_wdata(56) => '0',
      s_axi_wdata(55) => '0',
      s_axi_wdata(54) => '0',
      s_axi_wdata(53) => '0',
      s_axi_wdata(52) => '0',
      s_axi_wdata(51) => '0',
      s_axi_wdata(50) => '0',
      s_axi_wdata(49) => '0',
      s_axi_wdata(48) => '0',
      s_axi_wdata(47) => '0',
      s_axi_wdata(46) => '0',
      s_axi_wdata(45) => '0',
      s_axi_wdata(44) => '0',
      s_axi_wdata(43) => '0',
      s_axi_wdata(42) => '0',
      s_axi_wdata(41) => '0',
      s_axi_wdata(40) => '0',
      s_axi_wdata(39) => '0',
      s_axi_wdata(38) => '0',
      s_axi_wdata(37) => '0',
      s_axi_wdata(36) => '0',
      s_axi_wdata(35) => '0',
      s_axi_wdata(34) => '0',
      s_axi_wdata(33) => '0',
      s_axi_wdata(32) => '0',
      s_axi_wdata(31) => '0',
      s_axi_wdata(30) => '0',
      s_axi_wdata(29) => '0',
      s_axi_wdata(28) => '0',
      s_axi_wdata(27) => '0',
      s_axi_wdata(26) => '0',
      s_axi_wdata(25) => '0',
      s_axi_wdata(24) => '0',
      s_axi_wdata(23) => '0',
      s_axi_wdata(22) => '0',
      s_axi_wdata(21) => '0',
      s_axi_wdata(20) => '0',
      s_axi_wdata(19) => '0',
      s_axi_wdata(18) => '0',
      s_axi_wdata(17) => '0',
      s_axi_wdata(16) => '0',
      s_axi_wdata(15) => '0',
      s_axi_wdata(14) => '0',
      s_axi_wdata(13) => '0',
      s_axi_wdata(12) => '0',
      s_axi_wdata(11) => '0',
      s_axi_wdata(10) => '0',
      s_axi_wdata(9) => '0',
      s_axi_wdata(8) => '0',
      s_axi_wdata(7) => '0',
      s_axi_wdata(6) => '0',
      s_axi_wdata(5) => '0',
      s_axi_wdata(4) => '0',
      s_axi_wdata(3) => '0',
      s_axi_wdata(2) => '0',
      s_axi_wdata(1) => '0',
      s_axi_wdata(0) => '0',
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7) => '0',
      s_axi_wstrb(6) => '0',
      s_axi_wstrb(5) => '0',
      s_axi_wstrb(4) => '0',
      s_axi_wstrb(3) => '0',
      s_axi_wstrb(2) => '0',
      s_axi_wstrb(1) => '0',
      s_axi_wstrb(0) => '0',
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7 downto 0) => s_axis_tdata(7 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => s_axis_tkeep(0),
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(0) => s_axis_tstrb(0),
      s_axis_tuser(0) => '0',
      s_axis_tvalid => s_axis_tvalid,
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => '0',
      underflow => NLW_U0_underflow_UNCONNECTED,
      valid => NLW_U0_valid_UNCONNECTED,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => '0',
      wr_data_count(9 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(9 downto 0),
      wr_en => '0',
      wr_rst => '0',
      wr_rst_busy => NLW_U0_wr_rst_busy_UNCONNECTED
    );
end STRUCTURE;
