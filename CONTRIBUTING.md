# Contributing to Discuza / Como Contribuir para o Discuza

**[English](#english-contribution-guide) | [Português](#guia-de-contribuição-em-português)**

---

<a name="english-contribution-guide"></a>
## English Contribution Guide

First off, thank you for considering contributing to Discuza! It's people like you that make Discuza such a great tool.

We welcome contributions of all kinds, from reporting bugs and suggesting enhancements to submitting pull requests for new features or bug fixes.

### How Can I Contribute?

#### Reporting Bugs

If you find a bug, please ensure the bug was not already reported by searching on GitHub under [Issues](https://github.com/magdielcardoso/discuza/issues).

If you're unable to find an open issue addressing the problem, [open a new one](https://github.com/magdielcardoso/discuza/issues/new). Be sure to include a **title and clear description**, as much relevant information as possible, and a **code sample** or an **executable test case** demonstrating the expected behavior that is not occurring.

#### Suggesting Enhancements

If you have an idea for a new feature or an improvement to an existing one, please start by searching the [Issues](https://github.com/magdielcardoso/discuza/issues) to see if the idea has already been discussed.

If not, [open a new issue](https://github.com/magdielcardoso/discuza/issues/new), providing a clear description of the proposed enhancement and why it would be valuable.

#### Pull Requests

We love pull requests! If you're planning to work on a new feature or a significant bug fix, it's usually a good idea to discuss it in an issue first to ensure it aligns with the project's goals.

**Steps to contribute code:**

1.  **Fork the repository:** Click the "Fork" button on the top right of the [Discuza repository page](https://github.com/magdielcardoso/discuza).
2.  **Clone your fork:**
    ```bash
    git clone https://github.com/YOUR_USERNAME/discuza.git
    cd discuza
    ```
3.  **Set up your development environment:** Follow the instructions in the [README.md](README.md#️-running-locally-manual-steps) (either using `make setup` or the manual steps).
4.  **Create a new branch:** Choose a descriptive name for your branch.
    ```bash
    git checkout -b feature/your-descriptive-feature-name
    # or
    git checkout -b fix/issue-number-short-description
    ```
5.  **Make your changes:** Write your code and add tests! Ensure all tests pass.
    ```bash
    # Run all tests
    rails test
    ```
6.  **Commit your changes:** Use clear and concise commit messages.
    ```bash
    git add .
    git commit -m "feat: Add my new feature"
    # or
    git commit -m "fix: Resolve issue #123 by doing X"
    ```
    (Consider using [Conventional Commits](https://www.conventionalcommits.org/) for commit messages.)
7.  **Push your branch:**
    ```bash
    git push origin feature/your-descriptive-feature-name
    ```
8.  **Open a Pull Request (PR):** Go to the original Discuza repository on GitHub and click the "New Pull Request" button. Fill out the PR template with details about your changes.

**Pull Request Guidelines:**

*   Ensure all tests pass (`rails test`).
*   Follow the existing code style (consider running linters if configured, e.g., RuboCop).
*   Provide a clear description of the problem and solution in the PR. Link to the relevant issue if applicable.
*   Keep PRs focused on a single issue or feature.

### Code of Conduct

This project adheres to a Code of Conduct. Please review it before contributing. *(Note: A `CODE_OF_CONDUCT.md` file should be added separately)*

### Questions?

If you have questions about contributing, feel free to reach out via email at [contato@stacklab.digital](mailto:contato@stacklab.digital) or join our WhatsApp group: [Discuza 💬 StackLab](https://chat.whatsapp.com/KpKcKRDUajV6t1UcjpHwyG).

Thank you for contributing!

---
<br>
<br>
---

<a name="guia-de-contribuição-em-português"></a>
## Guia de Contribuição em Português

Primeiramente, obrigado por considerar contribuir para o Discuza! São pessoas como você que fazem do Discuza uma ótima ferramenta.

Acolhemos contribuições de todos os tipos, desde o relato de bugs e sugestões de melhorias até o envio de pull requests para novas funcionalidades ou correções de bugs.

### Como Posso Contribuir?

#### Relatando Bugs

Se você encontrar um bug, por favor, certifique-se de que ele já não foi relatado procurando nas [Issues](https://github.com/magdielcardoso/discuza/issues) do GitHub.

Se não encontrar uma issue aberta abordando o problema, [abra uma nova](https://github.com/magdielcardoso/discuza/issues/new). Certifique-se de incluir um **título e descrição claros**, o máximo de informação relevante possível, e um **exemplo de código** ou um **caso de teste executável** demonstrando o comportamento esperado que não está ocorrendo.

#### Sugerindo Melhorias

Se você tem uma ideia para uma nova funcionalidade ou uma melhoria para uma existente, por favor, comece pesquisando nas [Issues](https://github.com/magdielcardoso/discuza/issues) para ver se a ideia já foi discutida.

Caso contrário, [abra uma nova issue](https://github.com/magdielcardoso/discuza/issues/new), fornecendo uma descrição clara da melhoria proposta e por que ela seria valiosa.

#### Pull Requests

Adoramos pull requests! Se você está planejando trabalhar em uma nova funcionalidade ou uma correção de bug significativa, geralmente é uma boa ideia discuti-la em uma issue primeiro para garantir que ela esteja alinhada com os objetivos do projeto.

**Passos para contribuir com código:**

1.  **Faça um fork do repositório:** Clique no botão "Fork" no canto superior direito da [página do repositório Discuza](https://github.com/magdielcardoso/discuza).
2.  **Clone o seu fork:**
    ```bash
    git clone https://github.com/magdielcardoso/discuza.git
    cd discuza
    ```
3.  **Configure seu ambiente de desenvolvimento:** Siga as instruções no [README.md](README.md#️-rodando-localmente-passos-manuais) (usando `make setup` ou os passos manuais).
4.  **Crie uma nova branch:** Escolha um nome descritivo para sua branch.
    ```bash
    git checkout -b feature/seu-nome-de-feature-descritivo
    # ou
    git checkout -b fix/numero-issue-descricao-curta
    ```
5.  **Faça suas alterações:** Escreva seu código e adicione testes! Garanta que todos os testes passem.
    ```bash
    # Rode todos os testes
    rails test
    ```
6.  **Faça o commit de suas alterações:** Use mensagens de commit claras e concisas.
    ```bash
    git add .
    git commit -m "feat: Adiciona minha nova feature"
    # ou
    git commit -m "fix: Resolve issue #123 fazendo X"
    ```
    (Considere usar [Conventional Commits](https://www.conventionalcommits.org/) para as mensagens de commit.)
7.  **Envie sua branch:**
    ```bash
    git push origin feature/seu-nome-de-feature-descritivo
    ```
8.  **Abra um Pull Request (PR):** Vá para o repositório original do Discuza no GitHub e clique no botão "New Pull Request". Preencha o template do PR com detalhes sobre suas alterações.

**Diretrizes para Pull Requests:**

*   Garanta que todos os testes passem (`rails test`).
*   Siga o estilo de código existente (considere rodar linters se configurados, ex: RuboCop).
*   Forneça uma descrição clara do problema e da solução no PR. Link para a issue relevante, se aplicável.
*   Mantenha os PRs focados em uma única issue ou funcionalidade.

### Código de Conduta

Este projeto adere a um Código de Conduta. Por favor, revise-o antes de contribuir. *(Nota: Um arquivo `CODE_OF_CONDUCT.md` deve ser adicionado separadamente)*

### Dúvidas?

Se você tiver dúvidas sobre como contribuir, sinta-se à vontade para entrar em contato pelo email [contato@stacklab.digital](mailto:contato@stacklab.digital) ou junte-se ao nosso grupo no WhatsApp: [Discuza 💬 StackLab](https://chat.whatsapp.com/KpKcKRDUajV6t1UcjpHwyG).

Obrigado por contribuir! 