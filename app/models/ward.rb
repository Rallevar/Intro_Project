class Ward < ApplicationRecord
   has_many :expenses

   # Validations
  validates :ward_name, presence: true
  validates :population_total, numericality: { greater_than_or_equal_to: 0 }
end
