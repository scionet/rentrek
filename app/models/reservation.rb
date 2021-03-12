class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validates :status, presence: true
end
