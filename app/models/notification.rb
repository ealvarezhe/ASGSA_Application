class Notification < ApplicationRecord
  belongs_to :event
  validates :send_date, presence: true
  validates :send_time, presence: true
  validates :description, presence: true
end
