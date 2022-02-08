class Product < ApplicationRecord
  belongs_to :category

  def self.title_clasick
    Product.order(:title)
  end

  def self.title_back
    Product.order(title: :desc)
  end

  def self.price_low
    Product.order(:price)
  end

  def self.price_high
    Product.order(price: :desc)
  end

  def to_param
    "#{self.id}-#{self.title}"
  end
end