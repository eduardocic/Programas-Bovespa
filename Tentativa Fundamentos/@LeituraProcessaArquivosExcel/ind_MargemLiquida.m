function [a] = ind_MargemLiquida(a)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   MARGEM LÍQUIDA corresponde ao que sobra para os acionistas em relação
%   às receitas com vendas e prestações de serviço da empresa. Mostra qual
%   o lucro líquido para cada unidade de venda realizada na empresa.
%
%
%   Cálculo
%  ----------        
% 
%                    Lucro/Prejuizo Consolidado do Periodo
% Margem Líquida = ----------------------------------------- x 100%
%                    Receita de Venda de Bens e/ou Serviços
%
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código    |                  Descrição                            |
% -------------------------------------------------------------------------
% | 3.01          | 'Receita Líquida de Vendas e/ou Serviços'             |
% | 3.11          | 'Lucro/Prejuizo Consolidado do Periodo'               |
% -------------------------------------------------------------------------
ReceitaDeVendaDeBensEOUServicos     = a.DemResultados.ReceitaLiquidaDeVendasEOUServicos;
LucroPrejuizoConsolidadoDoPeriodo   = a.DemResultados.LucroPrejuizoConsolidadoDoPeriodo;

% 1.: Cálculo do Índice.
a.Indicador.MargemLiquida.y = 100*(LucroPrejuizoConsolidadoDoPeriodo./ReceitaDeVendaDeBensEOUServicos);
a.Indicador.MargemLiquida.x = a.Data.TRIMESTRE;

end