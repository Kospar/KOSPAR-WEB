class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :title
      t.string :category
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.column :files, :json 

      t.timestamps null: false
    end
  end
end
