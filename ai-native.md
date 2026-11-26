# AI-Native e autonomia
- Consumidor separado recebe code.evaluated.v1 após resultado determinístico. A nota e sua entrega ao LMS não esperam IA.
- Guardrail de entrada: higienização de PII, análise de conteúdo não confiável, separação de instruções e dados; delimitadores não bastam.
- Embeddings e recuperação semântica em banco vetorial (Qdrant ou pgvector, seleção pendente). RAG pode fornecer referências pedagógicas autorizadas, não dados de outras turmas sem permissão.
- Cache Redis Stack: similaridade >95% como hipótese, escopo por turma/atividade/versão e somente resposta validada. Miss segue Model Tiering.
- LiteLLM abstrai provedores; SLM local para tarefa simples e LLM cloud para complexa, conforme proposta Sprint 4 ADR-015. Saídas passam por JSON Schema e verificação de conteúdo. Falha → feedback seguro; suspeita requer revisão humana.
- MAPE-K: Monitor (fila, CPU, latência, falhas), Analyze (tendências/calendário), Plan (réplicas dentro de limites), Execute (escalar/reiniciar), Knowledge (histórico/configuração). Não concede autonomia para alterar notas nem acessar identidade.

## Economia de tokens
Hipóteses de origem: 60% de cache hit; 90% dos misses Tier 1 e 10% Tier 2; inferência < US$35/mês. Em 36 meses, US$1.260 como teto ilustrativo exclusivamente para inferência. Fórmula: N(1-h)[p(Tin1 Cin1 + Tout1 Cout1)+(1-p)(Tin2 Cin2 + Tout2 Cout2)]/1.000.000. SLM local tem custos de compute adicionais. Não há medição de custo ou precisão.

Fonte: ADR AI-Native aprovada 19/11/2026, pp. 1–5. [Fluxo](diagramas/ai-native.puml) · [MAPE-K](diagramas/mape-k.puml).
