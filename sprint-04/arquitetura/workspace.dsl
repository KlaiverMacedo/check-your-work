workspace "Check Your Work" "Arquitetura consolidada - proposta Sprint 4" {
 model {
  aluno = person "Aluno" "Envia trabalhos e acompanha status."
  prof = person "Professor" "Consulta nota e revisa suspeitas."
  sso = softwareSystem "SSO Institucional" "Identidade institucional."
  turnitin = softwareSystem "TurnItIn" "Verificacao externa de plagio."
  lms = softwareSystem "LMS Mainframe" "Sistema academico legado."
  cloud = softwareSystem "Provedor LLM cloud" "Analise complexa autorizada."
  cyw = softwareSystem "Check Your Work" "Correcao automatica e parecer semantico." {
   web = container "Aplicacao Web" "Envio e consulta" "React"
   gateway = container "API Gateway" "JWT e rate limit" "Gateway (produto a definir)"
   api = container "API de Submissoes" "Valida, registra e consulta status" "REST/JSON; Spring Boot proposto"
   subdb = container "BD Submissoes e Outbox" "Dados de submissao e eventos a publicar" "PostgreSQL" "Database"
   broker = container "RabbitMQ" "Filas duraveis, retry, DLQ" "AMQP"
   privacy = container "Servico de Privacidade" "Pseudonimiza codigo" "Worker"
   vault = container "Cofre de Pseudonimizacao" "Mapeamento token-aluno restrito" "Armazenamento cifrado" "Database"
   worker = container "Workers de Avaliacao" "Correcao deterministica e comparacao" "Node.js/TypeScript" {
    consumer = component "Consumidor de eventos" "Recebe submissao.anonimizada.v1" "AMQP"
    service = component "AvaliacaoService" "Orquestra testes e nota oficial" "Dominio"
    port = component "IAvaliacaoRepository" "Porta de persistencia" "Interface"
    repo = component "PostgresAvaliacaoRepository" "Implementa porta" "Adaptador"
    plagport = component "IVerificadorPlagioService" "Contrato interno de similaridade" "Interface"
    plagadapter = component "TurnItInAdapter" "ACL e breaker" "Adaptador HTTPS"
    publisher = component "Publicador de resultados" "Relay de outbox e eventos versionados" "AMQP"
   }
   sandbox = container "Sandbox de execucao" "Isolamento efemero e limites de recursos" "Runtime isolado (a validar)"
   avaldb = container "BD Avaliacoes e Outbox" "Nota oficial e eventos" "PostgreSQL" "Database"
   ai = container "AI Evaluation Engine" "Guardrails, embeddings, recuperacao e tiering; parecer auxiliar" "Consumidor assincrono"
   cache = container "Cache semantico" "Respostas validadas por contexto" "Redis Stack" "Database"
   vector = container "Banco vetorial" "Embeddings e referencias autorizadas" "Qdrant ou pgvector (a definir)" "Database"
   feedback = container "BD Pareceres" "Parecer auxiliar sem escrita na nota" "PostgreSQL" "Database"
   models = container "Model Gateway" "Abstrai modelos" "LiteLLM"
   slm = container "SLM local" "Feedback simples" "Modelo local (a definir)"
   integration = container "ACL Academica" "Adapter, breaker, conciliacao e envio controlado" "Worker / XML se confirmado"
   delivery = container "BD Integracao" "Pendencias, idempotencia e auditoria" "PostgreSQL" "Database"
   autonomy = container "Controlador MAPE-K" "Monitoramento e escalonamento limitado" "Controlador (proposta)"
  }
  aluno -> web "Envia codigo e consulta status" "HTTPS"
  prof -> web "Consulta nota e parecer" "HTTPS"
  web -> gateway "Requisicoes" "HTTPS/JSON"
  gateway -> sso "Valida identidade" "OIDC/JWT"
  gateway -> api "Encaminha requisicoes autorizadas" "HTTPS/JSON"
  api -> subdb "Registra submissao e outbox"
  api -> broker "Publica via relay; consome status" "AMQP"
  broker -> privacy "Entrega submissao.recebida.v1" "AMQP"
  privacy -> vault "Grava mapa restrito"
  privacy -> broker "Publica submissao.anonimizada.v1" "AMQP"
  broker -> worker "Entrega referencia protegida" "AMQP"
  worker -> sandbox "Executa testes isolados"
  worker -> turnitin "Consulta via ACL" "HTTPS a confirmar"
  worker -> avaldb "Persiste resultado e outbox"
  worker -> broker "Publica avaliacao.concluida.v1 e code.evaluated.v1" "AMQP"
  broker -> api "Atualiza status e referencia autorizada ao parecer" "AMQP"
  broker -> integration "Entrega nota oficial" "AMQP"
  integration -> delivery "Registra pendencia e entrega"
  integration -> lms "Envia nota em janela controlada" "SOAP/XML a confirmar"
  integration -> privacy "Solicita resolucao autorizada do token via contrato" "HTTPS interno"
  broker -> ai "Entrega code.evaluated.v1" "AMQP"
  ai -> cache "Consulta e grava parecer validado"
  ai -> vector "Recupera contexto autorizado"
  ai -> feedback "Persiste parecer auxiliar"
  ai -> models "Solicita inferencia higienizada" "HTTPS/JSON"
  models -> slm "Roteia tarefa simples"
  models -> cloud "Roteia tarefa complexa" "HTTPS"
  ai -> broker "Publica parecer.disponivel.v1 (proposta)" "AMQP"
  api -> ai "Consulta parecer autorizado via contrato (proposta)" "HTTPS/JSON"
  autonomy -> broker "Monitora fila"
  autonomy -> worker "Ajusta replicas sob limites"
  broker -> consumer "Entrega evento" "AMQP"
  consumer -> service "Delega avaliacao"
  service -> sandbox "Executa testes"
  service -> port "Salva resultado oficial"
  repo -> port "Implementa"
  repo -> avaldb "Persiste resultado e outbox"
  service -> plagport "Consulta similaridade"
  plagadapter -> plagport "Implementa"
  plagadapter -> turnitin "Consulta e traduz falhas" "HTTPS"
  publisher -> avaldb "Le outbox"
  publisher -> broker "Publica resultados" "AMQP"
 }
 views {
  systemContext cyw "Contexto" {
   include *
   autoLayout lr
  }
  container cyw "Containers" {
   include *
   autoLayout lr
  }
  component worker "ComponentesAvaliacao" {
   include *
   autoLayout lr
  }
  styles {
   element "Person" {
    shape Person
    background #204e78
    color #ffffff
   }
   element "Software System" {
    background #52667b
    color #ffffff
   }
   element "Container" {
    background #236a99
    color #ffffff
   }
   element "Database" {
    shape Cylinder
    background #26775d
    color #ffffff
   }
   element "Component" {
    background #dbeaf4
    color #17324a
   }
  }
 }
}
