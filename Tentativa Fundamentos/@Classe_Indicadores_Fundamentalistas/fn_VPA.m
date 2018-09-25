function [a] = fn_VPA(a)

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
totalAcoes         = a.QuantAcoes;
PatrimonioLiquido  = a.Passivos.PatrimonioLiquido;

a.Indicador.VPA.y  = PatrimonioLiquido./totalAcoes;
a.Indicador.VPA.x  = a.Data.TRIMESTRE;
end