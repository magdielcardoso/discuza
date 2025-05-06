# Git Hooks Gerenciados pelo Overcommit

Este documento registra os Git Hooks que planejamos utilizar neste projeto, gerenciados pela gem `overcommit`.

## Hooks Ativos

-   **`pre-commit`**:
    -   **Objetivo:** Executar verificações rápidas antes de cada commit para garantir a qualidade e consistência do código.
    -   **Verificações comuns:**
        -   Linter (ex: RuboCop)
        -   Formatador de código (se aplicável)
        -   Verificação de sintaxe básica
        -   Detecção de conflitos de merge não resolvidos
        -   Detecção de segredos/chaves acidentais

-   **`pre-push`**:
    -   **Objetivo:** Executar verificações mais abrangentes antes de enviar o código para o repositório remoto.
    -   **Verificações comuns:**
        -   Suíte de testes completa (ou um subconjunto rápido e essencial)
        -   Verificações de segurança mais profundas
        -   Garantir que a branch local está atualizada com a remota (se desejado)

## Ferramenta de Gerenciamento

Utilizaremos a gem [`overcommit`](https://github.com/overcommit/overcommit) para gerenciar a instalação e execução desses hooks de forma padronizada para todos os contribuidores. A configuração específica das verificações para cada hook será definida no arquivo `.overcommit.yml`. 