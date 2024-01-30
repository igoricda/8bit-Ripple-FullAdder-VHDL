entity overflow is
    port(
        a : in bit;
        b : in bit;
        s : in bit;
        overf : out bit
        );
end entity;

architecture comp of overflow is
    begin
        overf <= (not a and not b and s) or
                 (a and b and not s) after 3*4 ns; --not -> and -> or
end architecture;
