class CreateForumBoards < ActiveRecord::Migration
  def change
    create_table :forum_boards do |t|
      t.string :subject
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
