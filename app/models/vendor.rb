class Vendor < ApplicationRecord
  has_many :expenses

  # Validations
  validates :vendor_name, presence: true
  validates :vendor_name, length: { minimum: 2 }
end
