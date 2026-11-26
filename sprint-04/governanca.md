# Governança Git e peer-review
Repositório: KlaiverMacedo/check-your-work. Uma branch existente por integrante. Não renomear nem excluir branches sem consenso. Histórico de importação é atual, não simular datas de sprints passadas.

PR #1 contém template; obter aprovação, resolver conversas e mesclar. Proteção main exige PR e pelo menos uma aprovação. Cada autor sincroniza sua branch via merge da main, publica arquivos atribuídos, abre PR preenchido e solicita revisão. Não enviar toda a entrega por um único integrante. Proposta de ciclo: Klaiver revisa Gustavo; Gustavo revisa Matheus; Matheus revisa Klaiver. Revisores devem verificar linhas reais, deixar comentários técnicos relevantes e aprovar somente se adequado. A aprovação precisa ser feita na conta do colega.

## Distribuição proposta
| Integrante | Arquivos | Revisão |
|---|---|---|
| Klaiver | sprint-01, README principal, sprint-04/adrs, arquitetura, governança, rastreabilidade e rubrica | PR de Gustavo |
| Gustavo | sprint-02, sprint-04/demo-java (implementação de integração e testes), diagramas ACL | PR de Matheus |
| Matheus | sprint-03, revisão AI-Native/Model Tiering, diagramas de autonomia e workflow | PR de Klaiver |

Distribuição de Sprint 4 deve ser validada pela equipe. Os arquivos Java estão agrupados por módulo para evitar colisão, mas Gustavo e Matheus podem coordenar contribuições em arquivos diferentes. O conteúdo preparado é rascunho para revisão e defesa real dos integrantes; autoria acadêmica original não se confunde com autoria de commits.
