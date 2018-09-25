function [o] = ind_LucroPorAcao(o)

% Eduardo H. Santos
% Data: 12/03/2018
% 
%   Significado
%  -------------
%
%   LUCRO LÍQUIDO é relativo a todo a receita obtida pela empresa já
%   tirando todas as obrigações.
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código    |                  Descrição                            |
% -------------------------------------------------------------------------
% | 3.11          | 'Lucro/Prejuizo Consolidado do Periodo'               |
% -------------------------------------------------------------------------
LucroTrimestre    = o.DemResultados.LucroPrejuizoConsolidadoDoPeriodo;
QuantidadeDeAcoes = o.Indicador.QuantidadeDeAcoes(1);

% 2.: Faz o cálculo para o ano.
% -----------------------------
[Ano_Soma_X, Soma_LucroTrimestresDoAno, Quantidade_Trimestres_No_Referido_Ano] = sum_SomaAno(o, LucroTrimestre);
o.Indicador.LucroPorAcao.Ano.x = Ano_Soma_X;
for i = 1:max(size(Soma_LucroTrimestresDoAno))
    o.Indicador.LucroPorAcao.Ano.y(i) = Soma_LucroTrimestresDoAno(i)/QuantidadeDeAcoes;
end

% 3. Faz o cálculo para os últimos 12 meses.
% ------------------------------------------
[Trimestre_Tomado_Como_Referencia, Ano_Tomado_Como_Referencia, ...
Soma_Ultimos_4_Trimestres] = sum_SomaDosUltimos4Trimestres(o, LucroTrimestre);

o.Indicador.LucroPorAcao.Ultimos12Meses.x = Trimestre_Tomado_Como_Referencia;
for i = 1:max(size(Soma_Ultimos_4_Trimestres))
    o.Indicador.LucroPorAcao.Ultimos12Meses.y(i) = Soma_Ultimos_4_Trimestres(i)/QuantidadeDeAcoes;
end

end