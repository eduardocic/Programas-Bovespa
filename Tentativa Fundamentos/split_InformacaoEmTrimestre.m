function [X, Y] = split_InformacaoEmTrimestre(o, x, y, QualTrimestre)

m = max(size(x));
cont = 0;
for i = 1:m
    
   % Os primeiros trimestres apenas.
   if (QualTrimestre == 1)
       if(o.Data.Mes(i) == 3)
           display('Apenas no 1');
           cont = cont + 1;
           X(cont) = x(i)
           Y(cont) = y(i)
       end
   end
                    
   % Os segundos trimestres apenas.
   if (QualTrimestre == 2)
        if(o.Data.Mes(i) == 6)
            display('Apenas no 2');
            cont = cont + 1;
            X(cont) = x(i);
            Y(cont) = y(i);
        end
   end
                
   % Os terceiros trimestres apenas.
   if (QualTrimestre == 3)
       if(o.Data.Mes(i) == 9)
           display('Apenas no 3');
           cont = cont + 1;
           X(cont) = x(i);
           Y(cont) = y(i);
       end
   end
                
   % Os quartos trimestres apenas.
   if (QualTrimestre == 4)
       if(o.Data.Mes(i) == 12)
           display('Apenas no 4');
           cont = cont + 1;
           X(cont) = x(i);
           Y(cont) = y(i);
        end
   end     
end

end