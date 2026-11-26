workspace "Check Your Work - Sprint 2" "C4 historico" {
 model {
  aluno = person "Aluno"
  prof = person "Professor"
  sso = softwareSystem "SSO Institucional"
  turnitin = softwareSystem "TurnItIn"
  lms = softwareSystem "Mainframe"
  cyw = softwareSystem "Check Your Work" {
   web = container "Aplicacao Web" "Submissao e consulta" "React"
   api = container "API de Submissoes" "Valida e registra" "REST/JSON"
   fila = container "Mensageria" "Eventos assincronos" "AMQP"
   priv = container "Servico de Anonimizacao" "Pseudonimiza" "Worker"
   aval = container "Servico de Avaliacao" "Corrige em sandbox" "Workers elasticos"
   db = container "Banco de Dados" "Historico e auditoria" "Relacional"
   acl = container "Adaptador Academico" "Traduz notas" "ACL"
  }
  aluno -> web "Submete"
  prof -> web "Consulta"
  web -> api "Envia" "HTTPS/JSON"
  api -> sso "Valida identidade" "OIDC"
  api -> db "Registra"
  api -> fila "Publica submissao.recebida" "AMQP"
  fila -> priv "Entrega evento" "AMQP"
  priv -> fila "Publica submissao.anonimizada" "AMQP"
  fila -> aval "Entrega evento" "AMQP"
  aval -> turnitin "Consulta via adaptador" "HTTPS"
  aval -> db "Persiste resultado"
  aval -> fila "Publica avaliacao.concluida" "AMQP"
  fila -> acl "Entrega nota" "AMQP"
  acl -> lms "Envia de forma controlada" "Contrato a confirmar"
 }
 views {
  container cyw "ContainersSprint2" {
   include *
   autoLayout lr
  }
 }
}
