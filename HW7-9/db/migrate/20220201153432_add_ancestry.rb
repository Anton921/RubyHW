class AddAncestry < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :ancestry, :string
    add_index :comments, :ancestry
    add_column :comments, :parent_id, :integer
  end
end
