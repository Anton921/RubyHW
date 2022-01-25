class CountView < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :counter_of_view, :integer, default: 0
  end
end
