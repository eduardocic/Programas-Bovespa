function [SaidaX, SaidaY, Quantidade_Trimestres_Disponiveis_No_Referido_Ano] = sum_SomaAno(o, y)

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

% Realiza o C�lculo do �ndice do Somat�rio dos anos completos.
% ------------------------------------------------------------
contador = 0;
for i = 1:Indice
    Soma = 0;
    for j = 1:Quantidade_Trimestres_Disponiveis_No_Referido_Ano(i)
        contador = contador + 1;
        Soma     = Soma + y(contador);
    end
    SaidaX(i) = Ano(contador);       % Qual o ano que estamos trabalhando
    SaidaY(i) = Soma;                % Qual o somat�rio da informa��es do 
                                     % referido ano.
end

end