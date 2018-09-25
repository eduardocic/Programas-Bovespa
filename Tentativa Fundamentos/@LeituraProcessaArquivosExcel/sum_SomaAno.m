function [SaidaX, SaidaY, Quantidade_Trimestres_Disponiveis_No_Referido_Ano] = sum_SomaAno(o, y)

% 1.: Verifica a quantidade de anos.
% -----------------------------------
Ano       = o.Data.Ano;
Mes       = o.Data.Mes;
Trimestre = o.Data.TRIMESTRE; 
n         = max(size(Ano));         % Quantos informações trimestrais 
                                    % estão disponíveis?

% Cálculo da quantidade de trimestres disponíveis no ano.
% -------------------------------------------------------
AnoInicial = min(Ano);
AnoFinal   = max(Ano);
Indice     = 0;
for i = AnoInicial:AnoFinal
    Indice = Indice + 1;
    Quantidade_Trimestres_Disponiveis_No_Referido_Ano(Indice) = sum(Ano(:) == i);
end

% Realiza o Cálculo do Índice do Somatório dos anos completos.
% ------------------------------------------------------------
contador = 0;
for i = 1:Indice
    Soma = 0;
    for j = 1:Quantidade_Trimestres_Disponiveis_No_Referido_Ano(i)
        contador = contador + 1;
        Soma     = Soma + y(contador);
    end
    SaidaX(i) = Ano(contador);       % Qual o ano que estamos trabalhando
    SaidaY(i) = Soma;                % Qual o somatório da informações do 
                                     % referido ano.
end

end