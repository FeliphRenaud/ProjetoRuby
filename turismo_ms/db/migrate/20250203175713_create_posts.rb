class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :imagem
      t.string :titulo
      t.string :subtitulo
      t.text :descricao
      t.string :link
      t.string :palavra_chave

      t.timestamps
    end
  end
end
