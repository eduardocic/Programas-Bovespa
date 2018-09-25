function [a] = ind_MargemLiquida(a)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   MARGEM L�QUIDA corresponde ao que sobra para os acionistas em rela��o
%   �s receitas com vendas e presta��es de servi�o da empresa. Mostra qual
%   o lucro l�quido para cada unidade de venda realizada na empresa.
%
%
%   C�lculo
%  ----------        
% 
%                    Lucro/Prejuizo Consolidado do Periodo
% Margem L�quida = ----------------------------------------- x 100%
%                    Receita de Venda de Bens e/ou Servi�os
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% | 3.01          | 'Receita L�quida de Vendas e/ou Servi�os'             |
% | 3.11          | 'Lucro/Prejuizo Consolidado do Periodo'               |
% -------------------------------------------------------------------------
ReceitaDeVendaDeBensEOUServicos     = a.DemResultados.ReceitaLiquidaDeVendasEOUServicos;
LucroPrejuizoConsolidadoDoPeriodo   = a.DemResultados.LucroPrejuizoConsolidadoDoPeriodo;

% 1.: C�lculo do �ndice.
a.Indicador.MargemLiquida.y = 100*(LucroPrejuizoConsolidadoDoPeriodo./ReceitaDeVendaDeBensEOUServicos);
a.Indicador.MargemLiquida.x = a.Data.TRIMESTRE;

end