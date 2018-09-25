function [o] = ind_MargemBruta(o)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   MARGEM BRUTA representa quanto � empresa obt�m de retorno das vendas,
%   retirando os custos das mercadorias vendidas e servi�os prestados. A
%   margem bruta representa quanto sobra ap�s considerar estes custos.
%
%
%   C�lculo
%  ----------        
%
%                                 Receita Bruta
%    Margem Bruta = ---------------------------------------- x 100%
%                     Receita de Venda de Bens e/ou Servi�os
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% | 3.01          | 'Receita L�quida de Vendas e/ou Servi�os'             |
% | 3.03          | 'Resultado Bruto'                                     |
% -------------------------------------------------------------------------
ResultadoBruto                       = o.DemResultados.ResultadoBruto;
ReceitaDeVendasDeBensEOUServicos     = o.DemResultados.ReceitaLiquidaDeVendasEOUServicos;

% 1.: C�lculo do �ndice para o referido ano.
% ------------------------------------------
[Ano_Soma_X, Soma_Ano_ResultadoBruto, Quantidade_Trimestres_Disponiveis_No_Referido_Ano] = sum_SomaAno(o, ResultadoBruto);
[~, Soma_Ano_ReceitaDeVendasDeBensEOUServicos, ~] = sum_SomaAno(o, ReceitaDeVendasDeBensEOUServicos);

% 2.: �ndice para os �ltimos 12 meses.
% ------------------------------------
[Trimestre_Tomado_Como_Referencia, Ano_Tomado_Como_Referencia, ...
Soma_Ultimos12Meses_ResultadoBruto] = sum_SomaDosUltimos4Trimestres(o, ResultadoBruto);
[~, ~, Soma_Ultimos12Meses_ReceitaDeVendasDeBensEOUServicos] = sum_SomaDosUltimos4Trimestres(o, ...
    ReceitaDeVendasDeBensEOUServicos);


% Para o ano (somado).
% --------------------
for i = 1:max(size(Soma_Ano_ReceitaDeVendasDeBensEOUServicos));
    if (Soma_Ano_ReceitaDeVendasDeBensEOUServicos(i) == 0)
        o.Indicador.MargemBruta.Ano.y(i) = 0;
        o.Indicador.MargemBruta.Ano.x(i) = Ano_Soma_X(i);
    else
        o.Indicador.MargemBruta.Ano.y(i) = 100*(Soma_Ano_ResultadoBruto(i)/Soma_Ano_ReceitaDeVendasDeBensEOUServicos(i));
        o.Indicador.MargemBruta.Ano.x(i) = Ano_Soma_X(i);
    end
end

% Para os �ltimos 12 meses (somado).
% ----------------------------------
for i = 1:max(size(Soma_Ultimos12Meses_ReceitaDeVendasDeBensEOUServicos));
    if (Soma_Ultimos12Meses_ReceitaDeVendasDeBensEOUServicos(i) == 0)
        o.Indicador.MargemBruta.Ultimos12Meses.y(i) = 0;
        o.Indicador.MargemBruta.Ultimos12Meses.x(i) = Trimestre_Tomado_Como_Referencia(i);
    else
        o.Indicador.MargemBruta.Ultimos12Meses.y(i) = 100*(Soma_Ultimos12Meses_ResultadoBruto(i)/...
                                                           Soma_Ultimos12Meses_ReceitaDeVendasDeBensEOUServicos(i));
        o.Indicador.MargemBruta.Ultimos12Meses.x(i) = Trimestre_Tomado_Como_Referencia(i);
    end
end


end