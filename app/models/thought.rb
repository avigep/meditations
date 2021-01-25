class Thought < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :contents, presence: true, length: { minimum: 10 }

  self.per_page = 10
end
