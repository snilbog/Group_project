class CreateFavoritesComments < ActiveRecord::Migration
  def change
    create_table :favorites_comments do |t|
      t.references :favorite, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
