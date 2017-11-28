class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|
      t.string :title
      t.string :category
      t.text :content
      t.string :image
      t.references :reply, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
