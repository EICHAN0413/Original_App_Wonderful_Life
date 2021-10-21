class Comment < ApplicationRecord
  belongs_to :post
  validates :content, presence: true
  belongs_to :user, optional: true
end
