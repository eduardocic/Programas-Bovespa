function [o] = ind_PatrimonioLiquido(o)

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
% (*) É interessante que o valor seja crescente.
%
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código    |                  Descrição                            |
% -------------------------------------------------------------------------
% |     2.03      | 'Patrimônio Líquido Consolidado'                      |
% -------------------------------------------------------------------------
PatrimonioLiquido = o.Passivos.PatrimonioLiquidoConsolidado;

% 1.: Realiza a conta direta em relação ao referido trimestre.
o.Indicador.PatrimonioLiquido.x = o.Data.TRIMESTRE;
o.Indicador.PatrimonioLiquido.y = PatrimonioLiquido;

end