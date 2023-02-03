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
        even:  out std_logic;
        odd:   out std_logic
    ); end component;

    -- Inputs
    signal bit0 : std_logic;
    signal bit1 : std_logic;
    signal bit2 : std_logic;

    -- Outputs
    signal even:  std_logic;
    signal odd:   std_logic;

begin

    -- Creates Even or Odd instance
    deciderInstance: decideEvenOdd port map(
        bit0  => bit0 ,
        bit1  => bit1 ,
        bit2  => bit2 ,
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
end testEvenOdd;


-- -- Even or Odd decider implementation
library IEEE;
use IEEE.std_logic_1164.all;

entity decideEvenOdd is
    port (
        bit0 : in  std_logic;
        bit1 : in  std_logic;
        bit2 : in  std_logic;
        even:  out std_logic;
        odd:   out std_logic
    );
end decideEvenOdd;

architecture tellMeEvenOdd of decideEvenOdd is
    -- Temporary processing signal (concatenate all bits)
    signal concatenatedBits: std_logic_vector(2 downto 0);
begin
    concatenatedBits <= bit2 & bit1 & bit0;

    -- Truth table for when number is even
    with concatenatedBits select even <=
        '1' when "000",
        '0' when "001",
        '1' when "010",
        '0' when "011",
        '1' when "100",
        '0' when "101",
        '1' when "110",
        '0' when "111",
        '0' when others;

    -- Truth table for when number is odd
    with concatenatedBits select odd <=
        '0' when "000",
        '1' when "001",
        '0' when "010",
        '1' when "011",
        '0' when "100",
        '1' when "101",
        '0' when "110",
        '1' when "111",
        '0' when others;
end tellMeEvenOdd;

-- Thanks for using my library, hope you have memory for it!!
-- (The speeds are theoretically massive, memory is not an issue)