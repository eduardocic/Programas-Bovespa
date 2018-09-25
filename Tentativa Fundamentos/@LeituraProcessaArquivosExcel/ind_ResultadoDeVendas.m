function [a] = ind_ResultadoDeVendas(a)

% Eduardo H. Santos
% Data: 18/03/2017
%
%   Significado
%  -------------
%
%   RESULTADO DE VENDAS BRUTAS faz a mensura��o de vendas ou n�o da
%   empresa.
%
%
%   C�lculo
%  ----------        
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
ReceitaDeVendasDeBensEOUServicos   = a.DemResultados.ReceitaDeVendaDeBensEOUServicos;

% 1.: Ser� calculado tomando-se sempre os 4 �ltimos trimestres.

% 2.: C�lculo do �ndice.
a.Indicador.Vendas.y = ReceitaDeVendasDeBensEOUServicos;
a.Indicador.Vendas.x = a.Data.TRIMESTRE;

end