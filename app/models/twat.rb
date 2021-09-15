class Twat < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :retwats, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_length_of :twat, minimum: 2, maximum: 140, allow_blank: true

  def liked?(user)
    !!self.likes.find { |like| like.user_id == user.id }
  end

  def retwatted?(user)
    !!self.retwats.find { |retwat| retwat.user_id == user.id }
  end

end
