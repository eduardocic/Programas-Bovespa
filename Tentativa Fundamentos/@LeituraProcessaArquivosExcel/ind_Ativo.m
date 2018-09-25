function [o] = ind_Ativo(o)

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
% (*) � interessante que o valor seja crescente.
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% |       1       | 'Ativo Total'                                         |
% -------------------------------------------------------------------------
Ativos           = o.Ativos.AtivoTotal;

% 1.: Realiza a conta direta em rela��o ao referido trimestre.
o.Indicador.Ativos.x = o.Data.TRIMESTRE;
o.Indicador.Ativos.y = Ativos;

end