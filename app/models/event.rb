class Event < ApplicationRecord
    CATEGORIES = ["atelier", "concert", "permanence", "stage", "scène_ouverte"]
    LEVEL = [1, 2, 3, 4, 5]

    belongs_to :creator, class_name: "User", dependent: :destroy
    
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances

    validates :creator, presence: true
    validates :category, presence: true
    validates :start_date, presence: true, if: :not_past_date?
    validates :location, presence: true
    validates :price, numericality: { greater_than: 0 }


def not_past_date?
  if self.start_date < Date.today
    errors.add(:La_date, 'ne peut pas être passée.')
  end
end
end
