    -- FADDER 8 bits
    -- 27/10/23

entity fadder8 is
    port(
        a   : in bit_vector (7 downto 0);
        b   : in bit_vector (7 downto 0);
        cin : in bit;
        s   : out bit_vector (7 downto 0);
        cout : out bit
    );
end entity;

architecture comportamento of fadder8 is
    
    component fadder
        Port(
            a    : in  bit;
            b    : in  bit;
            cin  : in  bit;
            cout : out bit;
            s    : out bit
        );
    end component;
    
    signal carry : bit_vector (6 downto 0); --Leva o carryout da posicao anterior para o carryin da proxima
    
    begin
        FA0 : fadder port map ( a(0), b(0), cin,      carry(0), s(0) );
        FA1 : fadder port map ( a(1), b(1), carry(0), carry(1), s(1) );
        FA2 : fadder port map ( a(2), b(2), carry(1), carry(2), s(2) );
        FA3 : fadder port map ( a(3), b(3), carry(2), carry(3), s(3) );
        FA4 : fadder port map ( a(4), b(4), carry(3), carry(4), s(4) );
        FA5 : fadder port map ( a(5), b(5), carry(4), carry(5), s(5) );
        FA6 : fadder port map ( a(6), b(6), carry(5), carry(6), s(6) );
        FA7 : fadder port map ( a(7), b(7), carry(6), cout,     s(7) );
    
    end architecture;
