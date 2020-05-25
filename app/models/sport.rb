class Sport < ApplicationRecord

  has_many :sport_users
  has_many :activities

  validates :name, inclusion: { in: %w[Basketball Tennis Football Running Volleyball Yoga] }

end
