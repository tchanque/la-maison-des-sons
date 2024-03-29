class Event < ApplicationRecord
    CATEGORIES = ["atelier", "concert", "permanence", "stage", "scène_ouverte"]
    LEVEL = [1, 2, 3, 4, 5]

    belongs_to :creator, class_name: "User"
    
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances

    validates :creator, presence: true
    validates :category, presence: true
    validates :start_date, presence: true, if: :valid_date?
    validates :location, presence: true
    validates :price, numericality: { greater_than: 0 }


    def valid_date?
      return errors.add(:La_date, 'doit être renseignée.') && false unless start_date.present?
  
      if start_date < Date.today
        errors.add(:La_date, 'ne peut pas être passée.')
        return false
      end
  
      return true
  end



end
