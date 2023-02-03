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
        even:  out std_logic;
        odd:   out std_logic
    ); end component;

    -- Inputs
    signal bit0 : std_logic;
    signal bit1 : std_logic;

    -- Outputs
    signal even:  std_logic;
    signal odd:   std_logic;

begin

    -- Creates Even or Odd instance
    deciderInstance: decideEvenOdd port map(
        bit0  => bit0 ,
        bit1  => bit1 ,
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
end testEvenOdd;


-- -- Even or Odd decider implementation
library IEEE;
use IEEE.std_logic_1164.all;

entity decideEvenOdd is
    port (
        bit0 : in  std_logic;
        bit1 : in  std_logic;
        even:  out std_logic;
        odd:   out std_logic
    );
end decideEvenOdd;

architecture tellMeEvenOdd of decideEvenOdd is
    -- Temporary processing signal (concatenate all bits)
    signal concatenatedBits: std_logic_vector(1 downto 0);
begin
    concatenatedBits <= bit1 & bit0;

    -- Truth table for when number is even
    with concatenatedBits select even <=
        '1' when "00",
        '0' when "01",
        '1' when "10",
        '0' when "11",
        '0' when others;

    -- Truth table for when number is odd
    with concatenatedBits select odd <=
        '0' when "00",
        '1' when "01",
        '0' when "10",
        '1' when "11",
        '0' when others;
end tellMeEvenOdd;

-- Thanks for using my library, hope you have memory for it!!
-- (The speeds are theoretically massive, memory is not an issue)