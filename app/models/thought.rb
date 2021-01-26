# == Schema Information
#
# Table name: thoughts
#
#  id           :bigint           not null, primary key
#  contents     :text(65535)
#  publish_date :date
#  read_time    :integer
#  title        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Thought < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :contents, presence: true, length: { minimum: 10 }

  self.per_page = 10
end
