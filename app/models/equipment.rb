class Equipment < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :available, presence: true
end
