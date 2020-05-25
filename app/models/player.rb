class Player < ApplicationRecord
  belongs_to :activity
  belongs_to :user

  validates :invitation, inclusion: { in: [true, false] }
end
