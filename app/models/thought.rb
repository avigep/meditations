class Thought < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }

  self.per_page = 10
end
