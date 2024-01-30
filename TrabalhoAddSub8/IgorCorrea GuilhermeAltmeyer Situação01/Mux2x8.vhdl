-- Mux2x8
-- 27/10/23

entity mux2x8 is
    port(
        b  : in  bit_vector(7 downto 0);
        opsel : in  bit;
        s   : out bit_vector(7 downto 0)
    );
end entity;

architecture comuta of mux2x8 is
    component portanot is
        port(
            b : in  bit_vector (7 downto 0);
            s : out bit_vector (7 downto 0)
        );
    end component;
    
    signal ss : bit_vector(7 downto 0);
    
begin

    u_portanot : portanot port map (b(7 downto 0), ss(7 downto 0));
    
    s(7 downto 0) <= b when opsel = '0' else ss;
    -- Se seletor = '0' - Usar o valor de B, senão usar a saida da portaNot
end architecture;
