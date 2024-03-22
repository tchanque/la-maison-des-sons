class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attendances
  has_many :events, through: :attendances

  validates :password, presence: true, length: { minimum: 6 }, on: :create
  
  # after_create :welcome_email

  def welcome_email
    pass = SecureRandom.hex(6)
    update(password: pass, password_confirmation: pass)
    UserMailer.welcome_email(self, pass).deliver_now
  end

end
