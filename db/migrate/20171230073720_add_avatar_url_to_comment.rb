class AddAvatarUrlToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :avatar_url, :string
  end
end
