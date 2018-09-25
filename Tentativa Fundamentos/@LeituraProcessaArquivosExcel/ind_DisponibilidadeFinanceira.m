function [o] = ind_DisponibilidadeFinanceira(o)

% Dinheiro que pode ser gasto na horas.
%
% Somar 1.01.01 + 1.01.02
% Igual a somar 'Caixa e Equivalentes de Caixa' + 'Aplicações Financeiras'

CaixaEEquivalentesDeCaixa = o.Ativos.CaixaEEquivalentesDeCaixa;
AplicacoesFinanceiras    = o.Ativos.AplicacoesFinanceiras;

Soma = CaixaEEquivalentesDeCaixa + AplicacoesFinanceiras;

o.Indicador.DisponibilidadeFinanceira.x = o.Data.TRIMESTRE;
o.Indicador.DisponibilidadeFinanceira.y = Soma;






end