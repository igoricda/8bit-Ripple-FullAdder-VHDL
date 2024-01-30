--Testebench do SignedAdder
--XX/XX/2023

entity tbsignedadder is
end entity;

architecture tb of tbsignedadder is
    component addsub8bit is
        port(
            x :    in bit_vector (7 downto 0);
            y :    in bit_vector (7 downto 0);
            op :   in bit;
            z :    out bit_vector (7 downto 0);
            cout : out bit;
            overf : out bit
        );
    end component;
    
    signal sx, sy, sz : bit_vector (7 downto 0);
    signal op, Overflow, Cin_geral, Cout_geral : bit;
begin
    u_tbsignedadder : addsub8bit port map(sx, sy, op, sz, cout_geral, Overflow);
    
    u_tb : process
    begin
    
        sx <= "00000000";  -- '0'
        sy <= "11111111";  -- "-1"
        op <= '0';
        Cin_Geral <= '0';  -- Recebe o mesmo que a operação 
        wait for 10 ns;    --sz <= "11111111" (-1) scout <= '0' soverf <= '0'
        
        op <= '1';
        Cin_Geral <= '1';
        wait for 10 ns;    --sz <= "00000001" (1) scout <= '0' soverf <= '0'
        
        sx <= "11111111";  --"-1"
        sy <= "00000001";  -- '1'
        op <= '0';
        Cin_Geral <= '0'; 
        wait for 10 ns;    --sz <= "00000000" (0) scout <= '1' soverf <= '0'
        
        op <= '1';
        Cin_Geral <= '1'; 
        wait for 10 ns;    --sz <= "11111110" (-2) scout <= '1' soverf <= '0'
        
        sx <= "11111110";  -- "-2"
        sy <= "11111110";  -- "-2"
        op <= '0';
        Cin_Geral <= '0'; 
        wait for 10 ns;    --sz <= "11111100" (-4) scout <= '1' soverf <= '0'
        
        sx <= "11111111";  -- "-1"
        sy <= "11111111";  -- "-1"
        Cin_Geral <= '0'; 
        wait for 10 ns;    --sz <= "11111110" (-2) scout <= '1' soverf <= '0'
        
        sx <= "01111111";  -- "127"
        sy <= "01111111";  -- "127"
        Cin_Geral <= '0'; 
        wait for 10 ns;    -- sz <= "11111110" ("-2") scout <= '0' soverf <= '1'
                           -- Resposta esperada "254", mas ocorreu o overflow
        
        sx <= "00110111";  -- "55"
        sy <= "10001111";  -- "-113"
        op <= '1';
        Cin_Geral <= '1'; 
        wait for 10 ns;    -- sz <= "10101000" (-88) scout <= '0' soverf <= '0'
        
    wait;
    end process;
end architecture;
        
