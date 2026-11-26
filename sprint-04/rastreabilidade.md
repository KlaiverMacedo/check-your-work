# Matriz de rastreabilidade
| Requisito | ADRs | Evidência / validação |
|---|---|---|
| RF-01, RF-06 recepção/status | 001,004,010 | C4 e sequência; 202 e autorização a testar |
| RF-02 privacidade | 002,006,009 | C4 e fluxo IA; teste PII real pendente |
| RF-03 correção isolada | 002,008,014 | C4 worker/sandbox; testes de isolamento pendentes |
| RF-04 similaridade/relatório | 003,005,009,011,015 | ACL/Builder e roteamento demo; qualidade real pendente |
| RF-05 notas no legado | 001,007,016 | Adapter/breaker demo; contrato, durabilidade e conciliação reais pendentes |
| RNF-01 segurança | 002,007,009 | JWT, PII, sandbox; validação real pendente |
| RNF-02 escala | 004,008,014 | QAW/BOTE; teste de 11 RPS e 5.000 envios pendente |
| RNF-03 desempenho | 001,014 | QAW <2 s; 4 h pós-prazo; teste pendente |
| RNF-04 disponibilidade | 001,004,016 | Simulação do breaker; teste integrado pendente |
| RNF-05 interoperabilidade | 001,005,007,016 | ACL e XML ilustrativo; protocolo real a confirmar |
| RNF-06 capacidade | 014 | 400 GB/5 anos (estimativa); benchmark pendente |
| RF-07 parecer de IA (novo) | 009,015 | Roteamento, fallback, feedback separado; modelos reais pendentes |
| RNF-07 governança de dependências (novo) | 003 | ArchUnit + CI; execução Maven pendente |

RF-07 e RNF-07 são refinamentos propostos. IDs anteriores preservados. Nenhum objetivo quantitativo é resultado medido.
