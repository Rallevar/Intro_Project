=begin
  Name: Nathan Keenan
  Program: Business Information Technology
  Course: WEBD-3011 (277098)
  Created: 2026-04-06
  Updated: 2024-04-13
=end

class Vendor < ApplicationRecord
  has_many :expenses
  has_many :accounts, through: :expenses
  has_many :wards, through: :expenses

  # Validations
  validates :vendor_name, presence: true
  validates :vendor_name, length: { minimum: 2 }
end
