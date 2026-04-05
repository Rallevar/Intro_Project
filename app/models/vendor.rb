class Vendor < ApplicationRecord
  has_many :expenses
  has_many :accounts, through: :expenses
  has_many :wards, through: :expenses

  # Validations
  validates :vendor_name, presence: true
  validates :vendor_name, length: { minimum: 2 }
end
