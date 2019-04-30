class AddUniquenessToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites, [:artwork_id, :user_id], unique: true
    add_index :favorites, :user_id
  end
end
