class Post < ApplicationRecord

    validates :link, format: { with: /\Ahttps?:\/\/[\S]+\z/, message: "deve ser uma URL válida (http:// ou https://)" }

      
end
