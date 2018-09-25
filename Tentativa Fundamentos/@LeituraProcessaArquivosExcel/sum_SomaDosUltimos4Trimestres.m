function [Trimestre_Tomado_Como_Referencia, Ano_Tomado_Como_Referencia, ...
          Soma_Ultimos_4_Trimestres] = sum_SomaDosUltimos4Trimestres(o, y)

% 1.: Verifica a quantidade de anos.
% -----------------------------------
Ano       = o.Data.Ano;             % Dados ainda brutos (todos eles dispon�veis).
Mes       = o.Data.Mes;             % Dados ainda brutos (todos eles dispon�veis).
n         = max(size(Ano));         % Quantos informa��es trimestrais 
                                    % est�o dispon�veis?
                                    
if (n >= 4)
   contador = 0;
   for i = 4:n
       contador = contador + 1;
       soma     = 0;
       for j = 1:4
           soma = soma + y(i-j+1);           
       end
       Soma_Ultimos_4_Trimestres(contador)   = soma;         % Somat�rio dos �ltimo 4 trimestres.
       
       % Olhando a partir do referido m�s
       Trimestre_Tomado_Como_Referencia(contador) = Mes(i);  
       Ano_Tomado_Como_Referencia(contador)       = Ano(i);
   end
else
    contador = contador + 1;
    soma     = 0;
    for i = 1:n
       soma = soma + y(i-j+1);           
       
       % Olhando a partir do referido m�s
       Trimestre_Tomado_Como_Referencia(contador) = Mes(i);  
       Ano_Tomado_Como_Referencia(contador)       = Ano(i);
    end
    Soma_Ultimos_4_Trimestres(contador)   = soma;         % Somat�rio dos �ltimo 4 trimestres.
end
                                    
                                  
end