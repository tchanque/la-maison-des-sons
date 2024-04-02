class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances, foreign_key: 'attendee_id', dependent: :destroy
  has_many :events, through: :attendances
  # to delete a user + events he is linked to
  has_many :events, foreign_key: 'creator_id', dependent: :destroy

  validates :password, presence: true, length: { minimum: 6 }, on: :create
  
  after_create :welcome_email

  def welcome_email
    pass = SecureRandom.hex(6)
    update(password: pass, password_confirmation: pass)
    UserMailer.welcome_email(self, pass).deliver_now
  end

end
