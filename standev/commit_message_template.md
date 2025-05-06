# Modelo de Mensagem de Commit (Baseado em Conventional Commits)

# Formato Geral:
# <tipo>(<escopo opcional>): <descrição curta>
#
# <corpo opcional>
#
# <rodapé opcional>

# --- Instruções ---
#
# Tipo:
#   - feat: Uma nova funcionalidade (feature)
#   - fix: Uma correção de bug (bug fix)
#   - docs: Mudanças apenas na documentação
#   - style: Mudanças que não afetam o significado do código (espaços, formatação, ponto e vírgula ausente, etc)
#   - refactor: Uma alteração de código que não corrige um bug nem adiciona uma feature
#   - perf: Uma alteração de código que melhora o desempenho
#   - test: Adicionando testes ausentes ou corrigindo testes existentes
#   - chore: Mudanças no processo de build ou em ferramentas auxiliares e bibliotecas como geração de documentação
#   - ci: Mudanças nos arquivos e scripts de configuração de CI (ex: GitHub Actions)
#   - build: Mudanças que afetam o sistema de build ou dependências externas (ex: Gemfile, package.json)
#   - revert: Reverte um commit anterior
#
# Escopo (Opcional):
#   O escopo pode ser qualquer coisa que especifique o local da alteração do commit.
#   Exemplos: (DiscussionsController), (RepliesModel), (AuthSystem), (NavbarComponent)
#
# Descrição Curta:
#   - Use o imperativo, tempo presente: "muda" não "mudou" nem "mude".
#   - Não capitalize a primeira letra.
#   - Sem ponto (.) no final.
#   - Limite a 50 caracteres, se possível.
#
# Corpo (Opcional):
#   - Assim como na descrição curta, use o imperativo, tempo presente.
#   - Inclua a motivação para a mudança e os contrastes com o comportamento anterior.
#   - Use linhas de 72 caracteres.
#
# Rodapé (Opcional):
#   - Para Breaking Changes: Comece com `BREAKING CHANGE:` seguido por uma descrição da mudança, justificativa e notas de migração.
#   - Para referenciar issues: `Refs: #123`, `Closes: #123`, `Fixes: #123`.
#
# --- Template (descomente e preencha abaixo) ---
#
# <tipo>(<escopo>): <descrição>
#
# opcional corpo explicando mais detalhes...
#
# opcional rodapé para BREAKING CHANGE ou issue...
#

# --- Exemplo Prático ---
#
# feat(AuthSystem): adiciona login com OAuth2 via Google
#
# Implementa o fluxo de autenticação OAuth2 para permitir que os usuários
# façam login usando suas contas do Google. Isso simplifica o processo de
# registro e login para novos usuários.
#
# Closes: #42
#

# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
# `user.user_notification_preferences`.
#

# --- Exemplo de Refactor sem Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# --- Exemplo de Fix ---
#
# fix(DiscussionsController): corrige erro ao tentar fechar discussão sem respostas
#
# O método close estava tentando acessar `discussion.replies.last` o que causava
# um NoMethodError se não houvesse respostas. Adicionada verificação para
# lidar com este caso.
#
# Refs: #78
#

# --- Exemplo de Refactor com Breaking Change ---
#
# refactor(UserProfile): reestrutura dados do perfil do usuário
#
# Os campos `firstName` e `lastName` foram combinados em um único campo `fullName`.
# As preferências de notificação foram movidas para uma nova tabela `UserNotificationPreferences`.
#
# BREAKING CHANGE: O schema do usuário mudou. APIs que consomem dados do usuário
# precisarão ser atualizadas para usar o campo `fullName` em vez de `firstName` e `lastName`.
# As preferências de notificação agora devem ser consultadas através da associação
 