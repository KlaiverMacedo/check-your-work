# Modelo C4 — Nível 1 (Models-as-Code)

`contexto.dsl` representa a visão inicial de contexto em Structurizr DSL. O modelo mostra alunos, professores, a plataforma, SSO institucional e LMS legado. O SSO consta no documento de papéis da Sprint 1 (p. 2), embora o slide 7 não o mostre. Não são expostos os contêineres internos neste nível. A integração externa é apresentada de modo conceitual, sem afirmar o protocolo real do legado.

## Como validar

Abra o conteúdo de `contexto.dsl` em uma ferramenta compatível com Structurizr DSL (por exemplo, Structurizr Lite/CLI, conforme instalação disponível). Se estiver usando a CLI clássica, a partir da raiz do repositório:

```sh
structurizr-cli validate -workspace sprint-01/diagramas/contexto.dsl
```

Verifique que o modelo renderiza a visão `ContextoSprint1`, que os dois atores interagem com o sistema e que as integrações externas estão fora da fronteira. A sintaxe foi revisada estruturalmente, mas não foi executada em um parser Structurizr neste ambiente. Não declare validação oficial até executar a ferramenta.

Fontes: CheckYourWork_Arquitetura.pptx, slide 7; SPRINT01 20.08.pdf, p. 2; Contexto e Contêineres (1).docx.
