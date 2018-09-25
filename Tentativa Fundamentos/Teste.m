% function [SaidaX, SaidaY, Quantidade_Trimestres] = sum_SomaAno(o, y)
clear all; close all; clc;
load('TAESA.mat');

% 1.: Verifica a quantidade de anos.
% -----------------------------------
Ano       = o.Data.Ano;
Mes       = o.Data.Mes;
Trimestre = o.Data.TRIMESTRE; 
n         = max(size(Ano));         % Quantos informa��es trimestrais 
                                    % est�o dispon�veis?

% C�lculo da quantidade de trimestres dispon�veis no ano.
% -------------------------------------------------------
AnoInicial = min(Ano);
AnoFinal   = max(Ano);
Indice     = 0;
for i = AnoInicial:AnoFinal
    Indice = Indice + 1;
    Quantidade_Trimestres_Disponiveis_No_Referido_Ano(Indice) = sum(Ano(:) == i);
end


