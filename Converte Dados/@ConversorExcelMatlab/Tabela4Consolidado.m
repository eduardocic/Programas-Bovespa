function [o] = Tabela4Consolidado(o)
% 4.:  QUARTA TABELA
%     ---------------
% 
%  (*) A parte de interesse aqui diz respeito � tabela intitulada
%     'DF Ind. - Resultado Periodo' do arquivo baixado do programa 
%     Empresa.net
%  (*) Todos os subfields com o ultimo digito '2' diz respeito ao resultado
%      acumulado at� aquele per�odo. Ser� importante para o levantamento do
%      resultado do �ltimo trimestre do per�odo. Mesmo n�o sendo necess�rio
%      salvar todos os dados (o que seria interessante apenas para o
%      terceiro trimestre do ano), ser� salvo aqui todos os dados.
o.T4.texto = {'Receita de Vendas de Bens e/ou Servi�os';
            'Custo dos Bens e/ou Servi�os Vendidos';
            'Resultado Bruto';
            'Despesas/Receitas Operacionais';
            'Despesas com Vendas';                      % Inserido 13/03/2016  
            'Despesas Gerais e Administrativas';        % Inserido 13/03/2016  
            'Resultado Antes do Resultado Financeiro e dos Tributos';
            'Resultado Financeiro';
            'Resultado Antes dos Tributos sobre o Lucro';
            'Imposto de Renda e Contribui��o Social sobre o Lucro';
            'Resultado L�quido das Opera��es Continuadas';
            'Resultado L�quido de Opera��es Descontinuadas';
            'Lucro/Preju�zo Consolidado do Per�odo';        % Alterado 16/03/2016
            'Atribu�do a S�cios da Empresa Controladora';   % Inserido 14/03/2016  
            'Atribu�do a S�cios N�o Controladores';         % Inserido 14/03/2016  
            };
        
o.T4.numero = {'3.01';
             '3.02';
             '3.03';
             '3.04';
             '3.04.01';                     % Inserido 13/03/2016
             '3.04.02';                     % Inserido 13/03/2016
             '3.05';
             '3.06';
             '3.07';
             '3.08';
             '3.09';
             '3.10';
             '3.11';
             '3.11.01';                     % Inserido 14/03/2016
             '3.11.02';                     % Inserido 14/03/2016
             };                   


% -------------------------------------------------------------------------
% Modifica��o realizada em 01/04/2017. Foi plotado que alguns programas
% apresentam problemas relativos aos n�meros da tabela.
m = size(o.file.dado.DFConsResultadoPeriodo,2);
alfa = 0;
flag = 1;
for j=1:m
    posicao = o.file.dado.DFConsResultadoPeriodo(1,j);
    if(isnan(posicao) == 0 && alfa == 0)
       flag = j;
       alfa = 1;
    end
end
o.file.dado.DFConsResultadoPeriodo = o.file.dado.DFConsResultadoPeriodo(1:end,flag:end);
% -------------------------------------------------------------------------          
         
         
Numero = o.file.texto.DFConsResultadoPeriodo(3:end,1);
Texto  = o.file.texto.DFConsResultadoPeriodo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Receita de Venda de Bens e/ou Servi�os'))
        if (strcmp(Numero{i},'3.01'))
            o.T4.ReceitaDeVendaDeBensEOUServicos  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Custo dos Bens e/ou Servi�os Vendidos'))
        if (strcmp(Numero{i},'3.02'))
            o.T4.CustoDosBensEOUServicosVendidos  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 

    if(strcmp(str1, 'Resultado Bruto'))
        if (strcmp(Numero{i},'3.03'))
            o.T4.ResultadoBruto  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Despesas/Receitas Operacionais'))
        if (strcmp(Numero{i},'3.04'))
            o.T4.DespesasReceitasOperacionais  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 
    
% -------------------------------------------------------------------------    
% Inserido 13/03/2016
    if(strcmp(str1, 'Despesas com Vendas'))
        if (strcmp(Numero{i},'3.04.01'))
            o.T4.DespesasComVendas  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 

    if(strcmp(str1, 'Despesas Gerais e Administrativas'))
        if (strcmp(Numero{i},'3.04.02'))
            o.T4.DespesasGeraisEAdministrativas  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 
% -------------------------------------------------------------------------    

    if(strcmp(str1, 'Resultado Antes do Resultado Financeiro e dos Tributos'))
        if (strcmp(Numero{i},'3.05'))
            o.T4.ResultadoAntesDoResultadoFinanceiroEDosTributos = ...
                o.file.dado.DFConsResultadoPeriodo(i,1);
            
        end
    end
    
    if(strcmp(str1, 'Resultado Financeiro'))
        if (strcmp(Numero{i},'3.06'))
            o.T4.ResultadoFinanceiro  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado Antes dos Tributos sobre o Lucro'))
        if (strcmp(Numero{i},'3.07'))
            o.T4.ResultadoAntesDosTributosSobreOLucro  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end 
    
    if(strcmp(str1, 'Imposto de Renda e Contribui��o Social sobre o Lucro'))
        if (strcmp(Numero{i},'3.08'))
            o.T4.ImpostoDeRendaEContribuicaoSocialSobreOLucro  = ...
                o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado L�quido das Opera��es Continuadas'))
        if (strcmp(Numero{i},'3.09'))
            o.T4.ResultadoLiquidoDasOperacoesContinuadas  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Resultado L�quido de Opera��es Descontinuadas'))
        if (strcmp(Numero{i},'3.10'))
            o.T4.ResultadoLiquidoDeOperacoesDescontinuadas  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
    end
    
    if(strcmp(str1, 'Lucro/Preju�zo Consolidado do Per�odo'))   % Alterado 16/03/2016
        if (strcmp(Numero{i},'3.11'))
            o.T4.LucroPrejuizoDoPeriodo  = o.file.dado.DFConsResultadoPeriodo(i,1);
        end
        
% -------------------------------------------------------------------------        
% Inserido dia 14/03/2016
        if (strcmp(Numero{i+1}, '3.11.01'))
            o.T4.AtribuidoASociosDaEmpresaControladora  = o.file.dado.DFConsResultadoPeriodo(i+1,1);
            o.T4.AtribuidoASociosNaoControladora        = o.file.dado.DFConsResultadoPeriodo(i+2,1);
        else
            o.T4.AtribuidoASociosDaEmpresaControladora  = o.file.dado.DFConsResultadoPeriodo(i,1);
            o.T4.AtribuidoASociosNaoControladora        = 0;
        end
% -------------------------------------------------------------------------      
    end   
end
end