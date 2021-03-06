class Category < ApplicationRecord
  has_many :equipment, dependent: :destroy
end
