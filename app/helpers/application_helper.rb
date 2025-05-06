module ApplicationHelper
  # Gera iniciais a partir do nome do usuário
  def user_initials(user)
    return '?' unless user && user.name.present?

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
    truncate(plain_text, length: length, separator: ' ', omission: '...')
  end
end
