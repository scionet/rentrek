class Equipment < ApplicationRecord
  has_many :reservations
  belongs_to :category
  belongs_to :user
end
