function [o] = ind_ROE(o)

% Eduardo H. Santos
% Data: 12/03/2018
% 
%   Significado
%  -------------
%
%   ROE � um indicador financeiro PERCENTUAL que se refere � capacidade de
% uma empresa em agregar valor a ela mesma utilizando os seus pr�prios
% recursos. Isto �, quanto ela consegue crescer usando nada al�m daquilo
% que ela j� tem.
%
%
%   C�lculo
%  ----------
%                              
%                                 Lucro L�quido
%                       ROE  = -------------------- x 100%
%                               Patrim�nio L�quido
% 
% (*) No caso do presente programa, o c�lculo ser� tomado utilizando-se
%     os �ltimos 12 meses, calculados a cada trimestre. Ou seja, em
%     cada trimestre, eu irei olhar os resultados do trimestre atual e dos
%     �ltimos 3 para fechar o balan�o;
%
% (*) O Patrim�nio L�quido ser� tomado a partir do valor disponibilizado no
%     �ltimo balan�o;
% 
% OBS: Obviamente, voc� pode tomar o valor m�dio dos �ltimos 4 trimestres. 
%      No caso aqui, eu tomarei o valor obtido para o referido trimestre
%      apenas (de forma direta mesmo).
%
% (*) O Lucro L�quido ser� tomado a partir da soma dos 4 �ltimos balan�os
%     disponibilizados;
%
% (*) Ap�s a obten��o do valor, multiplica-se o mesmo por 100% para obter o
%     o seu valor em '%';
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
% | 2.03          | 'Patrim�nio L�quido Consolidado'                      |
% | 3.11          | 'Lucro/Prejuizo Consolidado do Per�odo'               |
% -------------------------------------------------------------------------

%**************************************************************************
% 1.: Pega os valores aos quais ser�o calculados no objeto.
PatrimonioLiquido = o.Passivos.PatrimonioLiquidoConsolidado;
LucroTrimestre    = o.DemResultados.LucroPrejuizoConsolidadoDoPeriodo;
n = max(size(o.Data.Ano));

%**************************************************************************
% 2.: Obten��o do resultado dos Lucro L�quido por meio da SOMA dos 4 
%     �ltimos trimestres.
[~, ~, Soma_LucroLiquido] = sum_SomaDosUltimos4Trimestres(o, LucroTrimestre);

%**************************************************************************
% 3.: Como desejo apenas os valores do Patrim�nio L�quido, tomarei os
%     valores referentes ao 4� trimestre em diantes.
if (n >= 4)
    PatrimonioLiquido              = PatrimonioLiquido(4:end);
    Trimestre = o.Data.TRIMESTRE;
    Trimestre = Trimestre(4:end);
else
    Trimestre = o.Data.TRIMESTRE;
end

%**************************************************************************
% 4.: Resultado da opera��o de divis�o termo a termo.
for i = 1:max(size(PatrimonioLiquido))
    if (PatrimonioLiquido(i) == 0)
        ROE(i) = 0;
    else        
        ROE(i) = Soma_LucroLiquido(i)/PatrimonioLiquido(i);
    end
end
    
% 5.: C�lculo do ROE em %.
ROE = 100*ROE;

% 6.: Salva o indicador.
o.Indicador.ROE.Ultimos12Meses.x = Trimestre;
o.Indicador.ROE.Ultimos12Meses.y = ROE;

% %**************************************************************************
% % 7.: C�lculo do ano.
% PatrimonioLiquido_Original = o.Passivos.PatrimonioLiquidoConsolidado;
% [Ano_X, Soma_LucroLiquido_Ano, Quantidade_Trimestres] = sum_SomaAno(o, LucroTrimestre);
% 
% contador = 0;
% for i = 1:max(size(Quantidade_Trimestres))
%     
%     m = Quantidade_Trimestres(i);
%     if (m == 4)
%         contador = contador + 1
%         soma     = sum(Quantidade_Trimestres(1:i));
%         
%         if (PatrimonioLiquido_Original(soma) == 0)
%             AnoCompleto(contador) = Ano_X(i);
%             ROE_Ano(contador)     = 0;
%         else        
%             AnoCompleto(contador) = Ano_X(i);
%             ROE_Ano(contador)     = Soma_LucroLiquido_Ano(i)/PatrimonioLiquido_Original(soma);
%         end
%     end
% end
% 
% o.Indicador.ROE.Ano.x = AnoCompleto;
% o.Indicador.ROE.Ano.y = 100*ROE_Ano;


end