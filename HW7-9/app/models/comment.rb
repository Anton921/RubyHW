class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post, counter_cache: true
  validates :body, presence: true

  enum status: %i[unpublished published]

  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(status: 0) }
end
