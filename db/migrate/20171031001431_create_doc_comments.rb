class CreateDocComments < ActiveRecord::Migration
  def change
    create_table :doc_comments do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :design_document, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
