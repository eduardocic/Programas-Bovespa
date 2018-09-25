function [a] = fn_DividaBruta(a)

% Eduardo H. Santos
% Data: 16/03/2017
% 
%   Significado
%  -------------
%
%   D�VIDA BRUTA � o valor total da d�vida da empresa em determinado
%   momento da hist�ria. Ou seja, � o valor total devido pela empresa em um
%   determinado instante de tempo.
%
%
%   C�lculo
%  ----------
%
%     D�vida Total = Empr�stimos e Financiamentos + Empr�stimos e Financiamentos
%   
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo      |                  Descri��o                          |
% -------------------------------------------------------------------------
% |'2.01.04'        | 'Empr�stimos e Financiamentos'                      |
% |'2.02.01'        | 'Empr�stimos e Financiamentos'                      |
% -------------------------------------------------------------------------


% 1.: Pega os valores disponibilizados 'Trimestre a Trimestre' na tabela do
%     Fundamentos.
CurtoPrazo           = a.Passivos.EmprestimosEFinanciamentos;
LongoPrazo           = a.Passivos.EmprestimosEFinanciamentos2;

% 2.: Agrupa o resultado
a.Indicador.DividaBruta.x = a.Data.TRIMESTRE;
a.Indicador.DividaBruta.y = CurtoPrazo + LongoPrazo;

end