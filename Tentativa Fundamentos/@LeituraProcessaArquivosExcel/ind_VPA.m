function [o] = ind_VPA(o)

% Eduardo H. Santos
% Data: 15/03/2017
%
%   Significado
%  -------------
%
%   VPA é a sigla para Valor Patrimonial da Ação 
%
%
%   Cálculo
%  ----------        
% 
%                             Patrimônio Líquido
%                      VPA = --------------------
%                               Total de Ações
%
% (*) Mesma consideração deverá ser realizada para o Passivo Circulante
%
% (*) É interessante que este valor seja superior a 1.
% 
% (*) Estou utilizando a referência do site FUNDAMENTUS.
%
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código    |                  Descrição                            |
% -------------------------------------------------------------------------
% | ----          | 'Total Ações'                                         |
% | 2.03          | 'Patrimônio Líquido'                                  |
% -------------------------------------------------------------------------
totalAcoes         = o.Indicador.QuantidadeDeAcoes(1);
PatrimonioLiquido  = o.Passivos.PatrimonioLiquidoConsolidado;

for i=1:max(size(PatrimonioLiquido))
    o.Indicador.VPA.y(i)  = PatrimonioLiquido(i)/totalAcoes;
    o.Indicador.VPA.x     = o.Data.TRIMESTRE;
end