class Comment < ApplicationRecord
  belongs_to :twat
  validates :body, presence: true
end
