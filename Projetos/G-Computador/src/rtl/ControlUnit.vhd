-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017

-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre instrução e ALU para reg. A
		muxAM                       : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S e reg. D
	    muxAMD_ALU                  : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
	   loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A, reg. D,
         	                                                           -- Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is


signal jump0, jump1, jump2, jump3, jump4, jump5, jump6, jump7, jump8, jump9, jump10, jump11, jump12, jump13, jump14 : STD_LOGIC;


begin

	loadA <= (instruction(17) and instruction (6)) or not instruction(17);
	loadD <= instruction(17) and instruction (4);
	loadS <= instruction(17) and instruction (5);
	loadM <= instruction(17) and instruction(3);

	jump0 <= not instruction(2) and not instruction(1) and instruction(0) and not zr and not ng; 
	jump1 <= not instruction(2) and instruction(1) and not instruction(0) and zr and not ng;
	jump2 <= not instruction(2) and instruction(1) and not instruction(0) and zr and ng;
	jump3 <= instruction(2) and not instruction(1) and not instruction(0) and not zr and ng;
	jump4 <= not instruction(2) and instruction(1) and instruction(0) and not zr and not ng;
	jump5 <= not instruction(2) and instruction(1) and instruction(0) and zr and not ng;
	jump6 <= not instruction(2) and instruction(1) and instruction(0) and zr and ng;
	jump7 <= instruction(2) and instruction(1) and not instruction(0) and zr and not ng;
	jump8 <= instruction(2) and instruction(1) and not instruction(0) and not zr and ng;
	jump9 <= instruction(2) and instruction(1) and not instruction(0) and zr and ng;
	jump10 <= instruction(2) and not instruction(1) and instruction(0) and not zr and not ng;
	jump11 <= instruction(2) and not instruction(1) and instruction(0) and not zr and ng;
	jump12 <= instruction(2) and instruction(1) and instruction(1); 

	jump13 <= jump0 or jump1 or jump2 or jump3 or jump4 or jump5;
	jump14 <= jump6 or jump7 or jump8 or jump9 or jump10 or jump11;

	loadPC <= instruction(17) and (jump12 or jump13 or jump14);

	zx <= instruction(17) and instruction(12);
	nx <= instruction(17) and instruction(11);
	zy <= instruction(17) and instruction(10);
	ny <= instruction(17) and instruction(9);
	f <= instruction(17) and instruction(8);
	no <= instruction(17) and instruction(7);

	muxALUI_A <= not instruction(17);
	muxAM <= instruction(17) and (instruction(14) and not instruction(15));
	muxSD_ALU <= instruction(17) and instruction(15) and (instruction(13) and (not instruction(14)));
	muxAMD_ALU <= instruction(17) and (not instruction(15));

end architecture;
