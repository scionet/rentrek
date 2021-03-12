class Equipment < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :price_per_day, presence: true, numericality: true
  # validates :available, presence: true
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
