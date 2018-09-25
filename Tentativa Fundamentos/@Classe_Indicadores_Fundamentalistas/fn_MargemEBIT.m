function [a] = fn_MargemEBIT(a)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   MARGEM EBIT faz a medi��o dos lucros da empresa para cada R$ 1,00 de
%   vendas, antes de descontar as despesas financeiras e os impostos.
%
%   C�lculo
%  ----------        
%
%                   Resultado Antes do Resultado Financeiro e dos Tributos
%    Margem EBIT = -------------------------------------------------------- x 100%
%                          Receita de Vendas de Bens e/ou Servi�os
%
%
%   Localiza��o dos itens
%  -----------------------
%
% --------------------------------------------------------------------------------------
% |     C�digo    |                               Descri��o                            |
% --------------------------------------------------------------------------------------
% |     3.01      | 'Receita de Venda de Bens e/ou Servi�os'                           |
% |     3.05      | 'Resultado Resultado Antes do Resultado Financeiro e dos Tributos' |                                   |
% --------------------------------------------------------------------------------------
ResultadoAntesDoResultadoFinanceiroEDosTributos    = a.DemResultados.ResultadoAntesDoResultadoFinanceiroEDosTributos;
ReceitaDeVendasDeBensEOUServicos                   = a.DemResultados.ReceitaDeVendaDeBensEOUServicos;

% 1.: Ser� calculado tomando-se sempre os 4 �ltimos trimestres.

% [Tri, ResultadoAntesDoResultadoFinanceiroEDOSTributos] = SomaUltimosQuatroTrimestres(o, ResultadoAntesDoResultadoFinanceiroEDOSTributos)
% [~, ReceitaDeVendasDeBensEOUServicos] = SomaUltimosQuatroTrimestres(o, ReceitaDeVendasDeBensEOUServicos)

% 1.: C�lculo do �ndice.
a.Indicador.MargemEBIT.y = 100*(ResultadoAntesDoResultadoFinanceiroEDosTributos./ReceitaDeVendasDeBensEOUServicos);
a.Indicador.MargemEBIT.x = a.Data.TRIMESTRE;

end