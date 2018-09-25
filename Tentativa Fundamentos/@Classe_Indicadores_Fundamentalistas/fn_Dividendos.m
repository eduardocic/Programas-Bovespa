function [a] = fn_Dividendos(a)

% Eduardo H. Santos
% Data: 16/03/2017
% 
%   Significado
%  -------------
%
%   DIVIDENDOS � o quanto a empresa retorna aos acionistas a partir dos
%   lucros obtidos no per�odo. Aqui est� sendo considerado tanto o 'Juros
%   Sobre o Capital Pr�prio' (o qual existe a incid�ncia de Imposto) bem
%   como o 'dividendos' (sem impostos).
%
%
%   C�lculo
%  ----------
%
%
%   Localiza��o dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     C�digo      |                  Descri��o                          |
% -------------------------------------------------------------------------
% |'2.01.05.02.01'  | Dividendos e JCP a pagar'                           |
% -------------------------------------------------------------------------

% 1.: Realiza a conta direta em rela��o ao referido trimestre.
Dividendos           = a.Passivos.DividendosEJCPAPagar;

% 2.: Faz o c�lculo para o ano.
[SaidaX, SaidaY] = SomaAno(a, Dividendos);
[flag, SaidaX2, SaidaY2] = SomaAcumuladaAnoIncompleto(a, Dividendos);
if (flag == 1)    
    a.Indicador.Dividendos.Ano.x  = [SaidaX SaidaX2];
    a.Indicador.Dividendos.Ano.y  = [SaidaY SaidaY2];
else
    a.Indicador.Dividendos.Ano.x  = SaidaX;
    a.Indicador.Dividendos.Ano.y  = SaidaY;
end
end