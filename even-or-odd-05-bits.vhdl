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
        even:  out std_logic;
        odd:   out std_logic
    ); end component;

    -- Inputs
    signal bit0 : std_logic;
    signal bit1 : std_logic;
    signal bit2 : std_logic;
    signal bit3 : std_logic;
    signal bit4 : std_logic;

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
        even:  out std_logic;
        odd:   out std_logic
    );
end decideEvenOdd;

architecture tellMeEvenOdd of decideEvenOdd is
    -- Temporary processing signal (concatenate all bits)
    signal concatenatedBits: std_logic_vector(4 downto 0);
begin
    concatenatedBits <= bit4 & bit3 & bit2 & bit1 & bit0;

    -- Truth table for when number is even
    with concatenatedBits select even <=
        '1' when "00000",
        '0' when "00001",
        '1' when "00010",
        '0' when "00011",
        '1' when "00100",
        '0' when "00101",
        '1' when "00110",
        '0' when "00111",
        '1' when "01000",
        '0' when "01001",
        '1' when "01010",
        '0' when "01011",
        '1' when "01100",
        '0' when "01101",
        '1' when "01110",
        '0' when "01111",
        '1' when "10000",
        '0' when "10001",
        '1' when "10010",
        '0' when "10011",
        '1' when "10100",
        '0' when "10101",
        '1' when "10110",
        '0' when "10111",
        '1' when "11000",
        '0' when "11001",
        '1' when "11010",
        '0' when "11011",
        '1' when "11100",
        '0' when "11101",
        '1' when "11110",
        '0' when "11111",
        '0' when others;

    -- Truth table for when number is odd
    with concatenatedBits select odd <=
        '0' when "00000",
        '1' when "00001",
        '0' when "00010",
        '1' when "00011",
        '0' when "00100",
        '1' when "00101",
        '0' when "00110",
        '1' when "00111",
        '0' when "01000",
        '1' when "01001",
        '0' when "01010",
        '1' when "01011",
        '0' when "01100",
        '1' when "01101",
        '0' when "01110",
        '1' when "01111",
        '0' when "10000",
        '1' when "10001",
        '0' when "10010",
        '1' when "10011",
        '0' when "10100",
        '1' when "10101",
        '0' when "10110",
        '1' when "10111",
        '0' when "11000",
        '1' when "11001",
        '0' when "11010",
        '1' when "11011",
        '0' when "11100",
        '1' when "11101",
        '0' when "11110",
        '1' when "11111",
        '0' when others;
end tellMeEvenOdd;

-- Thanks for using my library, hope you have memory for it!!
-- (The speeds are theoretically massive, memory is not an issue)