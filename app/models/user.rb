class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_presence_of :email
  has_many :twats, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :retwats, dependent: :destroy
end
