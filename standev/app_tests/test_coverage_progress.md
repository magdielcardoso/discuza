# Documento de Progresso e Cobertura de Testes

**Data da Última Atualização:** $(date +%Y-%m-%d)

## 1. Visão Geral do Status dos Testes

Atualmente, a suíte de testes automatizados está configurada e integrada com o workflow de CI no GitHub Actions (`.github/workflows/ci.yml`).

*   **Status Geral:** Todos os testes existentes estão passando.
*   **Total de Testes Executados:** 12 (conforme último `rails test`)
*   **Falhas:** 0
*   **Erros:** 0
*   **Skips:** 1 (intencional, no `RepliesControllerTest#test_should_show_reply`)

## 2. Cobertura de Testes por Camada

### 2.1. Testes de Controller (`test/controllers`)

*   **`DiscussionsControllerTest` (`test/controllers/discussions_controller_test.rb`):**
    *   **Status:** PASSANDO
    *   **Cobertura:** Testa as ações CRUD básicas (`index`, `new`, `create`, `show`, `edit`, `update`, `destroy`), levando em consideração a autenticação do usuário (Devise) e a autorização do proprietário para ações sensíveis.

*   **`RepliesControllerTest` (`test/controllers/replies_controller_test.rb`):**
    *   **Status:** PASSANDO (com 1 skip)
    *   **Cobertura:** Testa as ações CRUD (`create`, `edit`, `update`, `destroy`) para respostas aninhadas em discussões. Inclui verificações de autenticação e uso correto de rotas aninhadas. O teste para a ação `show` está atualmente pulado (`skip`), pois a rota individual para exibir uma réplica não está implementada/priorizada.

*   **Outros Controllers:** Testes para outros controllers (ex: `HomeController`, `UsersController`, etc.) ainda não foram implementados ou revisados sistematicamente.

### 2.2. Testes de Model (`test/models`)

*   Arquivos de teste de modelo foram gerados automaticamente pelos scaffolds do Rails (ex: `discussion_test.rb`, `reply_test.rb`, `user_test.rb`).
*   **Status:** A maioria contém apenas o teste padrão `assert true` ou testes básicos de presença gerados automaticamente.
*   **Cobertura:** A cobertura de validações, associações e lógica de negócio específica dos modelos ainda é baixa e precisa ser expandida.

### 2.3. Testes de Integração (`test/integration`)

*   Nenhum teste de integração personalizado foi implementado até o momento.
*   Os testes de controller (`ActionDispatch::IntegrationTest`) cobrem fluxos de requisição/resposta, mas testes de integração mais amplos, cobrindo jornadas de usuário completas, não existem.

### 2.4. Testes de Sistema (`test/system`)

*   Nenhum teste de sistema (utilizando Capybara para simular interações de usuário no navegador) foi implementado.

### 2.5. Testes de Mailer (`test/mailers`)

*   Se mailers estiverem em uso (ex: para Devise ou notificações customizadas), testes para eles (ex: `user_mailer_test.rb`) precisam ser verificados ou criados.

### 2.6. Testes de Job (`test/jobs`)

*   Se jobs estiverem em uso, testes para eles precisam ser verificados ou criados.

## 3. Medição de Cobertura de Código (Code Coverage)

*   **Status:** Não Configurada.
*   Atualmente, não há uma ferramenta de medição de cobertura de código (como SimpleCov) configurada no projeto.
*   **Ação Necessária:** Implementar uma ferramenta de cobertura para obter métricas precisas sobre quais partes do código estão sendo exercitadas pelos testes.

## 4. Próximos Passos e Prioridades para Testes

1.  **Configurar Medição de Cobertura:** Integrar `SimpleCov` (ou similar) para visualizar a cobertura atual e identificar áreas críticas não testadas.
2.  **Expandir Testes de Modelo:** Adicionar testes para todas as validações, escopos, métodos de classe/instância e lógica de negócio nos modelos existentes (`User`, `Discussion`, `Reply`, etc.).
3.  **Revisar/Implementar Testes para Controllers Restantes:** Criar ou melhorar testes para controllers que ainda não possuem cobertura adequada.
4.  **Introduzir Testes de Sistema:** Começar a implementar testes de sistema para os fluxos de usuário mais críticos (ex: criar uma discussão, responder a uma discussão, login/logout).
5.  **Descomentar/Corrigir Teste Skipped:** Avaliar a necessidade da rota `show` para `Replies` e, se implementada, criar o teste correspondente ou remover o `skip` se a rota não for necessária.
6.  **CI com Relatório de Cobertura:** Ajustar o workflow de CI para falhar se a cobertura de testes cair abaixo de um determinado percentual (após a configuração inicial da ferramenta).

--- 