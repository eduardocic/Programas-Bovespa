function [o] = sys_QuantidadeDeAcoes(o)

% Quantos balan�os existem?
n     = size(o.Tabela1,2);

% Qual a quantidade de a��es digitadas?
Quant = o.Tabela1(end:end);

% Reprodutibilidade da quantidade de a��es dda empresa.
o.Indicador.QuantidadeDeAcoes = linspace(1,1,n)*Quant;
end