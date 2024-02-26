class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  pg_search_scope :search, against: [:member_id, :first_name, :last_name, :email, :position, :points, :date_joined, :res_topic], using: { tsearch: { prefix: true } }
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
  has_many :attendees, dependent: :destroy
  has_many :member_roles, dependent: :destroy
  has_many :roles, through: :member_roles

  def admin?
    member_roles.exists?(role_id: Role.find_by(name: 'Admin').id)
  end

  def officer?
    member_roles.exists?(role_id: Role.find_by(name: 'Officer').id)
  end

  def member?
    member_roles.exists?(role_id: Role.find_by(name: 'Member').id)
  end

  def self.from_google(email:, first_name:, last_name:, uid:, avatar_url:)
    first_time = !Member.exists?(email: email)
    return nil unless email =~ /@tamu.edu\z/
    member = create_with(uid: uid, first_name: first_name, last_name: last_name, avatar_url: avatar_url, points: 0, position: "Member", date_joined: Time.current, degree: "MS", food_allergies: "None").find_or_create_by!(email: email)
    admin_role_id = Role.find_by(name: 'Admin').id
    MemberRole.find_or_create_by!(member_id: member.member_id, role_id: admin_role_id) if first_time
    [member, first_time]
  end
end
