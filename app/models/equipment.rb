class Equipment < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_one_attached :photo
  belongs_to :user
  belongs_to :category

  include PgSearch::Model
  pg_search_scope :search_by_equipment_name,
    against: [ :name, 'A' ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
