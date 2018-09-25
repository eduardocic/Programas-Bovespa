function [o] = sys_Excel2Matlab(o)

o.Tabela1     = o.Empresa.data.Bal0x2EPatrim0x2E;          % Primeira Tabela.
o.Tabela2     = o.Empresa.data.Dem0x2EResult0x2E;          % Segunda Tabela.
o.Textos      = o.Empresa.textdata.Bal0x2EPatrim0x2E;      % Todos os textos. 
o.DatasTexto  = o.Textos(2,2:end);                         % Todas as datas.


% Flipar os vetores.
% ------------------
n1 = size(o.Tabela1,1);        % Vari�veis totais Tabela-1.      
n2 = size(o.Tabela2,1);        % Vari�veis totais Tabela-2.      
m  = size(o.Tabela1,2);        % Balan�os.

% 1. Tabela 1.
for i = 1:n1
    Intermed = o.Tabela1(i,:);
    Intermed = wrev(Intermed);
    o.Tabela1(i,:) = Intermed;
end

for i = 1:n2
    Intermed = o.Tabela2(i,:);
    Intermed = wrev(Intermed);
    o.Tabela2(i,:) = Intermed;
end

o.DatasTexto = wrev(o.DatasTexto);


end