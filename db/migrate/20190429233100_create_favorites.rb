class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :artwork_id, null: false
      t.timestamps
    end
    remove_column :artworks, :favorite
    remove_column :artwork_shares, :favorite
  end
end
