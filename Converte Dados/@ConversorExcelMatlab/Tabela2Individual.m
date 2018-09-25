function [o] = Tabela2Individual(o)
% 2.:  SEGUNDA TABELA
%     -----------------
% 
%  (*) A parte de interesse aqui diz respeito � tabela intitulada
%     'DF Ind. - Ativo' do arquivo baixado do programa Empresa.net
o.T2.texto = {'Ativo Total';
              'Ativo Circulante';
              'Caixa e Equivalentes de Caixa';
              'Aplica��es Financeiras';
              'Contas a Receber';
              'Estoques';
              'Ativos Biol�gicos';
              'Tributos a Recuperar';
              'Despesas Antecipadas';
              'Outros Ativos Circulantes';
              'Ativo N�o Circulante';
              'Ativo Realiz�vel a Longo Prazo';
              'Investimentos';
              'Imobilizado';
              'Intang�vel';};
        
o.T2.numero = {'1';
               '1.01';
               '1.01.01';
               '1.01.02';
               '1.01.03';
               '1.01.04';
               '1.01.05';
               '1.01.06';
               '1.01.07';
               '1.01.08';
               '1.02';
               '1.02.01';
               '1.02.02';
               '1.02.03';
               '1.02.04';}; 
         
         
% -------------------------------------------------------------------------
% Modifica��o realizada em 01/04/2017. Foi plotado que alguns programas
% apresentam problemas relativos aos n�meros da tabela.
m = size(o.file.dado.DFIndAtivo,2);
alfa = 0;
flag = 1;
for j=1:m
    posicao = o.file.dado.DFIndAtivo(1,j);
    if(isnan(posicao) == 0 && alfa == 0)
       flag = j;
       alfa = 1;
    end
end
o.file.dado.DFIndAtivo = o.file.dado.DFIndAtivo(1:end,flag:end);
% -------------------------------------------------------------------------
         
         

Numero = o.file.texto.DFIndAtivo(3:end,1);
Texto  = o.file.texto.DFIndAtivo(3:end,2);
n = max(size(Texto));

for i=1:n
    str1 = Texto{i};
    
    if(strcmp(str1, 'Ativo Total'))
        if (strcmp(Numero{i},'1'))
            o.T2.AtivoTotal = o.file.dado.DFIndAtivo(i,1);
        end
    end    

    
    if(strcmp(str1, 'Ativo Circulante'))
        if (strcmp(Numero{i},'1.01'))
            o.T2.AtivoCirculante = o.file.dado.DFIndAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Caixa e Equivalentes de Caixa'))
        if (strcmp(Numero{i},'1.01.01'))
            o.T2.CaixaEEquivalenteDeCaixa = o.file.dado.DFIndAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Aplica��es Financeiras'))
        if (strcmp(Numero{i},'1.01.02'))
            o.T2.AplicacoesFinanceiras = o.file.dado.DFIndAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Contas a Receber'))
        if (strcmp(Numero{i},'1.01.03'))
            o.T2.ContasAReceber = o.file.dado.DFIndAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Estoques'))
        if (strcmp(Numero{i},'1.01.04'))
            o.T2.Estoques = o.file.dado.DFIndAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Ativos Biol�gicos'))
        if (strcmp(Numero{i},'1.01.05'))
            o.T2.AtivosBiologicos = o.file.dado.DFIndAtivo(i,1);  
        end
    end
    
    if(strcmp(str1, 'Tributos a Recuperar'))
        if (strcmp(Numero{i},'1.01.06'))
            o.T2.TributosARecuperar = o.file.dado.DFIndAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Despesas Antecipadas'))
        if (strcmp(Numero{i},'1.01.07'))
            o.T2.DespesasAntecipadas = o.file.dado.DFIndAtivo(i,1);
        end
    end
    
    if(strcmp(str1, 'Outros Ativos Circulantes'))
        if (strcmp(Numero{i},'1.01.08'))
            o.T2.OutrosAtivosCirculantes = o.file.dado.DFIndAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Ativo N�o Circulante'))
        if (strcmp(Numero{i},'1.02'))
            o.T2.AtivoNaoCirculante = o.file.dado.DFIndAtivo(i,1); 
        end
    end
    
    if(strcmp(str1, 'Ativo Realiz�vel a Longo Prazo'))
        if (strcmp(Numero{i},'1.02.01'))
            o.T2.AtivoRealizavelALongoPrazo = o.file.dado.DFIndAtivo(i,1);  
        end
    end
    
    if(strcmp(str1, 'Investimentos'))
        if (strcmp(Numero{i},'1.02.02'))
            o.T2.Investimentos = o.file.dado.DFIndAtivo(i,1);     
        end
    end
    
    if(strcmp(str1, 'Imobilizado'))
        if (strcmp(Numero{i},'1.02.03'))
            o.T2.Imobilizado = o.file.dado.DFIndAtivo(i,1);  
        end
    end
    
    if(strcmp(str1, 'Intang�vel'))
        if (strcmp(Numero{i},'1.02.04'))
            o.T2.Intangivel = o.file.dado.DFIndAtivo(i,1); 
        end
    end
end
end