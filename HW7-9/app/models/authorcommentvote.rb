class Authorcommentvote < ApplicationRecord
  belongs_to :author
  belongs_to :comment

  enum status: %i[disliked liked]

  scope :liked, -> { where(status: 1) }
  scope :disliked, -> { where(status: 0) }
end