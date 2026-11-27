# BOTE — Back-of-the-Envelope

Responsável pela pesquisa original: Matheus Henrique Heppe Santana. Consolidação para o repositório: Sprint 4.

## Estimativas registradas

| Grandeza | Valor de referência |
|---|---|
| Submissões concentradas | 5.000 nas duas últimas horas |
| Pico de requisições | 11 RPS |
| Armazenamento em cinco anos | 400 GB |
| Prazo de confirmação | Menos de 2 s |
| Prazo de conclusão | Até 4 h após o prazo |

## Memória de cálculo e limites

A média de chegada, se as 5.000 submissões forem distribuídas por duas horas, é `5.000 / 7.200 = 0,694 submissão/s`. Esse valor não é o pico de 11 RPS. O documento original explica a concentração de tráfego e fatores de segurança, mas não fornece a decomposição numérica completa dos 11 RPS. Se cada submissão correspondesse a uma única requisição, 11 RPS equivaleriam a um fator de aproximadamente 15,84 sobre a média de duas horas; esse fator é apenas uma relação matemática, não uma premissa original confirmada. Para reproduzir o pico é necessário conhecer a janela de maior concentração, chamadas por submissão e margem adotada.

Uma comparação exaustiva de pares entre 5.000 códigos teria `n × (n−1) / 2 = 12.497.500` pares, hipótese de comparação de todos contra todos. A carga real depende do algoritmo, tamanho dos códigos e otimizações; não é possível inferir quantidade de workers sem benchmark.

O escoamento de 5.000 submissões em quatro horas corresponde a uma vazão média de `5.000 / 14.400 = 0,347 submissão/s`, se todo o volume ainda estiver pendente ao final do prazo. Isso não inclui custo por comparação nem latência externa.

Para armazenamento, a fórmula original é `volume × tamanho médio × retenção + margem`. O valor de 400 GB em cinco anos é uma estimativa registrada, mas os insumos numéricos (quantidade anual, tamanho médio, backups, réplicas e margem) não foram especificados de forma reproduzível. A média linear implícita é 80 GB/ano, sem implicar crescimento real linear.

## Impacto arquitetural

- Separar ingestão de processamento pesado via mensageria.
- Escalar workers por demanda, observando profundidade e idade da fila.
- Dimensionar retenção, capacidade e monitoramento do armazenamento.
- Validar os números com testes de carga e dados institucionais antes de produção.

Fonte: PesquisaMatheusSidney.pdf, pp. 2–5 e 6; SPRINT01 20.08.pdf, p. 1. Cálculos acima são derivações explícitas, não medições.
