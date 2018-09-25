function [o] = ind_ROE(o)

% Eduardo H. Santos
% Data: 12/03/2018
% 
%   Significado
%  -------------
%
%   ROE é um indicador financeiro PERCENTUAL que se refere à capacidade de
% uma empresa em agregar valor a ela mesma utilizando os seus próprios
% recursos. Isto é, quanto ela consegue crescer usando nada além daquilo
% que ela já tem.
%
%
%   Cálculo
%  ----------
%                              
%                                 Lucro Líquido
%                       ROE  = -------------------- x 100%
%                               Patrimônio Líquido
% 
% (*) No caso do presente programa, o cálculo será tomado utilizando-se
%     os últimos 12 meses, calculados a cada trimestre. Ou seja, em
%     cada trimestre, eu irei olhar os resultados do trimestre atual e dos
%     últimos 3 para fechar o balanço;
%
% (*) O Patrimônio Líquido será tomado a partir do valor disponibilizado no
%     último balanço;
% 
% OBS: Obviamente, você pode tomar o valor médio dos últimos 4 trimestres. 
%      No caso aqui, eu tomarei o valor obtido para o referido trimestre
%      apenas (de forma direta mesmo).
%
% (*) O Lucro Líquido será tomado a partir da soma dos 4 últimos balanços
%     disponibilizados;
%
% (*) Após a obtenção do valor, multiplica-se o mesmo por 100% para obter o
%     o seu valor em '%';
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
% | 2.03          | 'Patrimônio Líquido Consolidado'                      |
% | 3.11          | 'Lucro/Prejuizo Consolidado do Período'               |
% -------------------------------------------------------------------------

%**************************************************************************
% 1.: Pega os valores aos quais serão calculados no objeto.
PatrimonioLiquido = o.Passivos.PatrimonioLiquidoConsolidado;
LucroTrimestre    = o.DemResultados.LucroPrejuizoConsolidadoDoPeriodo;
n = max(size(o.Data.Ano));

%**************************************************************************
% 2.: Obtenção do resultado dos Lucro Líquido por meio da SOMA dos 4 
%     últimos trimestres.
[~, ~, Soma_LucroLiquido] = sum_SomaDosUltimos4Trimestres(o, LucroTrimestre);

%**************************************************************************
% 3.: Como desejo apenas os valores do Patrimônio Líquido, tomarei os
%     valores referentes ao 4º trimestre em diantes.
if (n >= 4)
    PatrimonioLiquido              = PatrimonioLiquido(4:end);
    Trimestre = o.Data.TRIMESTRE;
    Trimestre = Trimestre(4:end);
else
    Trimestre = o.Data.TRIMESTRE;
end

%**************************************************************************
% 4.: Resultado da operação de divisão termo a termo.
for i = 1:max(size(PatrimonioLiquido))
    if (PatrimonioLiquido(i) == 0)
        ROE(i) = 0;
    else        
        ROE(i) = Soma_LucroLiquido(i)/PatrimonioLiquido(i);
    end
end
    
% 5.: Cálculo do ROE em %.
ROE = 100*ROE;

% 6.: Salva o indicador.
o.Indicador.ROE.Ultimos12Meses.x = Trimestre;
o.Indicador.ROE.Ultimos12Meses.y = ROE;

% %**************************************************************************
% % 7.: Cálculo do ano.
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