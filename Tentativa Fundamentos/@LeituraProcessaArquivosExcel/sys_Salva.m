function [o] = sys_Salva(o)

% Criando um delimitador para o arquivo a ser salvo com o nome da empresa.
File = strcat(o.NomeEmpresa, '.mat');
save(File, 'o');

end