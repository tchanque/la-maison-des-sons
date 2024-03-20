class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    
    has_many :attendances
    has_many :attendees, through: :attendances

    validates :creator, presence: true
    validates :category, presence: true
    validates :start_date, presence: true
    validates :location, presence: true
end
