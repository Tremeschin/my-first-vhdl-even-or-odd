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
        bit7 : in  std_logic;
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
    signal bit7 : std_logic;

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
        bit7  => bit7 ,
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

    -- Flips bit 7 every 1280 ns
    flippingProcess7: process
        begin loop
            bit7  <= '0';
            wait for 1280 ns;
            bit7  <= '1';
            wait for 1280 ns;
            if NOW > 3200 ns then wait; end if;
        end loop;
    end process flippingProcess7;
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
        bit7 : in  std_logic;
        even:  out std_logic;
        odd:   out std_logic
    );
end decideEvenOdd;

architecture tellMeEvenOdd of decideEvenOdd is
    -- Temporary processing signal (concatenate all bits)
    signal concatenatedBits: std_logic_vector(7 downto 0);
begin
    concatenatedBits <= bit7 & bit6 & bit5 & bit4 & bit3 & bit2 & bit1 & bit0;

    -- Truth table for when number is even
    with concatenatedBits select even <=
        '1' when "00000000",
        '0' when "00000001",
        '1' when "00000010",
        '0' when "00000011",
        '1' when "00000100",
        '0' when "00000101",
        '1' when "00000110",
        '0' when "00000111",
        '1' when "00001000",
        '0' when "00001001",
        '1' when "00001010",
        '0' when "00001011",
        '1' when "00001100",
        '0' when "00001101",
        '1' when "00001110",
        '0' when "00001111",
        '1' when "00010000",
        '0' when "00010001",
        '1' when "00010010",
        '0' when "00010011",
        '1' when "00010100",
        '0' when "00010101",
        '1' when "00010110",
        '0' when "00010111",
        '1' when "00011000",
        '0' when "00011001",
        '1' when "00011010",
        '0' when "00011011",
        '1' when "00011100",
        '0' when "00011101",
        '1' when "00011110",
        '0' when "00011111",
        '1' when "00100000",
        '0' when "00100001",
        '1' when "00100010",
        '0' when "00100011",
        '1' when "00100100",
        '0' when "00100101",
        '1' when "00100110",
        '0' when "00100111",
        '1' when "00101000",
        '0' when "00101001",
        '1' when "00101010",
        '0' when "00101011",
        '1' when "00101100",
        '0' when "00101101",
        '1' when "00101110",
        '0' when "00101111",
        '1' when "00110000",
        '0' when "00110001",
        '1' when "00110010",
        '0' when "00110011",
        '1' when "00110100",
        '0' when "00110101",
        '1' when "00110110",
        '0' when "00110111",
        '1' when "00111000",
        '0' when "00111001",
        '1' when "00111010",
        '0' when "00111011",
        '1' when "00111100",
        '0' when "00111101",
        '1' when "00111110",
        '0' when "00111111",
        '1' when "01000000",
        '0' when "01000001",
        '1' when "01000010",
        '0' when "01000011",
        '1' when "01000100",
        '0' when "01000101",
        '1' when "01000110",
        '0' when "01000111",
        '1' when "01001000",
        '0' when "01001001",
        '1' when "01001010",
        '0' when "01001011",
        '1' when "01001100",
        '0' when "01001101",
        '1' when "01001110",
        '0' when "01001111",
        '1' when "01010000",
        '0' when "01010001",
        '1' when "01010010",
        '0' when "01010011",
        '1' when "01010100",
        '0' when "01010101",
        '1' when "01010110",
        '0' when "01010111",
        '1' when "01011000",
        '0' when "01011001",
        '1' when "01011010",
        '0' when "01011011",
        '1' when "01011100",
        '0' when "01011101",
        '1' when "01011110",
        '0' when "01011111",
        '1' when "01100000",
        '0' when "01100001",
        '1' when "01100010",
        '0' when "01100011",
        '1' when "01100100",
        '0' when "01100101",
        '1' when "01100110",
        '0' when "01100111",
        '1' when "01101000",
        '0' when "01101001",
        '1' when "01101010",
        '0' when "01101011",
        '1' when "01101100",
        '0' when "01101101",
        '1' when "01101110",
        '0' when "01101111",
        '1' when "01110000",
        '0' when "01110001",
        '1' when "01110010",
        '0' when "01110011",
        '1' when "01110100",
        '0' when "01110101",
        '1' when "01110110",
        '0' when "01110111",
        '1' when "01111000",
        '0' when "01111001",
        '1' when "01111010",
        '0' when "01111011",
        '1' when "01111100",
        '0' when "01111101",
        '1' when "01111110",
        '0' when "01111111",
        '1' when "10000000",
        '0' when "10000001",
        '1' when "10000010",
        '0' when "10000011",
        '1' when "10000100",
        '0' when "10000101",
        '1' when "10000110",
        '0' when "10000111",
        '1' when "10001000",
        '0' when "10001001",
        '1' when "10001010",
        '0' when "10001011",
        '1' when "10001100",
        '0' when "10001101",
        '1' when "10001110",
        '0' when "10001111",
        '1' when "10010000",
        '0' when "10010001",
        '1' when "10010010",
        '0' when "10010011",
        '1' when "10010100",
        '0' when "10010101",
        '1' when "10010110",
        '0' when "10010111",
        '1' when "10011000",
        '0' when "10011001",
        '1' when "10011010",
        '0' when "10011011",
        '1' when "10011100",
        '0' when "10011101",
        '1' when "10011110",
        '0' when "10011111",
        '1' when "10100000",
        '0' when "10100001",
        '1' when "10100010",
        '0' when "10100011",
        '1' when "10100100",
        '0' when "10100101",
        '1' when "10100110",
        '0' when "10100111",
        '1' when "10101000",
        '0' when "10101001",
        '1' when "10101010",
        '0' when "10101011",
        '1' when "10101100",
        '0' when "10101101",
        '1' when "10101110",
        '0' when "10101111",
        '1' when "10110000",
        '0' when "10110001",
        '1' when "10110010",
        '0' when "10110011",
        '1' when "10110100",
        '0' when "10110101",
        '1' when "10110110",
        '0' when "10110111",
        '1' when "10111000",
        '0' when "10111001",
        '1' when "10111010",
        '0' when "10111011",
        '1' when "10111100",
        '0' when "10111101",
        '1' when "10111110",
        '0' when "10111111",
        '1' when "11000000",
        '0' when "11000001",
        '1' when "11000010",
        '0' when "11000011",
        '1' when "11000100",
        '0' when "11000101",
        '1' when "11000110",
        '0' when "11000111",
        '1' when "11001000",
        '0' when "11001001",
        '1' when "11001010",
        '0' when "11001011",
        '1' when "11001100",
        '0' when "11001101",
        '1' when "11001110",
        '0' when "11001111",
        '1' when "11010000",
        '0' when "11010001",
        '1' when "11010010",
        '0' when "11010011",
        '1' when "11010100",
        '0' when "11010101",
        '1' when "11010110",
        '0' when "11010111",
        '1' when "11011000",
        '0' when "11011001",
        '1' when "11011010",
        '0' when "11011011",
        '1' when "11011100",
        '0' when "11011101",
        '1' when "11011110",
        '0' when "11011111",
        '1' when "11100000",
        '0' when "11100001",
        '1' when "11100010",
        '0' when "11100011",
        '1' when "11100100",
        '0' when "11100101",
        '1' when "11100110",
        '0' when "11100111",
        '1' when "11101000",
        '0' when "11101001",
        '1' when "11101010",
        '0' when "11101011",
        '1' when "11101100",
        '0' when "11101101",
        '1' when "11101110",
        '0' when "11101111",
        '1' when "11110000",
        '0' when "11110001",
        '1' when "11110010",
        '0' when "11110011",
        '1' when "11110100",
        '0' when "11110101",
        '1' when "11110110",
        '0' when "11110111",
        '1' when "11111000",
        '0' when "11111001",
        '1' when "11111010",
        '0' when "11111011",
        '1' when "11111100",
        '0' when "11111101",
        '1' when "11111110",
        '0' when "11111111",
        '0' when others;

    -- Truth table for when number is odd
    with concatenatedBits select odd <=
        '0' when "00000000",
        '1' when "00000001",
        '0' when "00000010",
        '1' when "00000011",
        '0' when "00000100",
        '1' when "00000101",
        '0' when "00000110",
        '1' when "00000111",
        '0' when "00001000",
        '1' when "00001001",
        '0' when "00001010",
        '1' when "00001011",
        '0' when "00001100",
        '1' when "00001101",
        '0' when "00001110",
        '1' when "00001111",
        '0' when "00010000",
        '1' when "00010001",
        '0' when "00010010",
        '1' when "00010011",
        '0' when "00010100",
        '1' when "00010101",
        '0' when "00010110",
        '1' when "00010111",
        '0' when "00011000",
        '1' when "00011001",
        '0' when "00011010",
        '1' when "00011011",
        '0' when "00011100",
        '1' when "00011101",
        '0' when "00011110",
        '1' when "00011111",
        '0' when "00100000",
        '1' when "00100001",
        '0' when "00100010",
        '1' when "00100011",
        '0' when "00100100",
        '1' when "00100101",
        '0' when "00100110",
        '1' when "00100111",
        '0' when "00101000",
        '1' when "00101001",
        '0' when "00101010",
        '1' when "00101011",
        '0' when "00101100",
        '1' when "00101101",
        '0' when "00101110",
        '1' when "00101111",
        '0' when "00110000",
        '1' when "00110001",
        '0' when "00110010",
        '1' when "00110011",
        '0' when "00110100",
        '1' when "00110101",
        '0' when "00110110",
        '1' when "00110111",
        '0' when "00111000",
        '1' when "00111001",
        '0' when "00111010",
        '1' when "00111011",
        '0' when "00111100",
        '1' when "00111101",
        '0' when "00111110",
        '1' when "00111111",
        '0' when "01000000",
        '1' when "01000001",
        '0' when "01000010",
        '1' when "01000011",
        '0' when "01000100",
        '1' when "01000101",
        '0' when "01000110",
        '1' when "01000111",
        '0' when "01001000",
        '1' when "01001001",
        '0' when "01001010",
        '1' when "01001011",
        '0' when "01001100",
        '1' when "01001101",
        '0' when "01001110",
        '1' when "01001111",
        '0' when "01010000",
        '1' when "01010001",
        '0' when "01010010",
        '1' when "01010011",
        '0' when "01010100",
        '1' when "01010101",
        '0' when "01010110",
        '1' when "01010111",
        '0' when "01011000",
        '1' when "01011001",
        '0' when "01011010",
        '1' when "01011011",
        '0' when "01011100",
        '1' when "01011101",
        '0' when "01011110",
        '1' when "01011111",
        '0' when "01100000",
        '1' when "01100001",
        '0' when "01100010",
        '1' when "01100011",
        '0' when "01100100",
        '1' when "01100101",
        '0' when "01100110",
        '1' when "01100111",
        '0' when "01101000",
        '1' when "01101001",
        '0' when "01101010",
        '1' when "01101011",
        '0' when "01101100",
        '1' when "01101101",
        '0' when "01101110",
        '1' when "01101111",
        '0' when "01110000",
        '1' when "01110001",
        '0' when "01110010",
        '1' when "01110011",
        '0' when "01110100",
        '1' when "01110101",
        '0' when "01110110",
        '1' when "01110111",
        '0' when "01111000",
        '1' when "01111001",
        '0' when "01111010",
        '1' when "01111011",
        '0' when "01111100",
        '1' when "01111101",
        '0' when "01111110",
        '1' when "01111111",
        '0' when "10000000",
        '1' when "10000001",
        '0' when "10000010",
        '1' when "10000011",
        '0' when "10000100",
        '1' when "10000101",
        '0' when "10000110",
        '1' when "10000111",
        '0' when "10001000",
        '1' when "10001001",
        '0' when "10001010",
        '1' when "10001011",
        '0' when "10001100",
        '1' when "10001101",
        '0' when "10001110",
        '1' when "10001111",
        '0' when "10010000",
        '1' when "10010001",
        '0' when "10010010",
        '1' when "10010011",
        '0' when "10010100",
        '1' when "10010101",
        '0' when "10010110",
        '1' when "10010111",
        '0' when "10011000",
        '1' when "10011001",
        '0' when "10011010",
        '1' when "10011011",
        '0' when "10011100",
        '1' when "10011101",
        '0' when "10011110",
        '1' when "10011111",
        '0' when "10100000",
        '1' when "10100001",
        '0' when "10100010",
        '1' when "10100011",
        '0' when "10100100",
        '1' when "10100101",
        '0' when "10100110",
        '1' when "10100111",
        '0' when "10101000",
        '1' when "10101001",
        '0' when "10101010",
        '1' when "10101011",
        '0' when "10101100",
        '1' when "10101101",
        '0' when "10101110",
        '1' when "10101111",
        '0' when "10110000",
        '1' when "10110001",
        '0' when "10110010",
        '1' when "10110011",
        '0' when "10110100",
        '1' when "10110101",
        '0' when "10110110",
        '1' when "10110111",
        '0' when "10111000",
        '1' when "10111001",
        '0' when "10111010",
        '1' when "10111011",
        '0' when "10111100",
        '1' when "10111101",
        '0' when "10111110",
        '1' when "10111111",
        '0' when "11000000",
        '1' when "11000001",
        '0' when "11000010",
        '1' when "11000011",
        '0' when "11000100",
        '1' when "11000101",
        '0' when "11000110",
        '1' when "11000111",
        '0' when "11001000",
        '1' when "11001001",
        '0' when "11001010",
        '1' when "11001011",
        '0' when "11001100",
        '1' when "11001101",
        '0' when "11001110",
        '1' when "11001111",
        '0' when "11010000",
        '1' when "11010001",
        '0' when "11010010",
        '1' when "11010011",
        '0' when "11010100",
        '1' when "11010101",
        '0' when "11010110",
        '1' when "11010111",
        '0' when "11011000",
        '1' when "11011001",
        '0' when "11011010",
        '1' when "11011011",
        '0' when "11011100",
        '1' when "11011101",
        '0' when "11011110",
        '1' when "11011111",
        '0' when "11100000",
        '1' when "11100001",
        '0' when "11100010",
        '1' when "11100011",
        '0' when "11100100",
        '1' when "11100101",
        '0' when "11100110",
        '1' when "11100111",
        '0' when "11101000",
        '1' when "11101001",
        '0' when "11101010",
        '1' when "11101011",
        '0' when "11101100",
        '1' when "11101101",
        '0' when "11101110",
        '1' when "11101111",
        '0' when "11110000",
        '1' when "11110001",
        '0' when "11110010",
        '1' when "11110011",
        '0' when "11110100",
        '1' when "11110101",
        '0' when "11110110",
        '1' when "11110111",
        '0' when "11111000",
        '1' when "11111001",
        '0' when "11111010",
        '1' when "11111011",
        '0' when "11111100",
        '1' when "11111101",
        '0' when "11111110",
        '1' when "11111111",
        '0' when others;
end tellMeEvenOdd;

-- Thanks for using my library, hope you have memory for it!!
-- (The speeds are theoretically massive, memory is not an issue)