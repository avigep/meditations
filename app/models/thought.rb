# == Schema Information
#
# Table name: thoughts
#
#  id           :bigint           not null, primary key
#  contents     :text(65535)
#  publish_date :date
#  read_time    :integer
#  title        :string(255)
#  visible      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Thought < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2 }
  validates :contents, presence: true, length: { minimum: 10 }

  before_save :calculate_read_time
  self.per_page = 10

  scope :visible, -> { where visible: true }

  def self.search(keyword:, public_view:)
    if public_view
      Thought.
        limit(10).
        visible.
        where("title LIKE :query OR contents LIKE :query", query: "%#{keyword}%")
    else
      Thought.limit(10).where("title LIKE :query OR contents LIKE :query", query: "%#{keyword}%")
    end
  end

  private

  def calculate_read_time
    words_per_minute = 150
    if read_time.blank?
      self.read_time = (contents.split.size / words_per_minute).to_i
    end
  end
end
