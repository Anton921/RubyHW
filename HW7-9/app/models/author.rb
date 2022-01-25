class Author < ApplicationRecord
  has_many :posts,  dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password

  before_save :downcase_email

  def full_name
    "#{first_name} #{last_name}"
  end

  def downcase_email
    self.email = email.downcase
  end
end
