class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false, index: true
      t.integer :artwork_id, null: false, index: true
      t.string :body, null: false
    end
  end
end
