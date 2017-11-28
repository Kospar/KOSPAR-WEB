class CreateOpenComments < ActiveRecord::Migration
  def change
    create_table :open_comments do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :opensrc, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
