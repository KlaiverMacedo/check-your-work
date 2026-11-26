# Integração e resiliência
| Origem → destino | Contrato | Tratamento |
|---|---|---|
| Web → Gateway → API | HTTPS/REST/JSON | JWT, rate limit, autorização e 202 após aceitação durável |
| API → RabbitMQ | AMQP / submissao.recebida.v1 | Outbox proposta; publisher confirms |
| Privacidade → Avaliação | AMQP / submissao.anonimizada.v1 | Referência protegida; dados mínimos |
| Avaliação → TurnItIn | HTTPS/REST a confirmar | ACL, timeout 10 s, retry até 3 tentativas, breaker 5 falhas / 30 s, plagio_pendente |
| Avaliação → integração/status | AMQP / avaliacao.concluida.v1 | Ack após persistência, idempotência, DLQ |
| Avaliação → IA | AMQP / code.evaluated.v1 | Fluxo auxiliar independente |
| Integração → Mainframe | SOAP/XML a confirmar | Adapter, fila durável, breaker, janela batch, conciliação |

Padronização proposta: nomes em português versionados para os três eventos históricos e code.evaluated.v1 para IA (antes code.evaluated). SubmissionReceived.v1 é alias histórico do primeiro. Não manter dois tipos canônicos para o mesmo evento. Cada envelope usa eventId, eventType, schemaVersion, occurredAt, submissionId e referências mínimas. Evitar código integral e PII em logs. Reentrega exige idempotência persistente; confirmação de publicação não equivale a transação atômica com banco. Outbox transacional e relay são proposta final. Contratos reais e limites de retry do Mainframe a validar.

[Sequência](diagramas/submissao.puml) · [ACL e breaker](../sprint-04/diagramas/mainframe-resiliencia.puml). Fontes: CHECK YOUR WORK.pdf, ADR-007, Laboratório Sprint 3.
