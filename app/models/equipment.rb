class Equipment < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  belongs_to :category
end
