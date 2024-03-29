class Topic < ApplicationRecord
  has_one_attached :picture

  validates :title, presence: true
  validates :description, presence: true
end
