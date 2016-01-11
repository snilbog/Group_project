class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :drink_id
      t.string :content

      t.timestamps null: false
    end
  end
end
