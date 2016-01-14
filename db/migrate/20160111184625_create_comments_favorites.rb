class CreateCommentsFavorites < ActiveRecord::Migration
  def change
    create_table :comments_favorites do |t|
      t.references :comment, index: true, foreign_key: true
      t.references :favorite, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
