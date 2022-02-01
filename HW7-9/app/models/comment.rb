class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :post, counter_cache: true
  has_many :authorcommentvotes, dependent: :destroy
  validates :body, presence: true
  has_ancestry

  enum status: %i[unpublished published]

  scope :published, -> { where(status: 1) }
  scope :unpublished, -> { where(status: 0) }
end
