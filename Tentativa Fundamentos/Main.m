clc;

% Pega o local onde est� a ra�z do sistema.
% -----------------------------------------
raiz    = pwd;
clc;
TituloJanela = 'Selecione os arquivos .xls Fundamentos.';
[NomeArquivo_Excel, CaminhoArquivo_Excel, ~] = uigetfile(fullfile(raiz, '*.xls'),...
                                                         'MultiSelect', 'on', ....
                                                         TituloJanela);
                                                     
% Adiciona o caminhos dos arquivos.                                                     
% ----------------------------------
rmpath([CaminhoArquivo_Excel]);
addpath([CaminhoArquivo_Excel]); 


% Verifica se existe UM ou V�RIOS Excel sendo chamados por vez.
% -------------------------------------------------------------
BIT = iscell(NomeArquivo_Excel);
if (BIT == 1)
    flagNumeroArquivos_Excel = size(NomeArquivo_Excel, 2);
else
    flagNumeroArquivos_Excel = 1;
end


% Carrega os arquivos.
% --------------------
if (flagNumeroArquivos_Excel == 1)
    h    = waitbar(0, sprintf('Gerando o balan�o trimestral... (1 de 1)'));
else   
    h    = waitbar(0, sprintf('Gerando os balan�os trimestrais... (1 de %d)', flagNumeroArquivos_Excel)); 
end

% Carregando os arquivos.
% -----------------------
if (flagNumeroArquivos_Excel == 1)
    o(1) = LeituraProcessaArquivosExcel(NomeArquivo_Excel);
    waitbar(0, h, sprintf('Gerando o balan�o trimestral... (1 de 1)'));
else
    for i = 1:flagNumeroArquivos_Excel
        o(i) = LeituraProcessaArquivosExcel(NomeArquivo_Excel{i});
        waitbar(i/flagNumeroArquivos_Excel, h, sprintf('Gerando os balan�os trimestrais... (%d de %d)', i, flagNumeroArquivos_Excel));
    end
end
close(h);
