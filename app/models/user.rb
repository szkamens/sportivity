class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  has_many :players
  has_many :activities

  #has_many :activities_joined, through: :players, source: :activities
  has_many :sport_users
  has_many :sports, through: :sport_users

  validates :username, presence: true, uniqueness: true, length: { minimum: 3}
  validates :gender, presence: true, inclusion: { in: %w[Male Female] }

  def activities_joined
    Player.where(user: self).map{ |player| player.activity }
  end
end
