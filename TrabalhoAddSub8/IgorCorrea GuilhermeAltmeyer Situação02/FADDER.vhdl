--FADDER 1 Bit
-- 27/10/23

entity fadder is
    port(
        a    : in  bit;
        b    : in  bit;
        cin  : in  bit;
        cout : out bit;
        s    : out bit
    );
end entity;

architecture comp of fadder is
    --Nenhum outro componente ou sinais
begin
    s <= (a xor b) xor cin after 2*4 ns;
    cout <= (a and b)   or 
            (a and cin) or 
            (b and cin) after 2*4 ns;
end architecture;

