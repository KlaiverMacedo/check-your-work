# Registro mestre das ADRs
Numeração proposta para unificar os documentos; nenhum status histórico foi elevado para aprovado sem evidência. Datas são de origem quando conhecidas, não datas de commit. Aprovação da consolidação depende de PR.

| ADR | Decisão | Estado documental | Data de referência |
|---|---|---|---|
| [ADR-001](../../sprint-01/adrs/ADR-001.md) | Eventos e Mainframe | Aprovado na origem; consolidação pendente | Data não informada |
| [ADR-002](../../sprint-01/adrs/ADR-002.md) | Pseudonimização e sandbox | Apresentado; confirmar aprovação | Data não informada |
| [ADR-003](../../sprint-02/adrs/ADR-003.md) | DIP | Formalizado; confirmar aprovação | Data não informada |
| [ADR-004](../../sprint-03/adrs/ADR-004.md) | RabbitMQ | Proposta; escolha reafirmada na ADR-007 | 15/10/2026 |
| [ADR-005](../../sprint-03/adrs/ADR-005.md) | Resiliência TurnItIn | Proposta | 15/10/2026 |
| [ADR-006](../../sprint-03/adrs/ADR-006.md) | Bounded Contexts | Proposta | 22/10/2026 |
| [ADR-007](../../sprint-03/adrs/ADR-007.md) | Gateway e EIPs | Decisão documentada; confirmar aprovação | Data não informada |
| [ADR-008](../../sprint-03/adrs/ADR-008.md) | Node.js nos workers | Decisão documentada; confirmar aprovação | 12/11/2026 |
| [ADR-009](../../sprint-03/adrs/ADR-009.md) | AI-Native e guardrails | Aprovada na origem como 006; renumeração proposta | 19/11/2026 |
| [ADR-010](../../sprint-03/adrs/ADR-010.md) | API REST/JSON | Proposta; ID histórico 003 | 15/10/2026 |
| [ADR-011](../../sprint-03/adrs/ADR-011.md) | Adapter, Builder, Prototype | Consolidação proposta da APS2 | Data não informada |
| [ADR-012](../../sprint-03/adrs/ADR-012.md) | Strategy | Proposta; ID histórico 006 | Data não informada |
| [ADR-013](../../sprint-03/adrs/ADR-013.md) | MVC/MVVM | Proposta; ID histórico 008 | Data não informada |
| [ADR-014](../../sprint-01/adrs/ADR-014.md) | Escalonamento elástico | Apresentado como 003; ID proposto | Data não informada |
| [ADR-015](../../sprint-04/adrs/ADR-015.md) | Model Tiering local/cloud | Proposta Sprint 4 | 26/11/2026 |
| [ADR-016](../../sprint-04/adrs/ADR-016.md) | ACL Mainframe com Circuit Breaker | Proposta Sprint 4 | 26/11/2026 |

## Correspondência histórica
- Sprint 1: documento de papéis inverte 001/002 em relação à pesquisa e aos slides. Mantemos 001 mensageria e 002 privacidade; 003 de autoscaling passa a 014.
- Sprint 2: 003 é DIP; preservado.
- Sprint 3: 003 REST → 010; 004 RabbitMQ e 005 TurnItIn mantidos. O artigo cita 005 para microsserviços orientados a eventos; tratar como referência histórica, sem duplicar a decisão 001/004.
- 006 DDD permanece 006; 006 Strategy → 012; 007 Adapter → incorporado a 011 e 016; 008 MVC/MVVM → 013. 007 frameworks e 008 Node.js permanecem. O PDF AI-Native (nome 009, ID interno 006) fica 009 na proposta final.
- 015/016 são novas propostas explícitas para os requisitos finais. Revisar links, IDs e estados em equipe antes de fechar a entrega.

Fontes: documentos originais das Sprints 1–3 e enunciado final. Não substituir o histórico; preservar a identificação original nos arquivos.
