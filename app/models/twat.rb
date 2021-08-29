class Twat < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :delete_all
  has_many :retwats, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  validates_length_of :twat, minimum: 2, maximum: 140, allow_blank: true

  def liked?(user)
    !!self.likes.find { |like| like.user_id == user.id }
  end

  def retwatted?(user)
    !!self.retwats.find { |retwat| retwat.user_id == user.id }
  end

end
