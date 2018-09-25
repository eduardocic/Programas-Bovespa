function [a] = fn_LucroLiquido(a)

% Eduardo H. Santos
% Data: 15/03/2017
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
% | 3.11.01       | 'Atribu�do a S�cios da Empresa Controladora'          |
% -------------------------------------------------------------------------

% 1.: Realiza a conta direta em rela��o ao referido trimestre.
LucroTrimestre           = a.DemResultados.AtribuidoASociosDaEmpresaControladora;
a.Indicador.LucroLiquido.Trimestre.x = a.Data.TRIMESTRE;
a.Indicador.LucroLiquido.Trimestre.y = LucroTrimestre;

% 2.: Faz o c�lculo para o ano.
[SaidaX, SaidaY] = SomaAno(a, LucroTrimestre);
[flag, SaidaX2, SaidaY2] = SomaAcumuladaAnoIncompleto(a, LucroTrimestre);
if (flag == 1)    
    a.Indicador.LucroLiquido.Ano.x  = [SaidaX SaidaX2];
    a.Indicador.LucroLiquido.Ano.y  = [SaidaY SaidaY2];
else
    a.Indicador.LucroLiquido.Ano.x  = SaidaX;
    a.Indicador.LucroLiquido.Ano.y  = SaidaY;
end
end