class AddAnswerToQnas < ActiveRecord::Migration
  def change
    add_column :qnas, :answer, :boolean
  end
end
