function [a] = ind_DespesasPorLucroBruto(a)

% Eduardo H. Santos
% Data: 18/03/2017
% 
%   Significado
%  -------------
%
%   DESPERAS POR LUCRO BRUTO serve para se ter uma no��o se h� ou n�o 
%   muitos gastos operacionais com o neg�cio em si. Segundo o livro do 
%   pessoal do Buffet, � interessante que tal �ndice seja baixo. Acima de 
%   80% � horr�vel. Considerado excelente � abaixo de 30%.
%
%
%   C�lculo
%  ----------
%
%   Despesas totais  = Despesas com venda + gerais e administrativas
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% |    3.04.01    | 'Despesas com Vendas'                                 |
% |    3.04.02    | 'Despesas Gerais e Administrativas'                   |
% |    3.03       | 'Resultado Bruto'                                     |
% -------------------------------------------------------------------------
DespesasComVendas              = a.DemResultados.DespesasComVendas;
DespesasGeraisEAdministrativas = a.DemResultados.DespesasGeraisEAdministrativas;
ResultadoBruto                 = a.DemResultados.ResultadoBruto;

% C�lculo da despesas
Despesas = DespesasComVendas + DespesasGeraisEAdministrativas; 

% Indicador relativo � despesas.
a.Indicador.Despesas.y = Despesas;
a.Indicador.Despesas.x = a.Data.TRIMESTRE;

% Irei multiplicar por -1 para ter um valor padronizado.
a.Indicador.DespesasPorLucroBruto.y = (-1)*Despesas./ResultadoBruto;
a.Indicador.DespesasPorLucroBruto.x = a.Data.TRIMESTRE;


end