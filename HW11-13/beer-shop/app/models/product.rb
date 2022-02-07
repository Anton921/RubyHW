class Product < ApplicationRecord
    def to_param
      title
    end
end