function [a] = ind_Data(a, varargin)

% *************************************************************************
%  1. Verifica quantos datas est�o dispon�veis e pega os respectivos
%     trimestres e anos.
%  
%  (*) Guarda esses valores numa estrutura.
%  
%  (*) Em seguida, pega os valores dessa estrutura e aloca em uma vari�vel
%      chamada 'Data'.
% *************************************************************************
n = max(size(a.DatasTexto));
for i = 1:n
   Intermed = strsplit(a.DatasTexto{i},'/');
  
   Temp.Mes(i) = str2num(Intermed{2});
   Temp.Ano(i) = str2num(Intermed{3});
end

clear a.Data;
a.Data.Mes = Temp.Mes;
a.Data.Ano = Temp.Ano;

% *************************************************************************
% 2. Verifica se tem informa��o requerida para o offset (requerido apenas
%    para plotagem de gr�ficos).
% *************************************************************************
if (isempty(varargin))
    offsetTRIMESTRE = 0;
    offsetANO       = 0;
else
    offsetTRIMESTRE = varargin;
end
 
% *************************************************************************
% 3. Capta��o das datas no formato de TRIMESTRES e ANO. Isto facilitar� a
%    visualiza��o junto � interface gr�fica).
% *************************************************************************
contador  = 0;
for i=1:n
    a.Data.TRIMESTRE(i) = ((a.Data.Mes(i)-1.5)/12) + a.Data.Ano(i) - offsetTRIMESTRE;      
    
    if (mod(a.Data.Mes(i), 12) == 0)
        contador = contador + 1;
        a.Data.ANO(contador)  = a.Data.Ano(i) + offsetANO;   % com offset para o gr�fico.
    end
end

end