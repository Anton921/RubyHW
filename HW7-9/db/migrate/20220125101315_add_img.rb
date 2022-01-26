class AddImg < ActiveRecord::Migration[6.1]
  def change
    add_column(:authors, :image, :string, default: 'https://workinnet.ru/wp-content/uploads/2019/06/lazy-load.jpg')
    add_column(:comments, :edited, :string, default: 0)
  end
end
