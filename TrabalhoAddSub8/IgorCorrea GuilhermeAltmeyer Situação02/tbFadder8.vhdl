--TestBench do FullAdder de 8 bits
--27/10/2023

entity tbfadder8 is
end entity;

architecture tb of tbfadder8 is
    component fadder8 is
        port(
            a   : in bit_vector (7 downto 0);
            b   : in bit_vector (7 downto 0);
            cin : in bit;
            s   : out bit_vector (7 downto 0);
            cout : out bit
        );
    end component;
    
    signal sa, sb, ss : bit_vector (7 downto 0);
    signal scin, scout : bit;
    
begin
    
    u_tbfadder8 : fadder8 port map(sa, sb, scin, ss, scout);
    
    u_tb : process  
    begin
            sa <= "11111111";
            sb <= "00000001";
            scin <= '0';
            wait for 72 ns;
            
            sa <= "00001000";
            sb <= "00001000";
            scin <= '1';
            wait for 72 ns;
            
            sa <= "10011001";
            sb <= "10011111";
            scin <= '1';
            wait for 72 ns;
            
            sa <= "00011010";
            sb <= "10010010";
            scin <= '0';
            wait for 72 ns;
            
            sa <= "10010010";
            sb <= "00000100";
            scin <= '0';
            wait for 72 ns;
        wait;
    end process;
end architecture;
        
           
    


