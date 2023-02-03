--            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
--                    Version 2, December 2004
--
-- Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
--
-- Everyone is permitted to copy and distribute verbatim or modified
-- copies of this license document, and changing it is allowed as long
-- as the name is changed.
--
--            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
--   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
--
--  0. You just DO WHAT THE FUCK YOU WANT TO.
--

-- -- TestBench
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testBenchEvenOdd is
end testBenchEvenOdd;

architecture testEvenOdd of testBenchEvenOdd is

    -- Declare component for TestBench use
    component decideEvenOdd port (
        bit0 : in  std_logic;
        bit1 : in  std_logic;
        bit2 : in  std_logic;
        bit3 : in  std_logic;
        bit4 : in  std_logic;
        bit5 : in  std_logic;
        even:  out std_logic;
        odd:   out std_logic
    ); end component;

    -- Inputs
    signal bit0 : std_logic;
    signal bit1 : std_logic;
    signal bit2 : std_logic;
    signal bit3 : std_logic;
    signal bit4 : std_logic;
    signal bit5 : std_logic;

    -- Outputs
    signal even:  std_logic;
    signal odd:   std_logic;

begin

    -- Creates Even or Odd instance
    deciderInstance: decideEvenOdd port map(
        bit0  => bit0 ,
        bit1  => bit1 ,
        bit2  => bit2 ,
        bit3  => bit3 ,
        bit4  => bit4 ,
        bit5  => bit5 ,
        even  => even,
        odd   => odd
    );

    -- Flips bit 0 every 10 ns
    flippingProcess0: process
        begin loop
            bit0  <= '0';
            wait for 10 ns;
            bit0  <= '1';
            wait for 10 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess0;

    -- Flips bit 1 every 20 ns
    flippingProcess1: process
        begin loop
            bit1  <= '0';
            wait for 20 ns;
            bit1  <= '1';
            wait for 20 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess1;

    -- Flips bit 2 every 40 ns
    flippingProcess2: process
        begin loop
            bit2  <= '0';
            wait for 40 ns;
            bit2  <= '1';
            wait for 40 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess2;

    -- Flips bit 3 every 80 ns
    flippingProcess3: process
        begin loop
            bit3  <= '0';
            wait for 80 ns;
            bit3  <= '1';
            wait for 80 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess3;

    -- Flips bit 4 every 160 ns
    flippingProcess4: process
        begin loop
            bit4  <= '0';
            wait for 160 ns;
            bit4  <= '1';
            wait for 160 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess4;

    -- Flips bit 5 every 320 ns
    flippingProcess5: process
        begin loop
            bit5  <= '0';
            wait for 320 ns;
            bit5  <= '1';
            wait for 320 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess5;
end testEvenOdd;


-- -- Even or Odd decider implementation
library IEEE;
use IEEE.std_logic_1164.all;

entity decideEvenOdd is
    port (
        bit0 : in  std_logic;
        bit1 : in  std_logic;
        bit2 : in  std_logic;
        bit3 : in  std_logic;
        bit4 : in  std_logic;
        bit5 : in  std_logic;
        even:  out std_logic;
        odd:   out std_logic
    );
end decideEvenOdd;

architecture tellMeEvenOdd of decideEvenOdd is
    -- Temporary processing signal (concatenate all bits)
    signal concatenatedBits: std_logic_vector(5 downto 0);
begin
    concatenatedBits <= bit5 & bit4 & bit3 & bit2 & bit1 & bit0;

    -- Truth table for when number is even
    with concatenatedBits select even <=
        '1' when "000000",
        '0' when "000001",
        '1' when "000010",
        '0' when "000011",
        '1' when "000100",
        '0' when "000101",
        '1' when "000110",
        '0' when "000111",
        '1' when "001000",
        '0' when "001001",
        '1' when "001010",
        '0' when "001011",
        '1' when "001100",
        '0' when "001101",
        '1' when "001110",
        '0' when "001111",
        '1' when "010000",
        '0' when "010001",
        '1' when "010010",
        '0' when "010011",
        '1' when "010100",
        '0' when "010101",
        '1' when "010110",
        '0' when "010111",
        '1' when "011000",
        '0' when "011001",
        '1' when "011010",
        '0' when "011011",
        '1' when "011100",
        '0' when "011101",
        '1' when "011110",
        '0' when "011111",
        '1' when "100000",
        '0' when "100001",
        '1' when "100010",
        '0' when "100011",
        '1' when "100100",
        '0' when "100101",
        '1' when "100110",
        '0' when "100111",
        '1' when "101000",
        '0' when "101001",
        '1' when "101010",
        '0' when "101011",
        '1' when "101100",
        '0' when "101101",
        '1' when "101110",
        '0' when "101111",
        '1' when "110000",
        '0' when "110001",
        '1' when "110010",
        '0' when "110011",
        '1' when "110100",
        '0' when "110101",
        '1' when "110110",
        '0' when "110111",
        '1' when "111000",
        '0' when "111001",
        '1' when "111010",
        '0' when "111011",
        '1' when "111100",
        '0' when "111101",
        '1' when "111110",
        '0' when "111111",
        '0' when others;

    -- Truth table for when number is odd
    with concatenatedBits select odd <=
        '0' when "000000",
        '1' when "000001",
        '0' when "000010",
        '1' when "000011",
        '0' when "000100",
        '1' when "000101",
        '0' when "000110",
        '1' when "000111",
        '0' when "001000",
        '1' when "001001",
        '0' when "001010",
        '1' when "001011",
        '0' when "001100",
        '1' when "001101",
        '0' when "001110",
        '1' when "001111",
        '0' when "010000",
        '1' when "010001",
        '0' when "010010",
        '1' when "010011",
        '0' when "010100",
        '1' when "010101",
        '0' when "010110",
        '1' when "010111",
        '0' when "011000",
        '1' when "011001",
        '0' when "011010",
        '1' when "011011",
        '0' when "011100",
        '1' when "011101",
        '0' when "011110",
        '1' when "011111",
        '0' when "100000",
        '1' when "100001",
        '0' when "100010",
        '1' when "100011",
        '0' when "100100",
        '1' when "100101",
        '0' when "100110",
        '1' when "100111",
        '0' when "101000",
        '1' when "101001",
        '0' when "101010",
        '1' when "101011",
        '0' when "101100",
        '1' when "101101",
        '0' when "101110",
        '1' when "101111",
        '0' when "110000",
        '1' when "110001",
        '0' when "110010",
        '1' when "110011",
        '0' when "110100",
        '1' when "110101",
        '0' when "110110",
        '1' when "110111",
        '0' when "111000",
        '1' when "111001",
        '0' when "111010",
        '1' when "111011",
        '0' when "111100",
        '1' when "111101",
        '0' when "111110",
        '1' when "111111",
        '0' when others;
end tellMeEvenOdd;

-- Thanks for using my library, hope you have memory for it!!
-- (The speeds are theoretically massive, memory is not an issue)