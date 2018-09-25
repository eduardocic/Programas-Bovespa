function [Trimestre_Tomado_Como_Referencia, Ano_Tomado_Como_Referencia, ...
          Soma_Ultimos_4_Trimestres] = sum_SomaDosUltimos4Trimestres(o, y)

% 1.: Verifica a quantidade de anos.
% -----------------------------------
Ano       = o.Data.Ano;             % Dados ainda brutos (todos eles disponíveis).
Mes       = o.Data.Mes;             % Dados ainda brutos (todos eles disponíveis).
n         = max(size(Ano));         % Quantos informações trimestrais 
                                    % estão disponíveis?
                                    
if (n >= 4)
   contador = 0;
   for i = 4:n
       contador = contador + 1;
       soma     = 0;
       for j = 1:4
           soma = soma + y(i-j+1);           
       end
       Soma_Ultimos_4_Trimestres(contador)   = soma;         % Somatório dos último 4 trimestres.
       
       % Olhando a partir do referido mês
       Trimestre_Tomado_Como_Referencia(contador) = Mes(i);  
       Ano_Tomado_Como_Referencia(contador)       = Ano(i);
   end
else
    contador = contador + 1;
    soma     = 0;
    for i = 1:n
       soma = soma + y(i-j+1);           
       
       % Olhando a partir do referido mês
       Trimestre_Tomado_Como_Referencia(contador) = Mes(i);  
       Ano_Tomado_Como_Referencia(contador)       = Ano(i);
    end
    Soma_Ultimos_4_Trimestres(contador)   = soma;         % Somatório dos último 4 trimestres.
end
                                    
                                  
end