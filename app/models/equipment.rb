class Equipment < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  belongs_to :category
end
