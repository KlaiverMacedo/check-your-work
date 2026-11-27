# Princípios SOLID
| Princípio | Aplicação | Verificação |
|---|---|---|
| SRP | Privacidade separada do cálculo de nota | Cofre restrito e fluxo pseudonimizado |
| OCP | Estratégias substituíveis de nota | Nova estratégia não altera serviço |
| LSP | Implementações preservam contratos de portas | Teste de contrato e falhas explícitas |
| ISP | Portas específicas de persistência e integração | Núcleo não exige operações de infraestrutura |
| DIP | IAvaliacaoRepository e IVerificadorPlagioService no núcleo | ArchUnit na Sprint 4 |

O fluxo de execução vai do serviço ao repositório, mas a dependência de compilação da implementação aponta para a interface do domínio. A demonstração é Java por exigência de ArchUnit; os workers de produção permanecem projetados para Node.js.
