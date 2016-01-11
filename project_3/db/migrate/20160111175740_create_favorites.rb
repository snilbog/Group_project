class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :drink_id
      t.string :description
      t.string :img

      t.timestamps null: false
    end
  end
end
