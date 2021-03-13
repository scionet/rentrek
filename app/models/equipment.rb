class Equipment < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
  belongs_to :category


  include PgSearch::Model
  pg_search_scope :search_by_equipment_name,
    against: [ :name ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :price_per_day, presence: true, numericality: true
  # validates :available, presence: true
  validates :location, presence: true
  validates :photos, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
