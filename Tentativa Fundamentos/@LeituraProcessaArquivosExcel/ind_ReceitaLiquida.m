function [o] = ind_ReceitaLiquida(o)

% Eduardo H. Santos
% Data: 12/03/2018
%
%   Significado
%  -------------
%
%   RECEITA LÍQUIDA é o
%
%
%   Cálculo
%  ----------        
%
%  
%
%   Localização dos itens
%  -----------------------
%
% -------------------------------------------------------------------------
% |     Código    |                  Descrição                            |
% -------------------------------------------------------------------------
% | 3.01          | 'Receita Líquida de Vendas e/ou Serviços'             |
% -------------------------------------------------------------------------
ReceitaLiquida = o.DemResultados.ReceitaLiquidaDeVendasEOUServicos;

% 1.: Cálculo do Índice.
[AnoX, Soma_ReceitaLiquida, Quantidade_Trimestres_Disponiveis_No_Referido_Ano] = sum_SomaAno(o, ReceitaLiquida);

% 2. Valor para o trimestre.
o.Indicador.ReceitaLiquida.Trimestre.x = o.Data.TRIMESTRE;
o.Indicador.ReceitaLiquida.Trimestre.y = ReceitaLiquida;

% 3. Valor para o ano.
o.Indicador.ReceitaLiquida.Ano.x = AnoX;
o.Indicador.ReceitaLiquida.Ano.y = Soma_ReceitaLiquida;

% 4. Último 12 meses.
[Trimestre_Tomado_Como_Referencia, Ano_Tomado_Como_Referencia, Soma_Ultimos_4_Trimestres] = sum_SomaDosUltimos4Trimestres(o, ReceitaLiquida);
o.Indicador.ReceitaLiquida.Ultimos12Meses.x = Trimestre_Tomado_Como_Referencia;
o.Indicador.ReceitaLiquida.Ultimos12Meses.y = Soma_Ultimos_4_Trimestres;

end