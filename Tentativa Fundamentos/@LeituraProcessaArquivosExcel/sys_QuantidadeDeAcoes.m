function [o] = sys_QuantidadeDeAcoes(o)

% Quantos balanços existem?
n     = size(o.Tabela1,2);

% Qual a quantidade de ações digitadas?
Quant = o.Tabela1(end:end);

% Reprodutibilidade da quantidade de ações dda empresa.
o.Indicador.QuantidadeDeAcoes = linspace(1,1,n)*Quant;
end