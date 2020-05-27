class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players
  has_many :activities
  has_many :activities_joined, through: :players, source: :activities
  has_many :sports, through: :sports_users

  validates :username, presence: true, uniqueness: true, length: { minimum: 3}
  validates :gender, presence: true, inclusion: { in: %w[Male Female] }
end
