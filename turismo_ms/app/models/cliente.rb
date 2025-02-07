class Cliente < ApplicationRecord
  has_secure_password

  validates :nome, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }, format: {
    with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+\z/,
    message: 'deve conter pelo menos uma letra maiúscula, uma minúscula, um número e um caractere especial.'
  }
end
