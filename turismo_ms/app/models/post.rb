class Post < ApplicationRecord
  validates :link, format: { with: %r{\Ahttps?://\S+\z}, message: 'deve ser uma URL válida (http:// ou https://)' }
end
