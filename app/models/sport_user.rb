class SportUser < ApplicationRecord
  belongs_to :user
  belongs_to :sport

   validates :skilllevel, inclusion: { in: %w[Beginner Average Advanced] }
end
