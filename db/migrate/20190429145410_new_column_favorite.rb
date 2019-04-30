class NewColumnFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :favorite, :boolean, default: false
    add_column :artwork_shares, :favorite, :boolean, default: false

    change_column_null :likes, :like_type, false
    change_column_null :likes, :like_id, false
    change_column_null :likes, :user_id, false
  end
end
