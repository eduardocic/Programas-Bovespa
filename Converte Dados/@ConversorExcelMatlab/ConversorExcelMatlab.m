classdef ConversorExcelMatlab
    %UNTITLED7 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        raiz
        
        NomeArquivo_Excel
        CaminhoArquivo
        
        Empresa
        Arquivo
        flagArquivos
        
        file
        
        T1
        T2
        T3
        T4
        T5
    end
    
    methods
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %                           Construtor
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function [o] = ConversorExcelMatlab(o)
            
            %%% Pega o diretório de onde estão os arquivos Excel oriundos 
            %%% da CVM.
            o.raiz    = pwd;
            
            %%% 1.: Seleciona todos os arquivos '.xls' os quais eu gostaria
            %%%     de ler para uma determinada empresa.
            TituloJanela = 'Selecione os arquivos .xls CVM.';
            [o.NomeArquivo_Excel, o.CaminhoArquivo, ~] = uigetfile(fullfile(o.raiz, '*.xls'), 'MultiSelect', 'on', TituloJanela);
            rmpath([o.CaminhoArquivo]);
            addpath([o.CaminhoArquivo]); 
            
            
            %%% 2.: Ler os referidos arquivos .xls e gera o seu respectivo 
            %%%     arquivo '.mat'.
            o.NomeArquivo_Excel = cellstr(o.NomeArquivo_Excel);
            o.flagArquivos = max(size(o.NomeArquivo_Excel));
            
            if (o.flagArquivos == 1)
                theta  = waitbar(0, sprintf('Gerando o balanço trimestral...', o.flagArquivos));
                o.Empresa{1} = importdata(o.NomeArquivo_Excel{1});
                o.Arquivo{1} = o.fnConversor(1);
                o.fnConversor(1);
                waitbar(1); 
            else
                theta  = waitbar(0, sprintf('Gerando os balanços trimestrais...', o.flagArquivos));
                for i = 1:(o.flagArquivos)
                    o.Empresa{i} = importdata(o.NomeArquivo_Excel{i});
                    o.Arquivo{i} = o.fnConversor(i);
%                     o.fnConversor(i);
                    waitbar(i/o.flagArquivos); 
                end
            end
        end
        
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %                         Demais Métodos
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [o] = Tabela2Consolidado(o);
        [o] = Tabela3Consolidado(o);
        [o] = Tabela4Consolidado(o);
        [o] = Tabela5Consolidado(o);
        
        [o] = Tabela2Individual(o);
        [o] = Tabela3Individual(o);
        [o] = Tabela4Individual(o);
        [o] = Tabela5Individual(o);
    end
end

