function [] = grafico(o, varargin)

n = max(size(varargin))
% Parâmetros dos gráficos.
GrossuraLinha = 2;
TamanhoTitulo = 12;
TamanhoEixos  = 12;

% Qual Indicador?
if (n >= 1)
    n = max(size(varargin));
    Indicador = varargin{1};
    Indicador = char(Indicador);
end

% Coloração das linhas
if (n >= 2)
    Cor       = varargin{2};
end

% Escolha do trimestre.
if (n >= 3)
   QualTrimestre = varargin{3}; 
end

% Escolha do Indicador a ser plotado.
switch Indicador

        % ROE    
        case 'ROE'
            x = o.Indicador.ROE.x;
            y = o.Indicador.ROE.y;     
           
            if ( n < 3)
                plot(x, y, Cor, 'LineWidth', GrossuraLinha);
                title('ROE - Retorno sobre o Patrimônio Líquido', 'FontSize', TamanhoTitulo);
                xlabel('Ano', 'FontSize', TamanhoEixos);
                ylabel('%', 'FontSize', TamanhoEixos);
            else
                % Seleciona o plot do trimestre.
                [X, Y] = split_InformacaoEmTrimestre(o, x, y, QualTrimestre);
                
                stem(X, Y, Cor, 'filled');
                title('ROE - Retorno sobre o Patrimônio Líquido', 'FontSize', TamanhoTitulo);
                xlabel('Ano', 'FontSize', TamanhoEixos);
                ylabel('%', 'FontSize', TamanhoEixos);
            end

            
            
%         % Lucro Líquido 
%         case 'Lucro Líquido (Trimestre)'          
%                     x = o.Indicador.LucroLiquido.Trimestre.x;
%                     y = o.Indicador.LucroLiquido.Trimestre.y;
%                     plot(x, y, Cor, 'LineWidth', GrossuraLinha);
%                     title('Lucro Líquido (Trimestre)', 'FontSize', TamanhoTitulo);
%                     xlabel('Ano', 'FontSize', TamanhoEixos);
%                     ylabel('Valor em milhares de R$', 'FontSize', TamanhoEixos);
% 
%         case 'Lucro Líquido (Ano)'          
%                     x = o.Indicador.LucroLiquido.Ano.x;
%                     y = o.Indicador.LucroLiquido.Ano.y;
%                     plot(x, y, Cor, 'LineWidth', GrossuraLinha);
%                     title('Lucro Líquido (Ano)', 'FontSize', TamanhoTitulo);
%                     xlabel('Ano', 'FontSize', TamanhoEixos);
%                     ylabel('Valor em milhares de R$', 'FontSize', TamanhoEixos);                
% 
%         % Índice de Liquidez Corrente
%         case 'Índice de Liquidez Corrente'
%             x = o.Indicador.IndiceLiquidezCorrente.x;
%             y = o.Indicador.IndiceLiquidezCorrente.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Índice de Liquidez Corrente', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('');
% 
%         % Margem Bruta
%         case 'Margem Bruta'
%             x = o.Indicador.MargemBruta.x;
%             y = o.Indicador.MargemBruta.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Margem Bruta', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('%', 'FontSize', TamanhoEixos);  
% 
%         % Margem Líquida
%         case 'Margem Líquida'
%             x = o.Indicador.MargemLiquida.x;
%             y = o.Indicador.MargemLiquida.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Margem Líquida', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('%', 'FontSize', TamanhoEixos);
% 
%         % Dívida Bruta
%         case 'Dívida Bruta'
%             x = o.Indicador.DividaBruta.x;
%             y = o.Indicador.DividaBruta.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Dívida Bruta', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Valor em milhares de R$', 'FontSize', TamanhoEixos);      
% 
%         % Dívida Líquida
%         case 'Dívida Líquida'
%             x = o.Indicador.DividaLiquida.x;
%             y = o.Indicador.DividaLiquida.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Dívida Líquida', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Valor em milhares de R$', 'FontSize', TamanhoEixos); 
% 
%         % Margem EBIT
%         case 'Margem EBIT'
%             x = o.Indicador.MargemEBIT.x;
%             y = o.Indicador.MargemEBIT.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Margem EBIT', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('%');
% 
%         % VPA
%         case 'VPA'
%             x = o.Indicador.VPA.x;
%             y = o.Indicador.VPA.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('VPA', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('');
% 
%         % Quantidade de ações
%         case 'Quant. de Ações'
%             y = o.QuantAcoes;
%             x = o.Data.TRIMESTRE;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Quantidade de Ações', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Em milhares');    
% 
%         % Ações em Tesouraria
%         case 'Ações em Tesouraria'
%             y = o.AcoesTesouraria;
%             x = o.Data.TRIMESTRE;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Quantidade de Ações em Tesouraria', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Em milhares');         
% 
%         % Dividendos
%         case 'Dividendos'
%             y = o.Indicador.Dividendos.Ano.y;
%             x = o.Indicador.Dividendos.Ano.x;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Dividendos', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Em milhares');
% 
%         % Despesas por Lucro Bruto
%         case 'Despesas por Lucro Bruto'
%             x = o.Indicador.DespesasPorLucroBruto.x;
%             y = o.Indicador.DespesasPorLucroBruto.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Despesas por Lucro Bruto', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Em %');        
% 
%         % Lucro antes dos Impostos
%         case 'Lucro antes dos Impostos'
%             x = o.Indicador.LucroAntesDosImpostos.x;
%             y = o.Indicador.LucroAntesDosImpostos.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Lucro antes dos Impostos', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Em milhares');        
% 
%         % Vendas Brutas
%         case 'Vendas Brutas'
%             x = o.Indicador.Vendas.x;
%             y = o.Indicador.Vendas.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Vendas Brutas', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Em milhares');        
%     end
end