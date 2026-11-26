workspace "Check Your Work - Sprint 1" "Modelo C4 de contexto da plataforma de correcao automatica." {
    model {
        aluno = person "Aluno" "Submete trabalhos e acompanha o status."
        professor = person "Professor / Coordenacao" "Consulta resultados, notas e relatorios."
        cyw = softwareSystem "Check Your Work" "Recebe trabalhos, realiza correcao e deteccao comparativa de plagio e integra notas ao LMS."
        sso = softwareSystem "SSO Institucional" "Provedor institucional de identidade." "External"
        lms = softwareSystem "LMS legado (Mainframe)" "Sistema academico de capacidade e disponibilidade restritas." "External"

        aluno -> cyw "Envia trabalhos e consulta status"
        professor -> cyw "Consulta notas e relatorios"
        cyw -> sso "Solicita autenticacao institucional"
        cyw -> lms "Entrega notas de forma controlada e desacoplada"
    }
    views {
        systemContext cyw "ContextoSprint1" {
            include *
            autoLayout lr
        }
        styles {
            element "Person" {
                shape Person
                background #1D4E89
                color #ffffff
            }
            element "Software System" {
                background #286EA8
                color #ffffff
            }
            element "External" {
                background #626D7A
                color #ffffff
            }
        }
    }
}
