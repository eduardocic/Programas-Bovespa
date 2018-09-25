function [o] = ind_LucroLiquido(o)

% Eduardo H. Santos
% Data: 12/03/2018
% 
%   Significado
%  -------------
%
%   LUCRO L�QUIDO � relativo a todo a receita obtida pela empresa j�
%   tirando todas as obriga��es.
%
%
%   C�lculo
%  ----------
%
% (*) O Lucro L�quido (Ano) ser� tomado a partir da soma dos 4 balan�os do
%     ano completo.
%
% (*) O Lucro L�quido (Trimestre) se preocupar� apenas com os valores
%     referente �quele trimestre considerado.
% 
% (*) O Lucro L�quido (�ltimos 12 meses) se preocupar� apenas com os 
%     valores referente aos somat�rio dos �ltimos 12 meses.
%
% (*) � interessante que o valor seja positivo e crescente.
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% | 3.11          | 'Lucro/Prejuizo Consolidado do Periodo'               |
% -------------------------------------------------------------------------
LucroTrimestre           = o.DemResultados.LucroPrejuizoConsolidadoDoPeriodo;

% 1.: Realiza a conta direta em rela��o ao referido trimestre.
% ------------------------------------------------------------
o.Indicador.LucroLiquido.Trimestre.x = o.Data.TRIMESTRE;
o.Indicador.LucroLiquido.Trimestre.y = LucroTrimestre;

% 2.: Faz o c�lculo para o ano.
% -----------------------------
[SaidaX, SaidaY, Quantidade_Trimestres_Disponiveis_No_Referido_Ano] = sum_SomaAno(o, LucroTrimestre);
o.Indicador.LucroLiquido.Ano.x  = SaidaX;
o.Indicador.LucroLiquido.Ano.y  = SaidaY;

% 3. Faz o c�lculo para os �ltimos 12 meses.
% ------------------------------------------
[Trimestre_Tomado_Como_Referencia, Ano_Tomado_Como_Referencia, ...
Soma_Ultimos_4_Trimestres] = sum_SomaDosUltimos4Trimestres(o, LucroTrimestre);

o.Indicador.LucroLiquido.Ultimos12Meses.x = Trimestre_Tomado_Como_Referencia;
o.Indicador.LucroLiquido.Ultimos12Meses.y = Soma_Ultimos_4_Trimestres;

end