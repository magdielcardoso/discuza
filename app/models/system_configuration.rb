class SystemConfiguration < ApplicationRecord
  # Logo attachment using Active Storage
  has_one_attached :logo

  # Validations
  validates :site_name, presence: true, length: { maximum: 100 }
  validates :contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :site_description, length: { maximum: 500 }

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
      contact_email: "admin@devconnect.com"
    )
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
