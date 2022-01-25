class AddEdited < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :edited
    add_column(:comments, :edited, :integer, default: 0)
  end
end
