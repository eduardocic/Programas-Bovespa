classdef LeituraProcessaArquivosExcel
    
    properties
        Empresa
        
        % Dados ainda brutos.
        % -------------------
        Tabela1
        Tabela2
        Textos
        DatasTexto

        % Dados já alinhados e separados (prontos p/ gerar arquivos Excel).
        % -----------------------------------------------------------------
        NomeEmpresa
        Ativos
        Passivos
        DemResultados
       
        % Indicadores Fundamentalistas.
        % -----------------------------
        Data
        Indicador
    end
       
    methods 
        % =================================================================
        %                           CONSTRUTOR
        %
        % =================================================================
        function [o] = LeituraProcessaArquivosExcel(varargin)
           NomeArquivo_Excel = varargin{1};
           o.Empresa = importdata(NomeArquivo_Excel);  % Importa.
           o = o.sys_Excel2Matlab;
           o = o.sys_Ativos;
           o = o.sys_Passivos;
           o = o.sys_DemResultados;
           o = o.sys_NomeEmpresa;
           o = sys_QuantidadeDeAcoes(o);

                
           o = o.ind_Data;
           o = o.ind_ROE;                           % OK.
           o = o.ind_LucroLiquido;                  % OK. 
           o = o.ind_MargemBruta;                   % OK.
           o = o.ind_ReceitaLiquida;                % OK.
           o = o.ind_Ativo;                         % OK.
           o = o.ind_AtivoCirculante;               % OK.
           o = o.ind_PatrimonioLiquido;             % OK.
           o = o.ind_IndiceLiquidezCorrente;        % OK.
           o = o.ind_DisponibilidadeFinanceira;



          
%            o = o.ind_LucroPorAcao;           
%            o = o.ind_MargemLiquida;
%            o = o.ind_IndiceLiquidezCorrente;           
%            o = o.fn_MargemEBIT;
%            o = o.fn_DespesasPorLucroBruto;
%            o = o.fn_LucroAntesDosImpostos;
%            o = o.fn_ResultadoDeVendas;
%            o = o.fn_DividaBruta;
%            o = o.fn_DividaLiquida; 
%            o = o.ind_VPA;
           sys_Salva(o);

        end
        
        
        % =================================================================
        %                       DEMAIS MÉTODOS
        %
        % =================================================================
        [o] = sys_NomeEmpresa(o);
        [o] = sys_Excel2Matlab(o);
        [o] = sys_Ativos(o);
        [o] = sys_Passivos(o);
        [o] = sys_DemResultados(o);
        [o] = sys_QuantidadeDeAcoes(o)

        
        % Métodos para análise fundamentalista.
        [o] = ind_Data(o, varargin);
        [o] = ind_ROE(o, varargin);
        [o] = ind_IndiceLiquidezCorrente(o);
        [o] = ind_VPA(o);
        [o] = ind_LucroLiquido(o);
        [o] = ind_MargemBruta(o); 
        [o] = ind_MargemEBIT(o);
        [o] = ind_DespesasPorLucroBruto(o);
        [o] = ind_LucroAntesDosImpostos(o);
        [o] = ind_ResultadoDeVendas(o);
        [o] = ind_DividaBruta(o);
        [o] = ind_DividaLiquida(o);
        [o] = ind_ReceitaLiquida(o);
        [o] = ind_Ativo(o);
        [o] = ind_AtivoCirculante(o);
        [o] = ind_PatrimonioLiquido(o);
        [o] = ind_LucroPorAcao(o);
        [o] = ind_DisponibilidadeFinanceira(o);


        
        [o] = sys_Salva(o);
        []  = graph_plotaIndicador(o, varargin);
    end
    
end

