# QAW — Quality Attribute Workshop

## Stakeholders e drivers

| Stakeholder | Interesse |
|---|---|
| Alunos | Submeter trabalhos e acompanhar status, inclusive no fim do prazo. |
| Professores / Coordenação | Consultar notas e relatórios de plágio confiáveis. |
| TI / operação do LMS | Proteger a capacidade e a disponibilidade do mainframe. |
| DPO | Proteger dados pessoais e reduzir exposição de identificadores. |

O documento de papéis prioriza Segurança, Escalabilidade e Disponibilidade. A apresentação revisada (slide 3) explicita também Interoperabilidade como prioridade máxima, ao lado de Segurança e Escalabilidade. A disponibilidade permanece um driver do projeto.

| Atributo | Priorização documentada |
|---|---|
| Segurança | Máxima |
| Interoperabilidade | Máxima na apresentação revisada |
| Escalabilidade | Máxima na apresentação revisada |
| Disponibilidade | Prioritária no documento inicial |

## Cenário QAW original — Escalabilidade

| Elemento | Descrição |
|---|---|
| Fonte | Sistema web de submissões |
| Estímulo | 5.000 códigos-fonte concentrados nas duas horas finais do prazo |
| Ambiente | Pico de fim de semestre (explicitado na consolidação) |
| Artefato | Fila e motor de detecção de plágio |
| Resposta | Aceitar de forma assíncrona e escalar workers de processamento |
| Medida | 100% dos envios confirmados em menos de 2 segundos; correção e relatório dos 5.000 envios concluídos em até 4 horas após o fim do prazo |

## Cenários complementares para validação na Sprint 4

Os três cenários abaixo são uma formalização proposta a partir dos drivers da Sprint 1, e não resultados de testes.

| Atributo | Fonte e estímulo | Ambiente e artefato | Resposta esperada | Verificação proposta |
|---|---|---|---|---|
| Segurança | Aluno envia código não confiável | Operação normal/pico; sandbox e módulo de privacidade | Isolar execução e remover identificadores antes da análise | Verificar limites de recursos, ausência de acesso indevido ao host e ausência de identificadores diretos nos dados de avaliação |
| Interoperabilidade | Serviço entrega notas em volume elevado | Janela de integração; fila e adaptador legado | Traduzir contrato e limitar a concorrência | Verificar que o limite acordado com TI não é excedido; limite ainda a definir |
| Disponibilidade | Mainframe indisponível | Operação normal/pico; API e fila | Continuar recebendo submissões e reter notas para entrega posterior | Simular indisponibilidade e verificar aceitação durável e recuperação sem perda ou duplicidade |

Fontes: PesquisaMatheusSidney.pdf, p. 6; SPRINT01 20.08.pdf, pp. 1–2; CheckYourWork_Arquitetura.pptx, slide 3.
