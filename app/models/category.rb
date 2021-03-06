class Category < ApplicationRecord
  has_many :equipment, dependent: :destroy

  validates :name, presence: true
end
