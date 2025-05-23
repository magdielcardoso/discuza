class SystemConfiguration < ApplicationRecord
  # Logo attachment using Active Storage
  has_one_attached :logo

  # Validations
  validates :site_name, presence: true, length: { maximum: 100 }
  validates :contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :site_description, length: { maximum: 500 }
  validates :primary_color, inclusion: { in: %w[lime green blue indigo purple pink red orange amber yellow emerald teal cyan sky violet rose] }
  validates :ai_name, presence: true, length: { maximum: 50 }

  # Logo validations
  validate :logo_format, if: -> { logo.attached? }
  validate :logo_size, if: -> { logo.attached? }

  # Singleton pattern - only one configuration should exist
  validates :id, uniqueness: true, allow_nil: true

  # Class method to get or create the single instance
  def self.instance
    first_or_create(
      site_name: "DevConnect",
      site_description: "Uma plataforma para desenvolvedores compartilharem conhecimento e experiências.",
      contact_email: "admin@devconnect.com",
      primary_color: "lime",
      ai_name: "Discuza AI"
    )
  end

  # Available color options for the primary theme
  def self.color_options
    [
      [ "Verde Lima (Padr\u00E3o)", "lime" ],
      [ "Verde", "green" ],
      [ "Azul", "blue" ],
      [ "\u00CDndigo", "indigo" ],
      [ "Roxo", "purple" ],
      [ "Rosa", "pink" ],
      [ "Vermelho", "red" ],
      [ "Laranja", "orange" ],
      [ "\u00C2mbar", "amber" ],
      [ "Amarelo", "yellow" ],
      [ "Esmeralda", "emerald" ],
      [ "Turquesa", "teal" ],
      [ "Ciano", "cyan" ],
      [ "Azul C\u00E9u", "sky" ],
      [ "Violeta", "violet" ],
      [ "Rosa Suave", "rose" ]
    ]
  end

  # Get CSS variables for the current primary color
  def primary_color_variables
    case primary_color || "lime"
    when "lime"
      {
        primary: "#84cc16",      # lime-500
        primary_dark: "#65a30d", # lime-600
        primary_light: "#a3e635" # lime-400
      }
    when "green"
      {
        primary: "#22c55e",      # green-500
        primary_dark: "#16a34a", # green-600
        primary_light: "#4ade80" # green-400
      }
    when "blue"
      {
        primary: "#3b82f6",      # blue-500
        primary_dark: "#2563eb", # blue-600
        primary_light: "#60a5fa" # blue-400
      }
    when "indigo"
      {
        primary: "#6366f1",      # indigo-500
        primary_dark: "#4f46e5", # indigo-600
        primary_light: "#818cf8" # indigo-400
      }
    when "purple"
      {
        primary: "#a855f7",      # purple-500
        primary_dark: "#9333ea", # purple-600
        primary_light: "#c084fc" # purple-400
      }
    when "pink"
      {
        primary: "#ec4899",      # pink-500
        primary_dark: "#db2777", # pink-600
        primary_light: "#f472b6" # pink-400
      }
    when "red"
      {
        primary: "#ef4444",      # red-500
        primary_dark: "#dc2626", # red-600
        primary_light: "#f87171" # red-400
      }
    when "orange"
      {
        primary: "#f97316",      # orange-500
        primary_dark: "#ea580c", # orange-600
        primary_light: "#fb923c" # orange-400
      }
    when "amber"
      {
        primary: "#f59e0b",      # amber-500
        primary_dark: "#d97706", # amber-600
        primary_light: "#fbbf24" # amber-400
      }
    when "yellow"
      {
        primary: "#eab308",      # yellow-500
        primary_dark: "#ca8a04", # yellow-600
        primary_light: "#facc15" # yellow-400
      }
    when "emerald"
      {
        primary: "#10b981",      # emerald-500
        primary_dark: "#059669", # emerald-600
        primary_light: "#34d399" # emerald-400
      }
    when "teal"
      {
        primary: "#14b8a6",      # teal-500
        primary_dark: "#0d9488", # teal-600
        primary_light: "#2dd4bf" # teal-400
      }
    when "cyan"
      {
        primary: "#06b6d4",      # cyan-500
        primary_dark: "#0891b2", # cyan-600
        primary_light: "#22d3ee" # cyan-400
      }
    when "sky"
      {
        primary: "#0ea5e9",      # sky-500
        primary_dark: "#0284c7", # sky-600
        primary_light: "#38bdf8" # sky-400
      }
    when "violet"
      {
        primary: "#8b5cf6",      # violet-500
        primary_dark: "#7c3aed", # violet-600
        primary_light: "#a78bfa" # violet-400
      }
    when "rose"
      {
        primary: "#f43f5e",      # rose-500
        primary_dark: "#e11d48", # rose-600
        primary_light: "#fb7185" # rose-400
      }
    else
      # Default to lime if invalid color
      {
        primary: "#84cc16",
        primary_dark: "#65a30d",
        primary_light: "#a3e635"
      }
    end
  end

  private

  def logo_format
    return unless logo.attached?

    acceptable_types = [ "image/jpeg", "image/png", "image/gif", "image/svg+xml", "image/webp" ]
    unless acceptable_types.include?(logo.content_type)
      errors.add(:logo, "deve ser uma imagem v\u00E1lida (JPEG, PNG, GIF, SVG ou WebP)")
    end
  end

  def logo_size
    return unless logo.attached?

    if logo.byte_size > 2.megabytes
      errors.add(:logo, "deve ter no m\u00E1ximo 2MB")
    end
  end
end
