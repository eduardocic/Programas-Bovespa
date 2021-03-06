function [o] = ind_VPA(o)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   VPA � a sigla para Valor Patrimonial da A��o 
%
%
%   C�lculo
%  ----------        
% 
%                             Patrim�nio L�quido
%                      VPA = --------------------
%                               Total de A��es
%
% (*) Mesma considera��o dever� ser realizada para o Passivo Circulante
%
% (*) � interessante que este valor seja superior a 1.
% 
% (*) Estou utilizando a refer�ncia do site FUNDAMENTUS.
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo    |                  Descri��o                            |
% -------------------------------------------------------------------------
% | ----          | 'Total A��es'                                         |
% | 2.03          | 'Patrim�nio L�quido'                                  |
% -------------------------------------------------------------------------
totalAcoes         = o.Indicador.QuantidadeDeAcoes(1);
PatrimonioLiquido  = o.Passivos.PatrimonioLiquidoConsolidado;

for i=1:max(size(PatrimonioLiquido))
    o.Indicador.VPA.y(i)  = PatrimonioLiquido(i)/totalAcoes;
    o.Indicador.VPA.x     = o.Data.TRIMESTRE;
end