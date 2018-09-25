function [o] = sys_Passivos(o)

o.Passivos.texto = {'Passivo Total';
                    'Passivo Circulante';
                    'Obrigações Sociais e Trabalhistas';
                    'Fornecedores';
                    'Obrigações Fiscais';
                    'Empréstimos e Financiamentos';
                    'Outras Obrigações';       
                    'Passivos com Partes Relacionadas';
                    'Dividendos e JCP a Pagar';
                    'Provisões';
                    'Passivos sobre Ativos Não Correntes a Venda Descontinuados';
                    'Passivo Não Circulante';
                    'Empréstimos e Financiamentos';
                    'Outras Obrigações';
                    'Passivos com Partes Relacionadas';
                    'Tributos Diferidos';
                    'Provisões';
                    'Passivo sobre Ativos Não Correntes a Venda Descontinuados';
                    'Lucros e Receitas a Apropriar';
                    'Patrimônio Líquido Consolidado';       
                    'Capital Social Realizado';
                    'Reservas de Capital';
                    'Reservas de Reavalização';
                    'Reservas de Lucros';
                    'Lucro/Prejuízos Acumulados';
                    'Ajustes de Avaliação Patrimonial';
                    'Ajustes Acumulados de Conversão';
                    'Outros Resultados Abrangentes';
                    'Participação dos Acionistas Não COntroladores'};
        
o.Passivos.numero = {'2';
                     '2.01';
                     '2.01.01';
                     '2.01.02';
                     '2.01.03';
                     '2.01.04';
                     '2.01.05';
                     '2.01.05.01';
                     '2.01.05.02';
                     '2.01.05.02.01';
                     '2.01.06';
                     '2.01.07';
                     '2.02';
                     '2.02.01';
                     '2.02.02';
                     '2.02.02.01';
                     '2.02.03';
                     '2.02.04';
                     '2.02.05';
                     '2.02.06';
                     '2.03';
                     '2.03.01';
                     '2.03.02';
                     '2.03.03';
                     '2.03.04';
                     '2.03.05';
                     '2.03.06';
                     '2.03.07';
                     '2.03.08';
                     '2.03.09'};
                   
o.Passivos.PassivoTotal                                          = o.Tabela1(25,:);                    
o.Passivos.PassivoCirculante                                     = o.Tabela1(26,:); 
o.Passivos.ObrigacoesSociaisETrabalhistas                        = o.Tabela1(27,:); 
o.Passivos.Fornecedores                                          = o.Tabela1(28,:); 
o.Passivos.ObrigacoesFiscais                                     = o.Tabela1(29,:); 
o.Passivos.EmprestimosEFinanciamentos1                           = o.Tabela1(30,:); 
o.Passivos.PassivoComPartesRelacionadas1                         = o.Tabela1(31,:); 
o.Passivos.Outros                                                = o.Tabela1(33,:); 
o.Passivos.DividendosEJCPAPagar                                  = o.Tabela1(32,:); 
o.Passivos.Provisoes1                                            = o.Tabela1(34,:); 
o.Passivos.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados1 = o.Tabela1(35,:);
o.Passivos.PassivoNaoCirculante                                  = o.Tabela1(36,:);
o.Passivos.EmprestimosEFinanciamentos2                           = o.Tabela1(37,:);
o.Passivos.OutrasObrigacoes2                                     = o.Tabela1(39,:);
o.Passivos.PassivoComPartesRelacionadas2                         = o.Tabela1(38,:); 
o.Passivos.TributosDiferidos                                     = o.Tabela1(40,:);
o.Passivos.Provisoes2                                            = o.Tabela1(42,:);
o.Passivos.PassivosSobreAtivosNaoCorrentesAVendaEDescontinuados2 = o.Tabela1(43,:);
o.Passivos.LucrosEReceitasAApropriar                             = o.Tabela1(44,:);
o.Passivos.PatrimonioLiquidoConsolidado                          = o.Tabela1(46,:);
o.Passivos.CapitalSocialRealizado                                = o.Tabela1(47,:);
o.Passivos.ReservasDeCapital                                     = o.Tabela1(48,:);
o.Passivos.ReservasDeReavaliacao                                 = o.Tabela1(49,:);
o.Passivos.ReservasDeLucros                                      = o.Tabela1(50,:);
o.Passivos.LucrosPrejuizosAcumulados                             = o.Tabela1(51,:);
o.Passivos.AjustesDeAvaliacaoPatrimonal                          = o.Tabela1(52,:);
o.Passivos.AjustesAcumuladosDeConversao                          = o.Tabela1(53,:);
o.Passivos.OutrosResultadosAbrangentes                           = o.Tabela1(54,:);
o.Passivos.ParticipacaoDosAcionistasNaoControladores             = o.Tabela1(45,:);

o.Passivos.OutrasObrigacoes1 = o.Passivos.PassivoComPartesRelacionadas1 + ...
                               o.Passivos.Outros;


end