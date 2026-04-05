class Ward < ApplicationRecord
   has_many :expenses
   has_many :vendors, through: :expenses

   # Validations
  validates :ward_name, presence: true
  validates :total_population, numericality: { greater_than_or_equal_to: 0 }
end
