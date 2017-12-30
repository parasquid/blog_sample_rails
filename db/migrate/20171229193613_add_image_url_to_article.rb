class AddImageUrlToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :image_url, :string
  end
end
