class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :players

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :player_limit, presence: true, numericality: true
  validates :location, presence: true
  validates :skill_level, inclusion: { in: %w[Beginner Intermediate Pro] }
  validates :description, presence: true
  validates :sport, presence: true
  validates :user, presence: true
end
