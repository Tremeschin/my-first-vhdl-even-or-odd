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
        bit6 : in  std_logic;
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
    signal bit6 : std_logic;

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
        bit6  => bit6 ,
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

    -- Flips bit 6 every 640 ns
    flippingProcess6: process
        begin loop
            bit6  <= '0';
            wait for 640 ns;
            bit6  <= '1';
            wait for 640 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess6;
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
        bit6 : in  std_logic;
        even:  out std_logic;
        odd:   out std_logic
    );
end decideEvenOdd;

architecture tellMeEvenOdd of decideEvenOdd is
    -- Temporary processing signal (concatenate all bits)
    signal concatenatedBits: std_logic_vector(6 downto 0);
begin
    concatenatedBits <= bit6 & bit5 & bit4 & bit3 & bit2 & bit1 & bit0;

    -- Truth table for when number is even
    with concatenatedBits select even <=
        '1' when "0000000",
        '0' when "0000001",
        '1' when "0000010",
        '0' when "0000011",
        '1' when "0000100",
        '0' when "0000101",
        '1' when "0000110",
        '0' when "0000111",
        '1' when "0001000",
        '0' when "0001001",
        '1' when "0001010",
        '0' when "0001011",
        '1' when "0001100",
        '0' when "0001101",
        '1' when "0001110",
        '0' when "0001111",
        '1' when "0010000",
        '0' when "0010001",
        '1' when "0010010",
        '0' when "0010011",
        '1' when "0010100",
        '0' when "0010101",
        '1' when "0010110",
        '0' when "0010111",
        '1' when "0011000",
        '0' when "0011001",
        '1' when "0011010",
        '0' when "0011011",
        '1' when "0011100",
        '0' when "0011101",
        '1' when "0011110",
        '0' when "0011111",
        '1' when "0100000",
        '0' when "0100001",
        '1' when "0100010",
        '0' when "0100011",
        '1' when "0100100",
        '0' when "0100101",
        '1' when "0100110",
        '0' when "0100111",
        '1' when "0101000",
        '0' when "0101001",
        '1' when "0101010",
        '0' when "0101011",
        '1' when "0101100",
        '0' when "0101101",
        '1' when "0101110",
        '0' when "0101111",
        '1' when "0110000",
        '0' when "0110001",
        '1' when "0110010",
        '0' when "0110011",
        '1' when "0110100",
        '0' when "0110101",
        '1' when "0110110",
        '0' when "0110111",
        '1' when "0111000",
        '0' when "0111001",
        '1' when "0111010",
        '0' when "0111011",
        '1' when "0111100",
        '0' when "0111101",
        '1' when "0111110",
        '0' when "0111111",
        '1' when "1000000",
        '0' when "1000001",
        '1' when "1000010",
        '0' when "1000011",
        '1' when "1000100",
        '0' when "1000101",
        '1' when "1000110",
        '0' when "1000111",
        '1' when "1001000",
        '0' when "1001001",
        '1' when "1001010",
        '0' when "1001011",
        '1' when "1001100",
        '0' when "1001101",
        '1' when "1001110",
        '0' when "1001111",
        '1' when "1010000",
        '0' when "1010001",
        '1' when "1010010",
        '0' when "1010011",
        '1' when "1010100",
        '0' when "1010101",
        '1' when "1010110",
        '0' when "1010111",
        '1' when "1011000",
        '0' when "1011001",
        '1' when "1011010",
        '0' when "1011011",
        '1' when "1011100",
        '0' when "1011101",
        '1' when "1011110",
        '0' when "1011111",
        '1' when "1100000",
        '0' when "1100001",
        '1' when "1100010",
        '0' when "1100011",
        '1' when "1100100",
        '0' when "1100101",
        '1' when "1100110",
        '0' when "1100111",
        '1' when "1101000",
        '0' when "1101001",
        '1' when "1101010",
        '0' when "1101011",
        '1' when "1101100",
        '0' when "1101101",
        '1' when "1101110",
        '0' when "1101111",
        '1' when "1110000",
        '0' when "1110001",
        '1' when "1110010",
        '0' when "1110011",
        '1' when "1110100",
        '0' when "1110101",
        '1' when "1110110",
        '0' when "1110111",
        '1' when "1111000",
        '0' when "1111001",
        '1' when "1111010",
        '0' when "1111011",
        '1' when "1111100",
        '0' when "1111101",
        '1' when "1111110",
        '0' when "1111111",
        '0' when others;

    -- Truth table for when number is odd
    with concatenatedBits select odd <=
        '0' when "0000000",
        '1' when "0000001",
        '0' when "0000010",
        '1' when "0000011",
        '0' when "0000100",
        '1' when "0000101",
        '0' when "0000110",
        '1' when "0000111",
        '0' when "0001000",
        '1' when "0001001",
        '0' when "0001010",
        '1' when "0001011",
        '0' when "0001100",
        '1' when "0001101",
        '0' when "0001110",
        '1' when "0001111",
        '0' when "0010000",
        '1' when "0010001",
        '0' when "0010010",
        '1' when "0010011",
        '0' when "0010100",
        '1' when "0010101",
        '0' when "0010110",
        '1' when "0010111",
        '0' when "0011000",
        '1' when "0011001",
        '0' when "0011010",
        '1' when "0011011",
        '0' when "0011100",
        '1' when "0011101",
        '0' when "0011110",
        '1' when "0011111",
        '0' when "0100000",
        '1' when "0100001",
        '0' when "0100010",
        '1' when "0100011",
        '0' when "0100100",
        '1' when "0100101",
        '0' when "0100110",
        '1' when "0100111",
        '0' when "0101000",
        '1' when "0101001",
        '0' when "0101010",
        '1' when "0101011",
        '0' when "0101100",
        '1' when "0101101",
        '0' when "0101110",
        '1' when "0101111",
        '0' when "0110000",
        '1' when "0110001",
        '0' when "0110010",
        '1' when "0110011",
        '0' when "0110100",
        '1' when "0110101",
        '0' when "0110110",
        '1' when "0110111",
        '0' when "0111000",
        '1' when "0111001",
        '0' when "0111010",
        '1' when "0111011",
        '0' when "0111100",
        '1' when "0111101",
        '0' when "0111110",
        '1' when "0111111",
        '0' when "1000000",
        '1' when "1000001",
        '0' when "1000010",
        '1' when "1000011",
        '0' when "1000100",
        '1' when "1000101",
        '0' when "1000110",
        '1' when "1000111",
        '0' when "1001000",
        '1' when "1001001",
        '0' when "1001010",
        '1' when "1001011",
        '0' when "1001100",
        '1' when "1001101",
        '0' when "1001110",
        '1' when "1001111",
        '0' when "1010000",
        '1' when "1010001",
        '0' when "1010010",
        '1' when "1010011",
        '0' when "1010100",
        '1' when "1010101",
        '0' when "1010110",
        '1' when "1010111",
        '0' when "1011000",
        '1' when "1011001",
        '0' when "1011010",
        '1' when "1011011",
        '0' when "1011100",
        '1' when "1011101",
        '0' when "1011110",
        '1' when "1011111",
        '0' when "1100000",
        '1' when "1100001",
        '0' when "1100010",
        '1' when "1100011",
        '0' when "1100100",
        '1' when "1100101",
        '0' when "1100110",
        '1' when "1100111",
        '0' when "1101000",
        '1' when "1101001",
        '0' when "1101010",
        '1' when "1101011",
        '0' when "1101100",
        '1' when "1101101",
        '0' when "1101110",
        '1' when "1101111",
        '0' when "1110000",
        '1' when "1110001",
        '0' when "1110010",
        '1' when "1110011",
        '0' when "1110100",
        '1' when "1110101",
        '0' when "1110110",
        '1' when "1110111",
        '0' when "1111000",
        '1' when "1111001",
        '0' when "1111010",
        '1' when "1111011",
        '0' when "1111100",
        '1' when "1111101",
        '0' when "1111110",
        '1' when "1111111",
        '0' when others;
end tellMeEvenOdd;

-- Thanks for using my library, hope you have memory for it!!
-- (The speeds are theoretically massive, memory is not an issue)