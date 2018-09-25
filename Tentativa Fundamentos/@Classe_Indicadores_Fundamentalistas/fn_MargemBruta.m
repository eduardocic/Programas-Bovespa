function [a] = fn_MargemBruta(a)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   MARGEM BRUTA representa quanto � empresa obt�m de retorno das vendas,
%   retirando os custos das mercadorias venvidas e servi�os prestados. A
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
% | 3.01          | 'Receita de Venda de Bens e/ou Servi�os'              |
% | 3.03          | 'Resultado Bruto'                                     |
% -------------------------------------------------------------------------
ResultadoBruto                       = a.DemResultados.ResultadoBruto;
ReceitaDeVendasDeBensEOUServicos     = a.DemResultados.ReceitaDeVendaDeBensEOUServicos;

% 1.: C�lculo do �ndice.
a.Indicador.MargemBruta.y = 100*(ResultadoBruto./ReceitaDeVendasDeBensEOUServicos);
a.Indicador.MargemBruta.x = a.Data.TRIMESTRE;

end