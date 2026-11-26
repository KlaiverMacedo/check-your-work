# Domain-Driven Design
| Contexto | Classificação proposta | Linguagem ubíqua | Dados de propriedade exclusiva |
|---|---|---|---|
| Avaliação | Core | Avaliação, nota, similaridade, parecer | Resultados determinísticos e parecer separado |
| Submissões | Supporting | Submissão, atividade, status | BD de Submissões e referência protegida |
| Privacidade | Supporting | Pseudônimo, token, código higienizado | Cofre cifrado |
| Integração Acadêmica | Supporting | Lançamento, pendência, conciliação | Fila de saída e registro de entrega |
| SSO | Generic (externo) | Identidade e autenticação | Dados mantidos pelo provedor |

Entidades e agregados propostos: Submissao (identidade e transições queued/processing/done), Avaliacao (nota oficial e resultado determinístico), LancamentoNota (estado pendente/enviado/conciliacao), MapeamentoToken (privado). ParecerIA é informação auxiliar, não altera Avaliacao. Pseudonimização não elimina a obrigação de proteção de dados. A IA fica no contexto Avaliação, com armazenamento próprio e sem acesso de escrita à nota.

## Mapa de contexto
[PlantUML](diagramas/context-map.puml). Submissões publica submissao.recebida.v1; Privacidade consome e publica submissao.anonimizada.v1 (Published Language/Customer-Supplier); Avaliação publica avaliacao.concluida.v1 via OHS para Submissões e Integração Acadêmica. TurnItIn e Mainframe são upstream externos quanto ao contrato e são isolados por ACL; a seta de chamada técnica pode ter direção diferente. SSO é contrato conformista OIDC. O protocolo SOAP/XML é hipótese até confirmação.

Fonte: Laboratório Sprint 3, pp. 1–7. Classificação e agregados são propostas de refinamento Sprint 4.
