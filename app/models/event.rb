class Event < ApplicationRecord
    CATEGORIES = ["atelier", "concert", "permanence", "stage", "scène_ouverte"]
    LEVEL = [1, 2, 3, 4, 5]

    belongs_to :creator, class_name: "User"
    
    has_many :attendances
    has_many :attendees, through: :attendances

    validates :creator, presence: true
    validates :category, presence: true
    validates :start_date, presence: true
    validates :location, presence: true

end
