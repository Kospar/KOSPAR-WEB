class CreateDesignDocuments < ActiveRecord::Migration
  def change
    create_table :design_documents do |t|
      t.string :title
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.column :files, :json 
      t.timestamps null: false
    end
  end
end
