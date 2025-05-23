module ApplicationHelper
  # Gera iniciais a partir do nome do usuário
  def user_initials(user)
    return "?" unless user && user.name.present?

    names = user.name.split
    initials = names.first[0]
    initials += names.last[0] if names.size > 1
    initials.upcase
  end

  # Extrai um snippet de texto de um conteúdo ActionText
  def action_text_snippet(rich_text, length: 150)
    # Converte para texto plano e remove tags HTML residuais (exceto as básicas que action_text mantém)
    plain_text = rich_text.to_plain_text
    # Trunca o texto plano
    truncate(plain_text, length: length, separator: " ", omission: "...")
  end

  # Processa conteúdo de respostas, transformando links markdown em botões clicáveis
  def process_reply_content(content)
    return content unless content.respond_to?(:to_s)

    processed_content = content.to_s

    # Primeiro: Regex para encontrar links markdown de discussions: [text](/discussions/id)
    discussion_link_regex = /\[([^\]]+)\]\(\/discussions\/(\d+)\)/

    processed_content = processed_content.gsub(discussion_link_regex) do |match|
      link_text = $1
      discussion_id = $2

      # Cria um botão estilizado refinado para o link da discussion
      link_to discussion_path(discussion_id),
              class: "discussion-link inline-flex items-center gap-x-1.5 px-3 py-1.5 text-xs font-medium rounded-lg shadow-sm transition-all duration-200 hover:shadow-lg",
              style: "background: linear-gradient(135deg, var(--color-primary), var(--color-primary-dark)); color: white; text-decoration: none; margin: 2px 1px; border: 1px solid var(--color-primary-light);",
              data: { turbo: false } do
        content_tag(:span, link_text, class: "font-medium") +
        content_tag(:span, "→", class: "text-xs font-bold transition-transform duration-200 group-hover:translate-x-1")
      end
    end

    # Segundo: Regex para encontrar links simples de discussions: /discussions/id
    simple_discussion_regex = /(?<!\[)(?<!\()\/discussions\/(\d+)(?!\))/

    processed_content = processed_content.gsub(simple_discussion_regex) do |match|
      discussion_id = $1

      # Cria um botão estilizado refinado para o link da discussion (usando o ID como texto)
      link_to discussion_path(discussion_id),
              class: "discussion-link inline-flex items-center gap-x-1.5 px-3 py-1.5 text-xs font-medium rounded-lg shadow-sm transition-all duration-200 hover:shadow-lg",
              style: "background: linear-gradient(135deg, var(--color-primary), var(--color-primary-dark)); color: white; text-decoration: none; margin: 2px 1px; border: 1px solid var(--color-primary-light);",
              data: { turbo: false } do
        content_tag(:span, "Discussão ##{discussion_id}", class: "font-medium") +
        content_tag(:span, "→", class: "text-xs font-bold transition-transform duration-200 group-hover:translate-x-1")
      end
    end

    processed_content.html_safe
  end
end
