function [o] = ind_LucroLiquido(o)

% Eduardo H. Santos
% Data: 12/03/2018
% 
%   Significado
%  -------------
%
%   LUCRO LÍQUIDO é relativo a todo a receita obtida pela empresa já
%   tirando todas as obrigações.
%
%
%   Cálculo
%  ----------
%
% (*) O Lucro Líquido (Ano) será tomado a partir da soma dos 4 balanços do
%     ano completo.
%
% (*) O Lucro Líquido (Trimestre) se preocupará apenas com os valores
%     referente àquele trimestre considerado.
% 
% (*) O Lucro Líquido (Últimos 12 meses) se preocupará apenas com os 
%     valores referente aos somatório dos últimos 12 meses.
%
% (*) É interessante que o valor seja positivo e crescente.
%
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código    |                  Descrição                            |
% -------------------------------------------------------------------------
% | 3.11          | 'Lucro/Prejuizo Consolidado do Periodo'               |
% -------------------------------------------------------------------------
LucroTrimestre           = o.DemResultados.LucroPrejuizoConsolidadoDoPeriodo;

% 1.: Realiza a conta direta em relação ao referido trimestre.
% ------------------------------------------------------------
o.Indicador.LucroLiquido.Trimestre.x = o.Data.TRIMESTRE;
o.Indicador.LucroLiquido.Trimestre.y = LucroTrimestre;

% 2.: Faz o cálculo para o ano.
% -----------------------------
[SaidaX, SaidaY, Quantidade_Trimestres_Disponiveis_No_Referido_Ano] = sum_SomaAno(o, LucroTrimestre);
o.Indicador.LucroLiquido.Ano.x  = SaidaX;
o.Indicador.LucroLiquido.Ano.y  = SaidaY;

% 3. Faz o cálculo para os últimos 12 meses.
% ------------------------------------------
[Trimestre_Tomado_Como_Referencia, Ano_Tomado_Como_Referencia, ...
Soma_Ultimos_4_Trimestres] = sum_SomaDosUltimos4Trimestres(o, LucroTrimestre);

o.Indicador.LucroLiquido.Ultimos12Meses.x = Trimestre_Tomado_Como_Referencia;
o.Indicador.LucroLiquido.Ultimos12Meses.y = Soma_Ultimos_4_Trimestres;

end