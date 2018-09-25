function [] = grafico(o, varargin)

n = max(size(varargin))
% Par�metros dos gr�ficos.
GrossuraLinha = 2;
TamanhoTitulo = 12;
TamanhoEixos  = 12;

% Qual Indicador?
if (n >= 1)
    n = max(size(varargin));
    Indicador = varargin{1};
    Indicador = char(Indicador);
end

% Colora��o das linhas
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
                title('ROE - Retorno sobre o Patrim�nio L�quido', 'FontSize', TamanhoTitulo);
                xlabel('Ano', 'FontSize', TamanhoEixos);
                ylabel('%', 'FontSize', TamanhoEixos);
            else
                % Seleciona o plot do trimestre.
                [X, Y] = split_InformacaoEmTrimestre(o, x, y, QualTrimestre);
                
                stem(X, Y, Cor, 'filled');
                title('ROE - Retorno sobre o Patrim�nio L�quido', 'FontSize', TamanhoTitulo);
                xlabel('Ano', 'FontSize', TamanhoEixos);
                ylabel('%', 'FontSize', TamanhoEixos);
            end

            
            
%         % Lucro L�quido 
%         case 'Lucro L�quido (Trimestre)'          
%                     x = o.Indicador.LucroLiquido.Trimestre.x;
%                     y = o.Indicador.LucroLiquido.Trimestre.y;
%                     plot(x, y, Cor, 'LineWidth', GrossuraLinha);
%                     title('Lucro L�quido (Trimestre)', 'FontSize', TamanhoTitulo);
%                     xlabel('Ano', 'FontSize', TamanhoEixos);
%                     ylabel('Valor em milhares de R$', 'FontSize', TamanhoEixos);
% 
%         case 'Lucro L�quido (Ano)'          
%                     x = o.Indicador.LucroLiquido.Ano.x;
%                     y = o.Indicador.LucroLiquido.Ano.y;
%                     plot(x, y, Cor, 'LineWidth', GrossuraLinha);
%                     title('Lucro L�quido (Ano)', 'FontSize', TamanhoTitulo);
%                     xlabel('Ano', 'FontSize', TamanhoEixos);
%                     ylabel('Valor em milhares de R$', 'FontSize', TamanhoEixos);                
% 
%         % �ndice de Liquidez Corrente
%         case '�ndice de Liquidez Corrente'
%             x = o.Indicador.IndiceLiquidezCorrente.x;
%             y = o.Indicador.IndiceLiquidezCorrente.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('�ndice de Liquidez Corrente', 'FontSize', TamanhoTitulo);
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
%         % Margem L�quida
%         case 'Margem L�quida'
%             x = o.Indicador.MargemLiquida.x;
%             y = o.Indicador.MargemLiquida.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Margem L�quida', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('%', 'FontSize', TamanhoEixos);
% 
%         % D�vida Bruta
%         case 'D�vida Bruta'
%             x = o.Indicador.DividaBruta.x;
%             y = o.Indicador.DividaBruta.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('D�vida Bruta', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Valor em milhares de R$', 'FontSize', TamanhoEixos);      
% 
%         % D�vida L�quida
%         case 'D�vida L�quida'
%             x = o.Indicador.DividaLiquida.x;
%             y = o.Indicador.DividaLiquida.y;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('D�vida L�quida', 'FontSize', TamanhoTitulo);
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
%         % Quantidade de a��es
%         case 'Quant. de A��es'
%             y = o.QuantAcoes;
%             x = o.Data.TRIMESTRE;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Quantidade de A��es', 'FontSize', TamanhoTitulo);
%             xlabel('Ano', 'FontSize', TamanhoEixos);
%             ylabel('Em milhares');    
% 
%         % A��es em Tesouraria
%         case 'A��es em Tesouraria'
%             y = o.AcoesTesouraria;
%             x = o.Data.TRIMESTRE;
%             plot(x, y, Cor, 'LineWidth', GrossuraLinha); grid;
%             title('Quantidade de A��es em Tesouraria', 'FontSize', TamanhoTitulo);
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