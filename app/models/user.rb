class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :players
  has_many :activites, through: :players
  has_many :sports, through: :sports_users

  validates :username, presence: true, uniqueness: true, length: { minimum: 4}, 
  validates :gender, presence: true, inclusion { in: %w(Man Lady)}
  validates :description, presence: true, length { minimum: 20}
end
