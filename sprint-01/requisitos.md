# Requisitos arquiteturais — Sprint 1

## Contexto

A expansão dos cursos de Computação exige automatizar a correção de trabalhos de programação. A comparação de códigos demanda CPU, e o LMS legado não suporta picos de conexões e passa por janelas de indisponibilidade. Os trabalhos são propriedade intelectual dos alunos e podem conter código não confiável.

## Requisitos funcionais (identificadores propostos para rastreabilidade)

| ID | Requisito | Critério de aceite proposto |
|---|---|---|
| RF-01 | Receber código submetido pelo aluno | Confirmar aceitação e permitir acompanhamento do status sem aguardar a correção. |
| RF-02 | Proteger identificadores antes da avaliação | Encaminhar somente dados necessários e manter o vínculo aluno-token sob acesso restrito. |
| RF-03 | Executar e corrigir trabalhos de programação | Executar código não confiável em ambiente isolado e registrar resultados. |
| RF-04 | Comparar submissões para detectar similaridade | Produzir resultado de comparação e relatório para consulta docente. |
| RF-05 | Integrar resultados ao LMS legado | Entregar notas de forma controlada, respeitando capacidade e janelas do legado. |
| RF-06 | Consultar resultados e status | Alunos acompanham submissões; professores consultam resultados conforme autorização. |

## Requisitos não funcionais

| ID | Driver | Meta ou restrição | Decisão relacionada |
|---|---|---|---|
| RNF-01 | Segurança e privacidade | Pseudonimizar antes da comparação; nenhum código de aluno executado diretamente no host de produção. | ADR-002 |
| RNF-02 | Escalabilidade | Dimensionar para pico estimado de 11 RPS e cenário de 5.000 envios nas duas últimas horas. | ADR-014 (numeração proposta) |
| RNF-03 | Desempenho | Confirmar 100% das submissões em menos de 2 s no cenário QAW; concluir correção e relatório em até 4 h após o prazo. | ADR-001, ADR-014 |
| RNF-04 | Disponibilidade | Continuar aceitando trabalhos durante a indisponibilidade do mainframe, respeitando capacidade de armazenamento e fila. | ADR-001 |
| RNF-05 | Interoperabilidade | Desacoplar o fluxo do LMS; limitar concorrência e respeitar janelas de integração. | ADR-001 |
| RNF-06 | Capacidade | Considerar estimativa preliminar de 400 GB em cinco anos. | Análise BOTE |

As metas são requisitos ou estimativas, não resultados medidos. A documentação inicial não define SLA contratual do LMS, limite de conexões, política de retenção detalhada ou protocolo real. Esses pontos precisam de confirmação. Os IDs RF/RNF são novos, propostos para a Sprint 4.

Fontes: PesquisaMatheusSidney.pdf, pp. 2–7; SPRINT01 20.08.pdf, pp. 1–2; CheckYourWork_Arquitetura.pptx, slides 2–8.
