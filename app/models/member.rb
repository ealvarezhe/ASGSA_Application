class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  # Validate presence of essential attributes
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :position, presence: true
  validates :date_joined, presence: true
  validates :degree, presence: true
  validates :food_allergies, presence: true
  has_many :attendees

  def self.from_google(email:, first_name:, last_name:, uid:, avatar_url:)
    return nil unless email =~ /@tamu.edu\z/
    create_with(uid: uid, first_name: first_name, last_name: last_name, avatar_url: avatar_url, points: 0, position: "Test", date_joined: Time.current, degree: "MS", food_allergies: "None").find_or_create_by!(email: email)
  end
end
