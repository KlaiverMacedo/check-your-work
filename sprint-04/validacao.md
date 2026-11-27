# Evidências de validação
## Executado no ambiente de preparação
Compilação Java com OpenJDK 21 usando `javac --release 17`, seguida de `java -cp ... br.edu.cyw.demo.Demo`. Saída real:
```text
PASS: DIP e Strategy: nota persistida
PASS: OCP: estrategia alternativa
PASS: Builder: laudo imutavel
PASS: Prototype: copia independente
PASS: Deduplicacao de evento pendente
PASS: Circuit Breaker abre apos falhas
PASS: OPEN: nenhuma chamada ao legado; nota pendente
PASS: HALF_OPEN recupera e fecha
PASS: Adapter XML escapa texto e traduz nota
PASS: Redelivery nao duplica entrega local
PASS: Cache hit validado
PASS: Cache limite estrito e SLM
PASS: Tier 2 para suspeita alta
PASS: Entrada bloqueada: fallback
PASS: IA nao modifica nota oficial
```
Resultado: 15 verificações demonstrativas passaram. Nenhuma dependência externa necessária para esta execução.

## Pendente / não executado
- Maven/JUnit/ArchUnit: ambiente não possui Maven e não resolve Maven Central. O workflow deve rodar no GitHub; não marcar como aprovado antes do resultado.
- DSL e PlantUML: arquivos-fonte produzidos; renderização e validação formal pendentes. SVG auxiliar gerado pelo Graphviz com sucesso, não prova validade do DSL.
- Testes de carga 11 RPS/5.000 submissões, testes reais de sandbox, LGPD, PII, prompt injection, recuperação vetorial, cache e inferência, integração real, durabilidade e conciliação de notas: pendentes.
- Regras de proteção e revisão: validar no repositório por contas reais. Não há evidências de merge nesta entrega.

A demonstração testa lógica local em memória e não comprova SLA ou garantia de entrega distribuída.
