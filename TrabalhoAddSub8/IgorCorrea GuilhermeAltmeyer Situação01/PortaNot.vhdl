-- Porta para não B, Entrada do mux2x8 caso sel = '1'
-- 27/10/23

entity portanot is
        port(
            b : in  bit_vector (7 downto 0);
            s : out bit_vector (7 downto 0)
        );
end entity;

architecture comp of portanot is
    begin
        s <= not b;
end architecture;
