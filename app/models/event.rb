class Event < ApplicationRecord
    CATEGORIES = ["Atelier", "Concert", "Permanence", "Stage", "Scène ouverte"]
    MUSIC_SHOWS = ["Concert", "Scène ouverte"]
    INSTRUMENTS = ["", "Basse", "Batterie", "Chant", "Guitare", "Harmonie", "MAO", "Piano", "Ukulelé"]
    LEVEL = [0, 1, 2, 3, 4, 5]

    belongs_to :creator, class_name: "User"
    
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances

    validates :creator, presence: true
    validates :category, presence: true
    validates :start_date, presence: true, if: :valid_date?
    validates :location, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :max_seats, numericality: { greater_than_or_equal_to: 0 }

    def valid_date?
      return errors.add(:La_date, 'doit être renseignée.') && false unless start_date.present?
  
      if start_date < Date.today
        errors.add(:La_date, 'ne peut pas être passée.')
        return false
      end
  
      return true
    end

    def get_image_filename
      # instance method of event, returns the path to the image for the event
      # depending on the category and instrument
      if MUSIC_SHOWS.include?(self.category)
        "#{self.category.downcase.tr(" ", "_")}.jpeg"
      else
        "#{self.instrument.downcase.tr(" ", "_")}.jpeg"
      end
    end

end
