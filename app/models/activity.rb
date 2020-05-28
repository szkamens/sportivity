class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  has_many :players, :dependent => :delete_all
  has_many :users, through: :players


  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :player_limit, presence: true, numericality: true
  validates :location, presence: true
  validates :skill_level, inclusion: { in: %w[Beginner Intermediate Pro] }
  validates :description, presence: true
  validates :sport, presence: true
  validates :user, presence: true


  def is_owner?(user)
    self.user == user
  end

  def is_player?(user)
    self.users.include?(user)
  end

  def add_player(user, invitation = false)
    Player.create!(user: user, activity: self, invitation: invitation)
  end
end
