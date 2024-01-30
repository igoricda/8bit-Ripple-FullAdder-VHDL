-- SignedAdder8bits
-- XX/XX/2023

entity addsub8bit is
    port(
        x     : in bit_vector (7 downto 0);
        y     : in bit_vector (7 downto 0);
        op    : in bit;
        z     : out bit_vector (7 downto 0);
        cout  : out bit;
        overf : out bit
    );
end entity;

architecture comportamento of addsub8bit is
    component mux2x8 is
        port(
            b     : in  bit_vector(7 downto 0);
            opsel : in  bit;
            s     : out bit_vector(7 downto 0)
        );
    end component;
    
    component fadder8 is
        port(
            a    : in bit_vector (7 downto 0);
            b    : in bit_vector (7 downto 0);
            cin  : in bit;
            s    : out bit_vector (7 downto 0);
            cout : out bit
        );
    end component;
    
    component overflow is
        port(
            a : in bit;
            b : in bit;
            s : in bit;
            overf : out bit
            );
    end component;
    
    -- Signals e Instancias
    signal Cin_geral, Cout_geral, sop : bit;
    signal smux, ss : bit_vector(7 downto 0);
    --Sinal para conectar o z com o s do fadder
    --Sinal para conectar o op com o cin do fadder
    -- Conectar Cout_geral no cout, Cin_geral com op
    -- X geral com 'a' do fadder
    -- Saida do Mux com o b do fadder

    begin        
        u_mux2x8 : mux2x8 port map(y, op, smux);
        u_fadder8 : fadder8 port map(x, smux, sop, ss, cout_geral);
        u_overflow : overflow port map(x(7), y(7), ss(7), overf);
        
        z(7 downto 0) <= ss(7 downto 0);
        cout <= cout_geral; 
        cin_geral <= op;
        sop <= op;
        
end architecture;




















