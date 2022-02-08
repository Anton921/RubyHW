class Product < ApplicationRecord
  belongs_to :category

  def self.title_a_to_z
    Product.order(:title)
  end

  def self.title_z_to_a
    Product.order(title: :desc)
  end

  def self.price_low_to_high
    Product.order(:price)
  end

  def self.price_high_to_low
    Product.order(price: :desc)
  end

  def to_param
    "#{self.id}-#{self.title}"
  end
end