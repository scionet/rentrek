class Category < ApplicationRecord
  has_many :equipment, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_category,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  
  validates :name, presence: true
end
